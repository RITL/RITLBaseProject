//
//  RITLPublicTableModelController.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/30.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicTableModelController.h"

@interface RITLPublicTableModelController ()

@end

@implementation RITLPublicTableModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏
    self.navigationItem.title = self.viewModel.ritl_title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ritl_bindViewModel
{
    @weakify(self);
    
    //开始加载
    [self.viewModel.ritl_requestBeginSubject ritl_subscribeNext:^(id x) {

        
    }];
    
    //结束加载
    [self.viewModel.ritl_requestEndSubject ritl_subscribeNext:^(id x) {
        
        @strongify(self);
        
        //结束上拉下拉刷新
        [self stopHeaderFresh];
        [self stopFooterFresh];
    }];
    
    //出错误
    [self.viewModel.ritl_requestFailSubject ritl_subscribeNext:^(id x) {
        
        @strongify(self);
        
        [self presentShowAlertControllerWithErrorMessage:x handle:nil];
    }];
}

@end
