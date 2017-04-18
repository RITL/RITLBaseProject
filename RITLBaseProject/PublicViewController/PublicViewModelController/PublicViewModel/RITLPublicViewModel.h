//
//  RITLPublicViewModel.h
//  CityBao
//
//  Created by YueWen on 2016/11/16.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import <objc/runtime.h>

#import "RITLTableViewModel.h"
#import "RITLCollectionViewModel.h"
#import "RITLTextFieldViewModel.h"
#import "RITLEXTkeyConfig.h"
#import "RITLSubject.h"

NS_ASSUME_NONNULL_BEGIN


/// 使用RITLSubject变量请以Subject结尾，使用runtime自动初始化

/// 公共ViewModel的超类
@interface RITLPublicViewModel : NSObject

/// 导航栏的标题
@property (nonatomic, copy)NSString * ritl_title;

///// 请求开始的信号量
@property (nonatomic, strong) RITLSubject *ritl_requestBeginSubject;
//
///// 请求结束的信号量
@property (nonatomic, strong) RITLSubject *ritl_requestEndSubject;
//
///// 请求完成的信号量
@property (nonatomic, strong) RITLSubject *ritl_requestCompeteSubject;
//
///// 请求失败的信号量
@property (nonatomic, strong) RITLSubject *ritl_requestFailSubject;
//
///// ARC下的控制器弹跳
@property (nonatomic, strong) RITLSubject *ritl_arc_ControllerSubject;
//
///// MRC下的控制器弹跳
@property (nonatomic, strong) RITLSubject *ritl_mrc_ControllerSubject;
//
///// 模态弹出的控制器
@property (nonatomic, strong) RITLSubject *ritl_shouldDismissSubject;
//
///// alert
@property (nonatomic, strong) RITLSubject *ritl_warnSubject;


/**
 根据类的名字初始化一个viewController对象，默认方法为new

 @param name 类的名字
 @return 创建完毕的viewController
 */
- (id)ritl_viewControllerWithName:(NSString *)name;




/**
 根据类的名字以及初始化方法初始化一个viewController对象

 @param name 类的名字
 @param nameOfSelector 方法名字
 @return 创建完毕的viewController
 */
- (id)ritl_viewControllerWithName:(NSString *)name selector:(NSString *)nameOfSelector;




/**
 用于加载自己的属性，子类可重写
 */
- (void)ritl_loadOwnPropertys;

@end


NS_ASSUME_NONNULL_END
