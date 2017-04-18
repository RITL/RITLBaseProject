//
//  RITL_UploaderImage.h
//  yuyetong
//
//  Created by YueWen on 2017/3/28.
//  Copyright © 2017年 ztld. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 反馈上传的图片对象
@interface RITL_UploaderImage : NSObject

/// 是否完成数据填充
@property (nonatomic, assign, readonly, getter=isComplete)BOOL complete;

/// 上传返回的url，默认为@""
@property (nonatomic, copy, nullable) NSString * url;


/**
 便利初始化方法

 @param image 包含的image对象
 @return RITL_UploaderImage对象
 */
- (instancetype)initWithImage:(nullable UIImage *)image NS_DESIGNATED_INITIALIZER;


/**
 便利构造器

 @param image 包含的image对象
 @return RITL_UploaderImage对象
 */
+ (instancetype)uploaderImage:(nullable UIImage *)image;

@end


@interface NSArray (RITL_UploaderImage)


/**
 转成RITL_UploaderImage对象数组，泛型Element类型必须完毕为UIImage

 @return 创建好的数组，类型不符，返回nil
 */
- (nullable NSArray <RITL_UploaderImage *> *)uploaderImages;

@end


@interface NSMutableArray (RITL_UploaderImage)


/**
 转成RITL_UploaderImage对象数组，泛型Element类型必须完毕为UIImage
 */
- (void)uploaderImages;

@end

NS_ASSUME_NONNULL_END
