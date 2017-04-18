//
//  RITL_LocationManager.m
//  CityBao
//
//  Created by YueWen on 16/9/1.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "RITLLocationManager.h"
#import <objc/runtime.h>

static NSString * requestAutorBlock;

@interface RITL_LocationManager()<CLLocationManagerDelegate>

@property (nonatomic, copy) UpdateLocationBlock successBlock;
@property (nonatomic, copy) UpdateFailtureBlock failtureBlock;
@property (nonatomic, strong) CLLocationManager * locationManager;

@end

@implementation RITL_LocationManager

//更新当前的地理位置
-(void)updateLocationComplete:(UpdateLocationBlock)locationCompleteBlock failtureBlock:(UpdateFailtureBlock)failtureBlockHandle
{
    //设置block
    self.successBlock = locationCompleteBlock;
    self.failtureBlock = failtureBlockHandle;
    
    self.locationManager  = [[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    
    //检测当前状态
    if([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];return;
    }
    
#ifdef __IPHONE_9_0
    [self.locationManager requestLocation];//开始更新
#else
    [self.locationManager startUpdatingLocation];
#endif
}

-(void)dealloc
{
    self.locationManager.delegate = nil;
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

//进行反地理编译
-(void)reverseGeocodeLocation:(CLLocation *)location Complete:(nonnull ReverseGeocodeSuccessBlock)successBlockHandle Failture:(nonnull UpdateFailtureBlock)failtureBlock
{
    CLGeocoder * geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if ( error!= nil )
        {
            failtureBlock(error.localizedDescription);return;
        }
        
        successBlockHandle(placemarks.firstObject.addressDictionary[@"name"]);
        
    }];
    
}


#pragma mark - <CLLocationManagerDelegate>

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (self.failtureBlock)
        self.failtureBlock(error.localizedDescription);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [manager stopUpdatingLocation];//停止定位
    if(self.successBlock)
        self.successBlock(locations.lastObject);
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways:
        {
#ifndef __IPHONE_9_0
            [manager startUpdatingLocation];
#else
            [manager requestLocation];
#endif
            //获得block
            void(^block)(void) = objc_getAssociatedObject(self, &requestAutorBlock);
            
            if (block != nil)
            {
                //执行
                block();
                
                //remove
                objc_setAssociatedObject(self, &requestAutorBlock, nil, OBJC_ASSOCIATION_ASSIGN);
            }
            
        }
            break;
        case kCLAuthorizationStatusNotDetermined:
            [manager requestAlwaysAuthorization];break;
        default:
            break;
    }
}

@end


@implementation RITL_LocationManager (RITL_ViewController)

-(void)checkLocationStatusWithViewController:(UIViewController *)viewController title:(NSString *)requestTitle authorizeBlock:(void (^)(void))authorizedBlock
{
    __weak typeof(viewController) weakViewController = viewController;
    
    switch ([CLLocationManager authorizationStatus])
    {
            //表示定位允许
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways:
        {
            //执行回调
            authorizedBlock();
        }
            
            break;
            
            //表示定位不允许,需要弹出Alert
        case kCLAuthorizationStatusNotDetermined:
        {
            objc_setAssociatedObject(self, &requestAutorBlock, authorizedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
//            [self.locationManager requestAlwaysAuthorization];
            
        }
            break;
            
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
        {
            
            //check requestTitle
            if (requestTitle == nil)
            {
                requestTitle = @"请打开系统设置中“隐私→定位服务”，允许“潍V”使用您的位置。";
            }
            
            
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:requestTitle
                                                                                      message:nil
                                                                               preferredStyle:UIAlertControllerStyleAlert];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}]];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
#ifdef __IPHONE_10_0
                if ([UIDevice currentDevice].systemVersion.floatValue >= 10.0) {
                
                    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{UIApplicationOpenURLOptionUniversalLinksOnly : @true} completionHandler:^(BOOL success) {}];
                }
                
#else
                //跳入当前App设置界面
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
#endif
            }]];
            
            [weakViewController presentViewController:alertController animated:true completion:^{}];
        }
            break;
        default:
            break;
    }
}

@end
