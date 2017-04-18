//
//  RITL_AVCaptureManager.m
//  CityBao
//
//  Created by YueWen on 2016/9/26.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "RITLAVCaptureManager.h"
#import <objc/runtime.h>
#import <AVFoundation/AVFoundation.h>

static NSString * requestAlertBlock;
static NSString * const requestTitleDefault = @"请在iOS\"设置-隐私-相机”选项中允许“潍V”访问你的相机";

@implementation RITL_AVCaptureManager

@end



#ifdef __IPHONE_8_0
@implementation RITL_AVCaptureManager (RITL_ViewController)
#else
@implementation RITL_AVCaptureManager (RITL_ViewController)<UIAlertViewDelegate>
#endif


// 检测权限
-(void)checkCaptureStatusWithViewController:(UIViewController *)viewController title:(NSString *)requestTitle authorizeBlock:(void (^)(void))authorizedBlock alertSureBlock:(nonnull void (^)(void))alertBlock
{
    void (^copyBlock)(void) = [authorizedBlock copy];
    void (^copyAlertBlock)(void) = [alertBlock copy];
    
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo])
    {
        case AVAuthorizationStatusAuthorized:authorizedBlock();break; //允许获取权限
            
        case AVAuthorizationStatusNotDetermined://权限位置
        {
            //请求权限
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
               
                if (granted == true)
                {
                    copyBlock();
                }
            }];
        }
            break;
        
        //出现错误以及禁止权限
        case AVAuthorizationStatusRestricted:
        case AVAuthorizationStatusDenied:
        {
            //获得当前的Title
            NSString * title = (requestTitle == nil ? requestTitleDefault : requestTitle);
            
            if (requestTitle) self.requestCameraTitle = requestTitle;
            
#ifdef __IPHONE_8_0
            //弹出AlertController
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //执行block
                copyAlertBlock();
            
            }]];
            
            [viewController presentViewController:alertController animated:true completion:^{}];
#else
            //进行赋值
            objc_setAssociatedObject(self, &requestAlertBlock, alertBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
            
            UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            [alertView show];
#endif
        }
            
        default:
            break;
    }
}

#ifndef __IPHONE_8_0

#pragma mark - <UIAlertViewDelegate>

- (void)alertViewCancel:(UIAlertView *)alertView
{
    //执行block
    id block = objc_getAssociatedObject(self, &requestAlertBlock);
    
    if (block)
    {
        //强转并执行block
        ((void(^)(void))block)();
    }
    
}

#endif


-(void)dealloc
{
#ifndef __IPHONE_8_0
   objc_removeAssociatedObjects(self);
#endif
}


-(void)checkCaptureStatusWithtTtle:(NSString *)requestTitle authorizeBlock:(void (^)(void))authorizedBlock alertSureBlock:(void (^)(NSString *))alertBlock
{
    void (^copyBlock)(void) = [authorizedBlock copy];
    void (^copyAlertBlock)(NSString *) = [alertBlock copy];
    
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo])
    {
        case AVAuthorizationStatusAuthorized:authorizedBlock();break; //允许获取权限
            
        case AVAuthorizationStatusNotDetermined://权限位置
        {
            //请求权限
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                
                if (granted == true)
                {
                    copyBlock();
                }
            }];
        }
            break;
            
            //出现错误以及禁止权限
        case AVAuthorizationStatusRestricted:
        case AVAuthorizationStatusDenied:
        {
            //获得当前的Title
            NSString * title = (requestTitle == nil ? requestTitleDefault : requestTitle);
            
            if (requestTitle) self.requestCameraTitle = requestTitle;
            
            copyAlertBlock(title);
        }
            
        default:
            break;
    }
}

@end
