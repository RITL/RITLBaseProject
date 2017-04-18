//
//  RITLPublicViewModel.m
//  CityBao
//
//  Created by YueWen on 2016/11/16.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "RITLPublicViewModel.h"

@implementation RITLPublicViewModel

-(instancetype)init
{
    if (self = [super init])
    {
        [self p_loadAllSubject];
        [self ritl_loadOwnPropertys];
    }
    
    return self;
}


- (void)p_loadAllSubject
{
    [self __setSubjectPropertys:[self class]];
    [self __setSubjectPropertys:[RITLPublicViewModel class]];
}


-(void)ritl_loadOwnPropertys
{
    
}


-(void)dealloc
{
    NSLog(@"viewModel [%@] is dealloc",NSStringFromClass([self class]));
}



/**
 设置class中所有的RACSubject对象

 @param class 初始化的属性类
 */
- (void)__setSubjectPropertys:(Class)class
{
    unsigned int propertyCount;
    
    objc_property_t * propertyList = class_copyPropertyList([class class], &propertyCount);//获取属性的数组列表
    
    for (int i = 0; i < propertyCount; i ++)//开始遍历
    {
        //获取属性名字
        NSString * propertyName = [NSString stringWithUTF8String:property_getName(propertyList[i])];
        
        //如果后缀是Subject
        if ([propertyName hasSuffix:@"Subject"])
        {

            //进行KVC赋值
            [self setValue:[RITLSubject new] forKey:propertyName];
        }
        
    }
    
    free(propertyList);
}



-(id)ritl_viewControllerWithName:(NSString *)name
{
    return [self ritl_viewControllerWithName:name selector:@"new"];
}



-(id)ritl_viewControllerWithName:(NSString *)name selector:(NSString *)nameOfSelector
{
    id class = objc_getClass(name.UTF8String);
    
    id viewController = ((id(*)(id,SEL))objc_msgSend)(class, sel_registerName(nameOfSelector.UTF8String));
    
    return viewController;
}


@end
