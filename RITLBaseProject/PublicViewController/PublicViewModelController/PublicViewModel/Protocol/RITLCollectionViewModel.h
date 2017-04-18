//
//  RITLCollectionViewModel.h
//  CityBao
//
//  Created by YueWen on 2016/11/16.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "RITLScrollViewModel.h"
#import "RITLCollectionCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RITLCollectionViewModel <NSObject,RITLScrollViewModel,RITLCollectionCellViewModel>

@optional


#pragma mark - CollectionView DataSource


/**
 CollectionView 每组item的个数
 
 @param section 组section
 @return 当前section的个数
 */
- (NSUInteger)ritl_numberOfItemsInSection:(NSInteger)section;



#pragma mark - Collection FlowLayout



/**
 CollectionView 当前位置的大小
 
 @param indexPath 位置indexPath
 @param collection 执行方法的collection
 @return 当前indexPath的item大小
 */
- (CGSize)ritl_sizeForItemAtIndexPath:(NSIndexPath *)indexPath inCollection:(UICollectionView *)collection;



/**
 CollectionView 每组section的最小间隔
 
 @param section 当前section
 @return 当前section的间隔
 */
- (CGFloat)ritl_minimumLineSpacingForSectionAtIndex:(NSInteger)section;



/**
 CollectionView section中item的最小间隔
 
 @param section 当前section
 @return 当前section中item的最小间隔
 */
- (CGFloat)ritl_minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;




/**
 CollectionView 当前该位置的Cell能否点击
 
 @param indexPath 当前位置
 @return true表示可以点击，false反之
 */
- (BOOL)ritl_shouldSelectItemAtIndexPath:(nullable NSIndexPath *)indexPath;



/**
 CollectionView 当前位置的Cell点击执行的操作
 
 @param indexPath 当前位置
 */
- (void)ritl_didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
