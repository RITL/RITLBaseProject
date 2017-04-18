//
//  NSIndexPath+RITLTableViewModel.h
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 适用于RITLTableViewModel进行缓存的indexPath
@interface NSIndexPath (RITLTableViewModel)

/// 适用于缓存的key
@property (nonatomic, copy, readonly) NSString * ritl_cacheKey;

@end

NS_ASSUME_NONNULL_END
