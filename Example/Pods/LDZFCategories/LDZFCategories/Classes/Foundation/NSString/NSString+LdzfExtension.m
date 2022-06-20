//
//  NSString+SBExtension.m
//  WeChat
//
//  Created by senba on 2017/8/4.
//  Copyright © 2017年 Senba. All rights reserved.
//

#import "NSString+LdzfExtension.h"

@implementation NSString (LdzfExtension)
- (NSString *)qnm_removeBothEndsWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)qnm_removeBothEndsWhitespaceAndNewline {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)qnm_trimWhitespace {
    NSMutableString *str = [self mutableCopy];
    CFStringTrimWhitespace((__bridge CFMutableStringRef)str);
    return str;
}

- (NSString *)qnm_trimAllWhitespace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark - 字符串查找.
- (NSArray <NSValue *> *)qnm_rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)mask serachRange:(NSRange)range {

    NSMutableArray *array = [NSMutableArray array];
    [self qnm_rangeOfString:searchString range:NSMakeRange(0, self.length) array:array options:mask];
    
    return array;
}

- (void)qnm_rangeOfString:(NSString *)searchString
                range:(NSRange)searchRange
                array:(NSMutableArray *)array
              options:(NSStringCompareOptions)mask {

    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];
    
    if (range.location != NSNotFound) {
        
        [array addObject:[NSValue valueWithRange:range]];
        [self qnm_rangeOfString:searchString
                      range:NSMakeRange(range.location + range.length, self.length - (range.location + range.length))
                      array:array
                    options:mask];
    }
}


+ (NSString *)qnm_unicodeWithHexString:(NSString *)hexString {
    unsigned int codeValue;
    [[NSScanner scannerWithString:hexString] scanHexInt:&codeValue];
    return [NSString stringWithFormat:@"%C", (unichar)codeValue];;
}

@end
