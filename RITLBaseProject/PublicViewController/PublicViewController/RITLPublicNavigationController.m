//
//  RITLPublicNavigationController.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicNavigationController.h"

@interface RITLPublicNavigationController ()

@end

@implementation RITLPublicNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置自身属性
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return false;
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
