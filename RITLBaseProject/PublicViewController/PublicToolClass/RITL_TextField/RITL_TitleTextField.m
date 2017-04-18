//
//  CB_TitleTextField.m
//  CityBao
//
//  Created by YueWen on 2016/11/25.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "RITL_TitleTextField.h"


// RGB颜色转换（16进制->10进制）
#ifdef __IPHONE_10_0
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]
#else
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithDisplayP3Red:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]
#endif


@interface RITL_TitleTextField ()

/// 下划线视图
@property (nonatomic, strong)UIView * lineView;

/// 默认的defaultTitle,用来之前的绘制
@property (nonatomic, copy) NSString * defaultTitle;


@end

@implementation RITL_TitleTextField

@synthesize labelFont = _labelFont;

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame Title:@"" Placeholder:@""];
}


-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title Placeholder:(NSString *)placeholder
{
    if (self = [super initWithFrame:frame])
    {
        self.title = title;
        self.placeholder = placeholder;
        [self initialize];
    }
    
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return [super initWithCoder:aDecoder];
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}


+(instancetype)titleTextField:(CGRect)frame Title:(NSString *)title Placeholder:(NSString *)placeholder
{
    return [[self alloc]initWithFrame:frame Title:title Placeholder:placeholder];
}


-(void)initialize
{
   self.leftViewMode = UITextFieldViewModeAlways;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!_titleLabel)
    {
        self.leftView = self.titleLabel;
        [self addSubview:self.lineView];
    }
}


-(UIFont *)labelFont
{
    if (!_labelFont)
    {
        return [UIFont systemFontOfSize:15];
    }
    
    return _labelFont;
}


-(void)setLabelFont:(UIFont *)labelFont
{
    _labelFont = labelFont;
    
    [self setNeedsDisplay];
}

#pragma mark - private fucntion

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake([self __widthForTitle] + 10, 0, bounds.size.width - [self __widthForTitle] - 10 - 10 - 10, bounds.size.height - 1);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return [self textRectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [self textRectForBounds:bounds];
}


- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, 0, [self __widthForTitle], bounds.size.height - 1);
}

#pragma mark - subViews

/**
 添加标题的标签
 */
-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, [self __widthForTitle], self.bounds.size.height - 1)];
        _titleLabel.font = self.labelFont;
        _titleLabel.text = self.title;
    }
    
    return _titleLabel;
}



/**
 下划线视图
 */
-(UIView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(20, self.bounds.size.height - 1, self.bounds.size.width - 40, 1)];
        _lineView.backgroundColor = UIColorFromRGB(0xe6e6e6);
        _lineView.hidden = self.lineHidden;
    }
    
    return _lineView;
}



-(void)setLineHidden:(BOOL)lineHidden
{
    _lineHidden = lineHidden;
    _lineView.hidden = lineHidden;
}



-(void)setTitle:(NSString * _Nullable)title
{
    _title = title;
    _defaultTitle = title;
    [self setNeedsDisplay];
}



-(CGFloat)titleWidth
{
    return [self __widthForTitle];
}



#pragma mark - function
/**
 获得标签文字的长度

 @return 当前标签文字的长度
 */
- (CGFloat)__widthForTitle
{
    if (_labelMaxWidth > 0.0f)  return _labelMaxWidth;
    
    CGFloat width = [self.title boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height)
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{NSFontAttributeName:self.labelFont}
                                    context:nil].size.width + 10;// +10为了避免6s机型出现的文字偏差
    
    if (width > _labelMaxWidth && _labelMaxWidth > 0.0f) return _labelMaxWidth;

    if (width < _labelMinWidth && _labelMinWidth > 0.0f) return _labelMinWidth;
    
    return width;
}



/// 为了方便计算绘制长度
- (NSString *)defaultTitle
{
    if (!_defaultTitle)
    {
        return @"身份证号: ";
    }
    
    return _defaultTitle;
}

@end
