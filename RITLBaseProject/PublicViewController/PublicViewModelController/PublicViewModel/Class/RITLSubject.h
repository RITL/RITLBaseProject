//
//  RITLSubject.h
//  RITLBaseProject
//
//  Created by YueWen on 2017/4/18.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RITLSubjectBlock)(id);


/// 模拟封装block的方法
@interface RITLSubject : NSObject

/**
 发送数据，执行handler

 @param value 发送的数据
 */
- (void)ritl_sendNext:(id)value;

/**
 设置执行的block方法

 @param handler 设置的block方法
 */
- (void)ritl_subscribeNext:(RITLSubjectBlock)handler;


@end

NS_ASSUME_NONNULL_END
