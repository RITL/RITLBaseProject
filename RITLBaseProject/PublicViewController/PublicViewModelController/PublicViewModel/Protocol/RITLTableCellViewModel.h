//
//  RITLTableCellViewModel.h
//  CityBao
//
//  Created by YueWen on 2016/11/23.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 提供简单的内容接口
@protocol RITLTableCellViewModel <NSObject>

@optional


/**
 获得当前indexPath显示的标题
 
 @param indexPath 当前位置indexPath
 @return 当前位置显示的标题
 */
- (NSString *)ritl_titleForCellAtIndexPath:(NSIndexPath *)indexPath;



/**
 获得当前indexPath显示标题的颜色

 @param indexPath 当前位置indexPath
 @return 当前位置显示标题的颜色
 */
- (UIColor *)ritl_colorForTitleCellAtIndexPath:(NSIndexPath *)indexPath;


/**
 获得当前indexPath显示的图像
 
 @param indexPath 当前位置indexPath
 @return 当前位置显示的图片
 */
- (UIImage *)ritl_imageForCellAtIndexPath:(NSIndexPath *)indexPath;




/**
 获得当前indexPath位置cell背景色

 @param indexPath 当前位置indexPath
 @return 当前位置的背景色
 */
- (UIColor *)ritl_colorForCellBackgroundAtIndexPath:(nullable NSIndexPath *)indexPath;



@end

NS_ASSUME_NONNULL_END
