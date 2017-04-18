//
//  UIViewController+RITLSheetAlertPhotoController.m
//  Yuexiaowen
//
//  Created by YueWen on 2017/3/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "UIViewController+RITLSheetAlertPhotoController.h"
#import "RITL_ImagePickerController.h"
//#import "RITLPhotoNavigationViewController.h"
//#import "RITLPhotoNavigationViewModel.h"

@implementation UIViewController (SheetAlertPhotoController)

-(void)presentSheetAlertPhotoController
{
    [self presentSheetAlertPhotoController:9 completeHandler:nil];
}


-(void)presentSheetAlertPhotoController:(NSUInteger)maxCount
                        completeHandler:(void (^)(RITLPhotoNavigationViewModel * _Nonnull))completeHander
{
    if (maxCount <= 0 || maxCount > 9) {
        maxCount = 9;
    }
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self presentViewController:[RITL_ImagePickerController sharedInstance:UIImagePickerControllerSourceTypeCamera delegate:self] animated:true completion:^{}];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        //初始化控制器
//        RITLPhotoNavigationViewController * viewController = [RITLPhotoNavigationViewController new];
//        
//        RITLPhotoNavigationViewModel * viewModel = viewController.viewModel;
//        
//        //设置最大数
//        viewModel.maxNumberOfSelectedPhoto = maxCount;
//        
//        //执行回调
//        if (completeHander) { completeHander(viewModel); }
//        
//        [self presentViewController:viewController animated:true completion:^{}];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Cancle");
        
    }]];
    
    [self presentViewController:alertController animated:true completion:^{}];
}


-(void)presentSheetAlertPhotoController:(NSUInteger)maxCount identifier:(NSString *)identifier completeHandler:(void (^)(RITLPhotoNavigationViewModel * _Nonnull, NSString * _Nonnull))completeHander
{
    if (maxCount <= 0 || maxCount > 9) {
        maxCount = 9;
    }
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self presentViewController:[RITL_ImagePickerController sharedInstance:UIImagePickerControllerSourceTypeCamera identifier:identifier delegate:self] animated:true completion:^{}];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        //初始化控制器
//        RITLPhotoNavigationViewController * viewController = [RITLPhotoNavigationViewController new];
//        
//        RITLPhotoNavigationViewModel * viewModel = viewController.viewModel;
//        
//        //设置最大数
//        viewModel.maxNumberOfSelectedPhoto = maxCount;
//        
//        //执行回调
//        if (completeHander) { completeHander(viewModel,identifier); }
//        
//        [self presentViewController:viewController animated:true completion:^{}];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
    
    [self presentViewController:alertController animated:true completion:^{}];
}

@end


@implementation UIViewController (RITL_ShowAlertController)

-(void)presentShowAlertControllerWithErrorMessage:(NSString *)error handle:(dispatch_block_t)handler
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:error message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        //执行block
//        if (handler) handler();
        
    }]];
    
    [self presentViewController:alertController animated:true completion:nil];
}

@end
