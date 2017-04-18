//
//  RITL_ImagePickerController.m
//  yuyetong
//
//  Created by YueWen on 2017/3/27.
//  Copyright © 2017年 ztld. All rights reserved.
//

#import "RITL_ImagePickerController.h"

static NSString * RITL_ImagePickerController_defaultIdentifier = @"RITL_ImagePickerController_DefaultIdentifier";

@interface RITL_ImagePickerController ()

@end

@implementation RITL_ImagePickerController

+(instancetype)sharedInstance
{
    static RITL_ImagePickerController * imagePicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imagePicker = [RITL_ImagePickerController new];
    });
    
    return imagePicker;
}


+(instancetype)sharedInstance:(UIImagePickerControllerSourceType)sourceType
                     delegate:(id<UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate
{
    return [self sharedInstance:sourceType identifier:RITL_ImagePickerController_defaultIdentifier delegate:delegate];
}



+(instancetype)sharedInstance:(UIImagePickerControllerSourceType)sourceType identifier:(NSString *)identifier delegate:(id<UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate
{
    RITL_ImagePickerController * imagePicker = [self sharedInstance];
    
    imagePicker.delegate = delegate;
    
    if ([RITL_ImagePickerController isSourceTypeAvailable:sourceType]) {
        imagePicker.sourceType = sourceType;
    }
    
    imagePicker.identifier = identifier;
    
    return imagePicker;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
