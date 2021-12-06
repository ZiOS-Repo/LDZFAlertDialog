//
//  NSObject+Solo.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Solo)
/// 获取主窗体
+ (nullable UIWindow *)solo_window;
- (nullable UIViewController *)solo_topViewController;
- (nullable UIViewController *)solo_topViewController:(UIViewController *)rootViewController;


/// 将可 JSON 化对象转化成 JSON 字符串
- (NSString *)solo_JSONString;
@end

NS_ASSUME_NONNULL_END
