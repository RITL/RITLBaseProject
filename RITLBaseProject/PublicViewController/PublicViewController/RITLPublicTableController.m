//
//  RITLPublicTableController.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/30.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicTableController.h"
#import "UIView+RITLFrameChanged.h"

@interface RITLPublicTableController ()

@end

@implementation RITLPublicTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    //添加刷新
    [self p_addFreshView];
    
    //重置restableView
    [self reSetTableViewHandler:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)registerCellHandler:(UITableView *)tableView
{
    
}



#pragma mark - getter

-(UITableView *)tableView
{
    if (!_tableView)
    {
        UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        if (self.navigationController) {
            
            tableView.ritl_height = tableView.ritl_height - 64;
        }
        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [UIView new];
     
        //注册cell
        [self registerCellHandler:tableView];
        
        _tableView = tableView;
    }
    
    return _tableView;
}


-(MJRefreshNormalHeader *)headerFreshView
{
    if (!_headerFreshView) {
        
        __weak typeof(self) weakSelf = self;
        
        _headerFreshView = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           
            [weakSelf beginHeaderFreshHandler];
            
        }];
    }
    
    return _headerFreshView;
}



-(MJRefreshAutoNormalFooter *)footerFreshView
{
    if (!_footerFreshView) {
        
        __weak typeof(self) weakSelf = self;
        
        _footerFreshView = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           
            [weakSelf beginFooterFreshHandler];
        }];
    }
    
    return _footerFreshView;
}


#pragma mark - private

/// 添加上拉下拉刷新
- (void)p_addFreshView
{
    if (self.headerFreshEnable) {
        
        self.tableView.mj_header = self.headerFreshView;
    }
    
    if (self.footerFreshEnable) {
        
        self.tableView.mj_footer = self.footerFreshView;
    }
}


@end


@implementation RITLPublicTableController (RITL_UITableView)

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

@end


@implementation RITLPublicTableController (RITL_MJRefresh)

-(void)reSetTableViewHandler:(UITableView *)tableView
{
    
}

-(void)beginHeaderFreshHandler
{
    NSLog(@"%@ start headerFresh",NSStringFromClass([self class]));
}

-(void)beginFooterFreshHandler
{
    NSLog(@"%@ start footerFresh",NSStringFromClass([self class]));   
}

-(BOOL)footerFreshEnable
{
    return true;
}

-(BOOL)headerFreshEnable
{
    return true;
}


-(void)stopHeaderFresh
{
    if (_headerFreshView && _headerFreshView.isRefreshing) {
        
        [_headerFreshView endRefreshing];
    }
}


-(void)stopFooterFresh
{
    if (_footerFreshView && _footerFreshView.isRefreshing) {
        
        [_footerFreshView endRefreshing];
    }
}


@end
