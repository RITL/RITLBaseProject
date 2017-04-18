//
//  RITLSubject.m
//  RITLBaseProject
//
//  Created by YueWen on 2017/4/18.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLSubject.h"

@interface RITLSubject ()

/// 执行的block
@property (nonatomic, copy, readwrite)RITLSubjectBlock handler;

@end

@implementation RITLSubject


-(void)ritl_sendNext:(id)value
{
    //执行block
    self.handler(value);
}


-(void)ritl_subscribeNext:(RITLSubjectBlock)handler
{
    _handler = handler;
}


#pragma mark - getter

-(RITLSubjectBlock)handler
{
    if (!_handler) {
        
        return ^(id x){};
    }
    
    return _handler;
}


@end
