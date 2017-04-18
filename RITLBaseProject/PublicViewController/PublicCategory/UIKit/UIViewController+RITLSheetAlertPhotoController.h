//
//  UIViewController+RITLSheetAlertPhotoController
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RITLPhotoNavigationViewModel;

/// 弹出图片选择控制器
@interface UIViewController (SheetAlertPhotoController)<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/// 模态弹出选择图片控制器
- (void)presentSheetAlertPhotoController;


/**
 模态弹出图片选择器

 @param maxCount 多选的最大数量
 @param completeHander 完成后的的回调
 */
- (void)presentSheetAlertPhotoController:(NSUInteger)maxCount
                         completeHandler:(nullable void(^)(RITLPhotoNavigationViewModel * viewModel))completeHander;


/**
 模态弹出图片选择器

 @param maxCount 多选的最大数量
 @param identifier 多种情况下的标识符
 @param completeHander 完成后的的回调
 */
- (void)presentSheetAlertPhotoController:(NSUInteger)maxCount
                              identifier:(NSString *)identifier
                         completeHandler:(nullable void(^)(RITLPhotoNavigationViewModel * viewModel,NSString * identifier))completeHander;

@end


@interface UIViewController (RITL_ShowAlertController)

/**
 显示错误信息的控制器

 @param error 错误信息
 @param handler 处理方式
 */
- (void)presentShowAlertControllerWithErrorMessage:(NSString *)error handle:(nullable dispatch_block_t)handler;

@end

NS_ASSUME_NONNULL_END
