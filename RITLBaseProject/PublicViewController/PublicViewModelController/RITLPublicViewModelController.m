//
//  RITLPublicViewModelController.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicViewModelController.h"


@interface RITLPublicViewModelController ()

@end

@implementation RITLPublicViewModelController

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
//
//    //开始加载
    [self.viewModel.ritl_requestBeginSubject ritl_subscribeNext:^(id x) {
       
        @strongify(self);
        
//        [MBProgressHUD showHUDAddedTo:self.view animated:true];
        
    }];
    
//    self.viewModel.ritl_title
//
//    //结束加载
//    [self.viewModel.requestEndSubject subscribeNext:^(id x) {
//        
//        @strongify(self);
//        
//        [MBProgressHUD hideHUDForView:self.view animated:true];
//    }];
//    
//    //出错误
//    [self.viewModel.requestFailSubject subscribeNext:^(id x) {
//        
//        @strongify(self);
//        
//        [self presentShowAlertControllerWithErrorMessage:x handle:nil];
//    }];
}


-(RITLPublicViewModel *)viewModel
{
    if (!_viewModel)
    {
        _viewModel = [RITLPublicViewModel new];
    }
    
    return _viewModel;
}


@end
