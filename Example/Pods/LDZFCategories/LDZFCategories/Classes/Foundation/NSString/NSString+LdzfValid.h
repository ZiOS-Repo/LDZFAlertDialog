//
//  NSString+MHValid.h
//  MHDevelopExample
//
//  Created by senba on 2017/6/12.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//字符串是否为空
#define kfStringIsEmpty(str) (str == nil || [str isKindOfClass:[NSNull class]] || ![str isKindOfClass:[NSString class]] || [str length] < 1 ? YES : NO )

#define kfString(str) (kfStringIsEmpty(str) ? @"" : str )

@interface NSString (LdzfValid)

/// 检测字符串是否包含中文
+( BOOL)ldzf_isContainChinese:(NSString *)str;

/// 整形
+ (BOOL)ldzf_isPureInt:(NSString *)string;

/// 浮点型
+ (BOOL)ldzf_isPureFloat:(NSString *)string;

/// 有效的手机号码
+ (BOOL)ldzf_isValidMobile:(NSString *)str;

/// 纯数字
+ (BOOL)ldzf_isPureDigitCharacters:(NSString *)string;

/// 字符串为字母或者数字
+ (BOOL)ldzf_isValidCharacterOrNumber:(NSString *)str;

/// 判断字符串全是空格or空
+ (BOOL)ldzf_isEmpty:(NSString *) str;

/// 是否是正确的邮箱
+ (BOOL)ldzf_isValidEmail:(NSString *)email;

/// 是否是正确的QQ
+ (BOOL)ldzf_isValidQQ:(NSString *)qq;
@end
