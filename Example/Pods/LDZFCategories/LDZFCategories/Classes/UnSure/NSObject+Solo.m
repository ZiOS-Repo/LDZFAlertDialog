//
//  NSObject+Solo.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/1.
//

#import "NSObject+Solo.h"
#import <UIKit/UIKit.h>

@implementation NSObject (Solo)
+ (nullable UIWindow *)solo_window {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

- (nullable UIViewController *)solo_topViewController {
    UIWindow * window = [NSObject solo_window];
    return [self solo_topViewController:window.rootViewController];
}

- (nullable UIViewController *)solo_topViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self solo_topViewController:[navigationController.viewControllers lastObject]];
    }
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabController = (UITabBarController *)rootViewController;
        return [self solo_topViewController:tabController.selectedViewController];
    }
    if (rootViewController.presentedViewController) {
        return [self solo_topViewController:rootViewController.presentedViewController];
    }
    return rootViewController;
}

-(NSString *)solo_JSONString
{
    if (!self || ![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&err];
    if (err || !jsonData) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
