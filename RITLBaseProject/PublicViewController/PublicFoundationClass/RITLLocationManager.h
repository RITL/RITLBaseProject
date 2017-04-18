//
//  RITL_LocationManager.h
//  CityBao
//
//  Created by YueWen on 16/9/1.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//更新当前定位位置
typedef void(^UpdateLocationBlock)(CLLocation * location);
typedef void(^UpdateFailtureBlock)(NSString * error);

//地理反编译
typedef void(^ReverseGeocodeSuccessBlock)(NSString * locationtitle);


@interface RITL_LocationManager : NSObject

/** 更新当地位置，成功回调位置，失败返回原因 */
- (void)updateLocationComplete:(UpdateLocationBlock)locationCompleteBlock
                 failtureBlock:(UpdateFailtureBlock)failtureBlockHandle;


/** 地理反编译，成功返回当前位置字符串 */
- (void)reverseGeocodeLocation:(CLLocation *)location
                      Complete:(ReverseGeocodeSuccessBlock)successBlockHandle
                      Failture:(UpdateFailtureBlock)failtureBlock;

@end



@interface RITL_LocationManager (RITL_ViewController)


/**
 *  检测当前应用的地理权限
 *
 *  @param viewController  当前的控制器
 *  @param requestTitle    请求的文字标题,默认为"请打开系统设置中“隐私→定位服务”，允许“XX”使用您的位置。"
 *  @param authorizedBlock 权限获取成功的标题
 */
- (void)checkLocationStatusWithViewController:(UIViewController *)viewController title:(nullable NSString *)requestTitle authorizeBlock:(void(^)(void))authorizedBlock NS_AVAILABLE_IOS(8_0);

@end


NS_ASSUME_NONNULL_END


