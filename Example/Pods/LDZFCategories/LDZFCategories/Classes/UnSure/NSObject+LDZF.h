//
//  NSObject+LDZF.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LDZF)
/// 获取主窗体
+ (nullable UIWindow *)ldzf_window;
- (nullable UIViewController *)ldzf_topViewController;
- (nullable UIViewController *)ldzf_topViewController:(UIViewController *)rootViewController;


/// 将可 JSON 化对象转化成 JSON 字符串
- (NSString *)ldzf_JSONString;
@end

NS_ASSUME_NONNULL_END
