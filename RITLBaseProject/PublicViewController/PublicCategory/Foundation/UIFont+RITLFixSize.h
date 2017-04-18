//
//  UIFont+RITLFixSize.h
//  Yuexiaowen
//
//  Created by YueWen on 16/7/1.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 使用C函数
inline static CGFloat fitSizeInUIFont_FitMaxSize(CGFloat origin)
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    if (screenWidth == 320) {
        
        return origin;
    }
    
    else if(screenWidth >= 375)
    {
        return origin * (375.0 / 320.0);
    }
    
    return origin * (screenWidth / 320.0);
    
}



@interface UIFont (RITLFixSize)


/** 最大适配iPhone6s的字体 */
+ (UIFont *)fitSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)fitBoldSystemFontOfSize:(CGFloat)fontSize;

@end
