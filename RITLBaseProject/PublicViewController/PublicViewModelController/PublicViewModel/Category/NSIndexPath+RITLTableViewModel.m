//
//  NSIndexPath+RITLTableViewModel.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "NSIndexPath+RITLTableViewModel.h"

@implementation NSIndexPath (RITLTableViewModel)

-(NSString *)ritl_cacheKey
{
    //获得section
    NSInteger section = self.section;
    
    //获得row
    NSInteger row = self.row;
    
    return [NSString stringWithFormat:@"ritl_section%@.ritl_row%@",@(section),@(row)];
}

@end
