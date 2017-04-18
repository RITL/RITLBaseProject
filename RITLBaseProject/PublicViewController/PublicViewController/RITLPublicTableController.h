//
//  RITLPublicTableController.h
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/30.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicViewController.h"
#import "MJRefresh.h"

NS_ASSUME_NONNULL_BEGIN

/// 所有tableViewController控制器的基类
@interface RITLPublicTableController : RITLPublicViewController

/// 上拉刷新
@property (nonatomic, strong) MJRefreshAutoNormalFooter * footerFreshView;

/// 下拉刷新
@property (nonatomic, strong) MJRefreshNormalHeader * headerFreshView;

/// 列表
@property (nonatomic, strong) UITableView * tableView;

/// tableView注册cell的方法，子类可重写该类
- (void)registerCellHandler:(UITableView *)tableView;


@end


@interface RITLPublicTableController (RITL_UITableView)<UITableViewDelegate,UITableViewDataSource>

@end


@interface RITLPublicTableController (RITL_MJRefresh)

/**
 重置tableView，子类可重写该方法
 */
- (void)reSetTableViewHandler:(UITableView *)tableView;


/**
 下拉刷新开始做的操作
 */
- (void)beginHeaderFreshHandler;

/**
 下拉刷新结束
 */
- (void)stopHeaderFresh;

/**
 上拉刷新开始做的操作
 */
- (void)beginFooterFreshHandler;

/**
 上拉刷新结束
 */
- (void)stopFooterFresh;


/// 下拉刷新是否可用,默认为true
- (BOOL)headerFreshEnable;


/// 上拉刷新是否可用，默认为true
- (BOOL)footerFreshEnable;

@end

NS_ASSUME_NONNULL_END
