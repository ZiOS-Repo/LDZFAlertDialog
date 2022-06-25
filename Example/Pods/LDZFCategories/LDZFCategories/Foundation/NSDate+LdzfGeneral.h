//
//  NSDate+LdzfGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2022/1/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LdzfGeneral)
// 字符串转为北京时间NSDate   支持yyyyMMdd yyyyMMddHHmmss
+ (NSDate *)qnm_convertToBJDate:(NSString *)dateString;

// 北京时间转换为字符串
- (NSString *)qnm_bjDateConvertToStringWithDateFormatter:(NSString *)dateFormatter;

// 计算两个日期间隔天数
+ (NSInteger)qnm_calculateDayWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

// 距离date为n天的日期
+ (NSDate *)qnm_getDateFromDate:(NSDate *)date deltaDay:(NSInteger)deltaDay;

// 获取距离date为N个月的日期
+ (NSDate *)qnm_getDateFromDate:(NSDate *)date deltaMonth:(NSInteger)deltaMonth;

/// 判断当前时间是否在起止时间之间
/// @param startStr 起始时间
/// @param endStr 结束时间
+ (BOOL)qnm_judgeTimeByStartTime:(NSString *)startStr andEndTime:(NSString *)endStr;


@end

NS_ASSUME_NONNULL_END
