

#import <Foundation/Foundation.h>

/** 字符串处理 */
@interface NSString (LdzfHandle)
/** 获取后6位 */
+ (NSString *)qnm_getLastSixChar:(NSString *)string;
/** 获取后4位 */
+ (NSString *)qnm_getLastFourChar:(NSString *)string;
/** 获取前4位 */
+ (NSString *)qnm_getFirstFourChar:(NSString *)string;
/** 每4位加一个空格 */
+ (NSString *)qnm_insertSpace:(NSString *)string;


/** 保留最后数字, 其他替换成 *
 *  @param end 保留的最后位数,  e.g. end = 4,  12345678 -> ****5678
 */
+ (NSString *)qnm_replacedByStar:(NSString *)string end:(NSUInteger)end;


/** 保留开始和最后数字, 其他替换成
 *  @param begin 保留的开始的位数
 *  @param end 保留的最后位数
 *  e.g.  bagin = 2, end = 3,   12345678 -> 12***678
 */
+ (NSString *)qnm_replacedByStar:(NSString *)string begin:(NSUInteger)begin end:(NSUInteger)end;


/**
 金额处理

 @return 50000变为50,000.00
 */
- (NSString *)qnm_transformToMoneyType;

// url参数拼接
- (NSString *)qnm_urlStringAppendParameters:(NSDictionary *)parameters;
@end
