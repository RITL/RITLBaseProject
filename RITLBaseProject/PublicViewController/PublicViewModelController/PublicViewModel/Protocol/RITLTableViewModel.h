//
//  RITLTableViewModel.h
//  CityBao
//
//  Created by YueWen on 2016/11/14.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "RITLScrollViewModel.h"
#import "RITLTableCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RITLTableViewModel <NSObject,RITLScrollViewModel,RITLTableCellViewModel>

@optional

/**
 tableView的group数量
 
 @return tableView的group数量
 */
- (NSUInteger)ritl_numberOfGroup;

/**
 tableView每组的row数
 
 @param section 当前的位置
 @return 每组的row数量
 */
- (NSUInteger)ritl_numberOfRowInSection:(NSUInteger)section;


#pragma mark - tableView delegate


/**
 tableView每组的headerView的高度
 
 @param section 当前的section
 @return 当前组的section
 */
- (CGFloat)ritl_sectionHeaderHeight:(NSUInteger)section;

/**
 tableView的Cell高度
 
 @param indexPath 当前位置的indexPath
 @return 当前位置cell的高度
 */
- (CGFloat)ritl_heightForRowAtIndexPath:(nullable NSIndexPath *)indexPath;



/**
 tableView的cell预估高度

 @param indexPath 当前位置的indexPath
 @return 当前位置cell的预估高度
 */
- (CGFloat)ritl_estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath;



/**
 当前位置的cell是否允许点击

 @param indexPath 当前位置的indexPath
 @return true表示可以点击，false表示不可点击
 */
- (BOOL)ritl_shouldHighlightRowAtIndexPath:(nullable NSIndexPath *)indexPath;

/**
 根据当前的位置执行控制器操作
 
 @param indexPath 当前位置的indexPath
 */
- (void)ritl_didSelectRowAtIndexPath:(nullable NSIndexPath *)indexPath;




/**
 当前section的footerView的高度

 @param section  所在的section
 */
- (CGFloat)ritl_heightForFooterInSection:(NSInteger)section;



#pragma mark - 负责cell

///**
// 需要注册的cell类，优先于nibsOfRegisterCell
//
// @return
// */
//- (NSArray<UITableViewCell *> *)classOfRegisterCell;
//
//
///**
// 需要注册的Nib类
//
// @return
// */
//- (NSArray<UINib *> *)nibsOfRegisterCell;
//
//
///**
// 进行注册的cell的重用标识符
//
// @return 
// */
//- (NSArray<NSString *> *)identifiersOfRegister;


/**
 cell展示完毕进行的回调方法

 @param cell 展示的cell
 @param indexPath 当前cell的位置
 */
-(void)ritl_didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;


#pragma mark - 针对UITableViewAutomaticDimension进行缓存的方法

/**
 cell展示完毕进行的回调方法 - 多用于使用UITableViewAutomaticDimension进行的高度缓存
 
 @param cell 展示的cell
 @param indexPath 当前cell的位置
 */
-(void)ritl_cacheHeight_didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

