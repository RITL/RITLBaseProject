//
//  RITL_UploaderImage.m
//  yuyetong
//
//  Created by YueWen on 2017/3/28.
//  Copyright © 2017年 ztld. All rights reserved.
//

#import "RITL_UploaderImage.h"

@interface RITL_UploaderImage ()

@property (nonatomic, strong) UIImage * image;

@end

@implementation RITL_UploaderImage

-(instancetype)init
{
    if (self = [self initWithImage:nil])
    {
        _url = @"";
    }
    
    return self;
}

-(instancetype)initWithImage:(UIImage *)image
{
    if (self = [super init])
    {
        _image = image;
    }
    
    return self;
}


+(instancetype)uploaderImage:(UIImage *)image
{
    return [[self alloc]initWithImage:image];
}

-(BOOL)isComplete
{
    return self.image && ![self.url isEqualToString:@""];
}

@end

@implementation NSArray (RITL_UploaderImage)

-(NSArray<RITL_UploaderImage *> *)uploaderImages
{
    NSMutableArray <RITL_UploaderImage *> * uploaderImages = [NSMutableArray arrayWithCapacity:0];
    
    for (id object in self) {
        
        if (![object isKindOfClass:[UIImage class]]) {//如果不是UIImage对象
            
            return nil;
        }
        
        [uploaderImages addObject:[RITL_UploaderImage uploaderImage:object]];
    }
    
    return [uploaderImages mutableCopy];
}

@end

@implementation NSMutableArray (RITL_UploaderImage)


-(void)uploaderImages
{
    for (id object in self) {
        
        if (![object isKindOfClass:[UIImage class]]) {//如果不是UIImge对象
            return;
        }
    }
    
    //开始替换
    for (NSInteger i = 0; i < self.count; i++) {
        
        //获得对象
        UIImage * image = self[i];
        
        [self replaceObjectAtIndex:i withObject:[RITL_UploaderImage uploaderImage:image]];
    }
}

@end
