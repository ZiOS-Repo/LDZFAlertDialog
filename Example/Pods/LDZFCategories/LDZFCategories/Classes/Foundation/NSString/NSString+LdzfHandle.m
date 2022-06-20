
#import "NSString+LdzfHandle.h"
#import "NSString+LdzfValid.h"

@implementation NSString (LdzfHandle)

//截取卡号最后六位
+ (NSString *)qnm_getLastSixChar:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return @"";
    if (string.length>0) {
        if (string.length>6) {
            return [string substringFromIndex:string.length - 6];
        } else {
            return string;
        }
    } else {
        return @"";
    }
}
//截取卡号最后四位
+ (NSString *)qnm_getLastFourChar:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return @"";
    if (string.length>0) {
        if (string.length>4) {
            return [string substringFromIndex:string.length - 4];
        } else {
            return string;
        }
    } else {
        return @"";
    }
}

/** 获取前4位 */
+ (NSString *)qnm_getFirstFourChar:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return @"";
    if (string.length > 0) {
        if (string.length >= 4) {
            return [string substringToIndex:4];
        } else {
            return string;
        }
    } else {
        return @"";
    }
}

+ (NSString *)qnm_insertSpace:(NSString *)string {
    NSMutableString *tmpStr =[NSMutableString stringWithString:string];
    for (int i =0; i <string.length; i++) {
        if (i!=0 && i %4 ==0) {
            [tmpStr insertString:@" " atIndex:i+(i/4)-1];
        }
    }
    return [NSString stringWithString:tmpStr];
}

// 证件号显示处理320113198804118177
+ (NSString *)qnm_replacedByStar:(NSString *)string end:(NSUInteger)end {
    return [NSString qnm_replacedByStar:string begin:0 end:end];
}

// 证件号显示处理320113198804118177
+ (NSString *)qnm_replacedByStar:(NSString *)string begin:(NSUInteger)begin end:(NSUInteger)end {
    if (string.length < begin+end) return string;
    NSMutableString *tempStr = [NSMutableString stringWithString:string];
    for (NSUInteger i = begin; i < string.length-end; i++) {
        [tempStr replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
    }
    return [NSString stringWithString:tempStr];
}





#pragma mark - 金额处理
- (NSString *)qnm_transformToMoneyType {
    if (![NSString qnm_isEmpty:self]) {
        NSString *string = (NSString *)self;
        if ([string containsString:@","]) {
            string = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
        }
        if ([string regularExpression:@"^\\d+([/.]\\d+)?$"] || [string regularExpression:@"^[/.]\\d+?$"]) {
            double money = [string doubleValue];
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            // 设置格式
            [numberFormatter setPositiveFormat:@"###,##0.00;"];
            NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:money]];
            return formattedNumberString;
        }
    }
    return self;
}

- (BOOL)regularExpression:(NSString *)patternStr{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *objStr = [NSString stringWithFormat:@"%@", self];
        if (!objStr.length) return NO;
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternStr  options:NSRegularExpressionCaseInsensitive|NSRegularExpressionAnchorsMatchLines error:&error];
        if (error) return NO;
        NSUInteger intNum = [regex numberOfMatchesInString:objStr options:0 range:NSMakeRange(0, objStr.length)];
        return intNum == 0 ? NO : YES;
    }
    return NO;
}

- (NSString *)qnm_urlStringAppendParameters:(NSDictionary *)parameters {
    NSMutableString *mutableUrl = [[NSMutableString alloc] initWithString:self];
    if ([parameters allKeys]) {
        [mutableUrl appendString:@"?"];
        for (id key in parameters) {
            NSString *value = [parameters objectForKey:key];
            [mutableUrl appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
    }
    NSString *urlStr = @"";
    if (mutableUrl.length > 1) {
        urlStr = [mutableUrl substringToIndex:mutableUrl.length - 1];
    }
    return urlStr;
}


@end
