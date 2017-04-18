//
//  RITLPublicViewController.h
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+RITLSheetAlertPhotoController.h"

NS_ASSUME_NONNULL_BEGIN

/**
 所有控制器的基类控制器
 */
@interface RITLPublicViewController : UIViewController

/// 是否通过响应放弃所有第一响应，默认为true
@property(nonatomic, assign, getter=isTapGestureEnbale)BOOL tapGestureEnbale;

/// 单击放弃所有响应进行的回调block
@property (nonatomic, copy, nullable)void(^tapGestureHander)(UIViewController * _Nullable );

@end

NS_ASSUME_NONNULL_END
