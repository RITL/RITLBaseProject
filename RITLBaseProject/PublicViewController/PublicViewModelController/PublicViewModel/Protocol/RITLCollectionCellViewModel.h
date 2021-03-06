//
//  RITLCollectionCellViewModel.h
//  CityBao
//
//  Created by YueWen on 2016/11/23.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 提供简单的内容接口
@protocol RITLCollectionCellViewModel <NSObject>

@optional

/**
 获得当前indexPath显示的标题
 
 @param indexPath 当前位置indexPath
 @return 当前位置显示的标题
 */
- (NSString *)ritl_titleOfItemAtIndexPath:(NSIndexPath *)indexPath;



/**
 获得当前indexPath显示的标题
 
 @param indexPath 当前位置indexPath
 @return 当前位置显示的标题
 */
- (NSAttributedString *)ritl_attributeTitleOfItemAtIndexPath:(NSIndexPath *)indexPath;


/**
 获得当前indexPath显示的图像
 
 @param indexPath 当前位置indexPath
 @return 当前位置显示的图片
 */
- (UIImage *)ritl_imageOfItemAtIndexPath:(NSIndexPath *)indexPath;


/**
 返回当前位置返回图片的url
 
 @param indexPath 当前位置
 @return 需要加载图片的url
 */
- (NSString *)ritl_imageUrlStringForCellAtIndexPath:(NSIndexPath *)indexPath;

@end


NS_ASSUME_NONNULL_END
