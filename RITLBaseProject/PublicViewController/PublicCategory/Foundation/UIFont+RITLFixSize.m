//
//  UIFont+RITLFixSize.m
//  Yuexiaowen
//
//  Created by YueWen on 16/7/1.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "UIFont+RITLFixSize.h"


@implementation UIFont (RITLFixSize)


+(UIFont *)fitSystemFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:fitSizeInUIFont_FitMaxSize(fontSize)];
}




+(UIFont *)fitBoldSystemFontOfSize:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:fitSizeInUIFont_FitMaxSize(fontSize)];
}

@end
