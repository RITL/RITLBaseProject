//
//  RITLPublicViewController.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "RITLPublicViewController.h"
#import "UIButton+RITLBlockButton.h"

@interface RITLPublicViewController ()

@end

@implementation RITLPublicViewController

-(instancetype)init
{
    if (self = [super init])
    {
        //初始化属性
        self.tapGestureEnbale = true;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载view
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置单击响应
    [self __addSimpleTapGestureHandler];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    NSLog(@"PublicViewController [%@] is dealloc",NSStringFromClass([self class]));
}

#pragma mark - private

/// 添加单机结束响应
- (void)__addSimpleTapGestureHandler
{
    if (self.isTapGestureEnbale)
    {
        UITapGestureRecognizer * tapGesture = [UITapGestureRecognizer new];
        
        //添加
        [self.view addGestureRecognizer:tapGesture];
        
        __weak typeof(self) weakSelf = self;
        
        //设置block
        [tapGesture gestureRecognizerHandle:^(UIGestureRecognizer * _Nonnull sender) {
            
            //结束
            [weakSelf.view endEditing:true];
            
            //单击回调回调
            if (weakSelf.tapGestureHander) {
                weakSelf.tapGestureHander(weakSelf);
            }
        }];
    }
}


@end
