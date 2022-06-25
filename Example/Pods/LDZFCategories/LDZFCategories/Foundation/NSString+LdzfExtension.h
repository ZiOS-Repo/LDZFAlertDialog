//
//  NSString+SBExtension.h
//  WeChat
//
//  Created by senba on 2017/8/4.
//  Copyright © 2017年 Senba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LdzfExtension)
/// 消除收尾空格
- (NSString *)qnm_removeBothEndsWhitespace;
/// 消除收尾空格+换行符
- (NSString *)qnm_removeBothEndsWhitespaceAndNewline;
/// 消除收尾空格
- (NSString *)qnm_trimWhitespace;
/// 消除所有空格
- (NSString *)qnm_trimAllWhitespace;

#pragma mark - 字符串查找.
- (NSArray <NSValue *> *)qnm_rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)mask serachRange:(NSRange)range;


/**
 Transform hex string like '0xF181' to unicode '\u{F181}'.
 
 @param hexString The hex string like '0xF181'
 @return The unicode.
 */
+ (NSString *)qnm_unicodeWithHexString:(NSString *)hexString;



@end
