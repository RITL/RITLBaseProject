//
//  CB_TitleTextField.h
//  CityBao
//
//  Created by YueWen on 2016/11/25.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 自定义的textField,前面有标签标题支持
@interface RITL_TitleTextField : UITextField

/// 显示标题的标签
@property (nonatomic, strong) UILabel * titleLabel;

/// 显示的标题
@property (nonatomic, copy, nullable, readonly) NSString * title;

/// 标题的宽度
@property (nonatomic, assign, readonly) CGFloat titleWidth;

/// 是否需要隐藏下划线
@property (nonatomic, assign)BOOL lineHidden;

/// 标签最大的长度，默认为title字符的长度
@property (nonatomic, assign) CGFloat labelMaxWidth;

/// 标签最小的长度，默认为title字符的长度
@property (nonatomic, assign) CGFloat labelMinWidth;

/// 标签文字的大小,标题标签的字体，默认为系统15号
@property (nonatomic, strong) UIFont * labelFont;


/**
 初始化方法

 @param frame 当前的frame
 @param title 标签的文本
 @param placeholder 占位符
 @return 创建完毕的CB_TitleTextField对象
 */
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString * __nullable)title Placeholder:(NSString * __nullable)placeholder NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;



/**
 便利构造器

 @param frame 当前的frame
 @param title 标签的文本
 @param placeholder 占位符
 @return 创建完毕的CB_TitleTextField对象
 */
+(instancetype)titleTextField:(CGRect)frame Title:(NSString * __nullable)title Placeholder:(NSString * __nullable)placeholder;

@end

NS_ASSUME_NONNULL_END
