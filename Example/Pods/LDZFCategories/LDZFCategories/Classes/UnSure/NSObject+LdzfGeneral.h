//
//  NSObject+LdzfGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LdzfGeneral)
/// 获取主窗体
+ (nullable UIWindow *)qnm_window;
- (nullable UIViewController *)qnm_topViewController;
- (nullable UIViewController *)qnm_topViewController:(UIViewController *)rootViewController;

/// 将JSON 字符串转化成序列化对象
- (id)qnm_JSONValue;

/// 将可 JSON 化对象转化成 JSON 字符串
- (NSString *)qnm_JSONString;
@end

NS_ASSUME_NONNULL_END
