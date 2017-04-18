//
//  RITLPublicViewModelController.h
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicTableController.h"
#import "RITLPublicViewModel.h"

NS_ASSUME_NONNULL_BEGIN

/// 适用于viewModel的控制器
@interface RITLPublicViewModelController : RITLPublicViewController

/// 控制器的viewModel
@property (nonatomic, strong) RITLPublicViewModel * viewModel;

/**
 绑定viewModel,供子类实现的接口，请自主调用
 */
- (void)ritl_bindViewModel;

@end

NS_ASSUME_NONNULL_END
