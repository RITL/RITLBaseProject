//
//  RITLTextFieldViewModel.h
//  CityBao
//
//  Created by YueWen on 2016/12/6.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RITLTextFieldViewModel <NSObject>

@optional


/**
 完成协议方法textFieldShouldReturn：

 @param textField textField
 @return true表示可以使用键盘最后一个
 */
- (BOOL)ritl_textFieldShouldReturn:(UITextField *)textField;



/**
 是否允许该字符串书写在textField

 @param character 判定的字符串
 @return true表示允许字符串写在textField
 */
- (BOOL)ritl_textFieldShouldChangeCharacters:(NSString *)character;

@end

NS_ASSUME_NONNULL_END
