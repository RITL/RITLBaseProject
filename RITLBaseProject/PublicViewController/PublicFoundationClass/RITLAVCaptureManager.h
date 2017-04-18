//
//  RITL_AVCaptureManager.h
//  CityBao
//
//  Created by YueWen on 2016/9/26.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_CLASS_AVAILABLE_IOS(7_0) @interface RITL_AVCaptureManager : NSObject

/// @brief 请求位置显示的信息，默认为"请在iOS\"设置-隐私-相机”选项中允许“XX”访问你的相机"
@property (nullable ,nonatomic, copy)NSString * requestCameraTitle;

@end


@interface RITL_AVCaptureManager (RITL_ViewController)

/**
 *  检测当前应用的相机
 *
 *  @param viewController  当前的控制器
 *  @param requestTitle    请求的文字标题,默认是“请在iOS\"设置-隐私-相机”选项中允许“XX”访问你的相机"
 *  @param authorizedBlock 权限获取成功的代码块
 *  @param alertBlock  Alert点击确认进行的回调
 */
- (void)checkCaptureStatusWithViewController:(UIViewController *)viewController
                                       title:(nullable NSString *)requestTitle
                              authorizeBlock:(void(^)(void))authorizedBlock
                              alertSureBlock:(void(^)(void))alertBlock;





/**
 检测当前应用的相机 (ViewModel使用) 
 2016-11-22 拓展

 @param requestTitle 请求的文字标题,默认是“请在iOS\"设置-隐私-相机”选项中允许“XX”访问你的相机"
 @param authorizedBlock 权限获取成功的代码块
 @param alertBlock 需要弹出alertController的回调
 */
- (void)checkCaptureStatusWithtTtle:(nullable NSString *)requestTitle
                     authorizeBlock:(void (^)(void))authorizedBlock
                     alertSureBlock:(void (^)(NSString *))alertBlock;

@end


NS_ASSUME_NONNULL_END
