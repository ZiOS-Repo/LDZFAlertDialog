//
//  NSObject+LdzfGeneral.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/1.
//

#import "NSObject+LdzfGeneral.h"
#import <UIKit/UIKit.h>

@implementation NSObject (LdzfGeneral)
+ (nullable UIWindow *)qnm_window {
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

- (nullable UIViewController *)qnm_topViewController {
    UIWindow * window = [NSObject qnm_window];
    return [self qnm_topViewController:window.rootViewController];
}

- (nullable UIViewController *)qnm_topViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self qnm_topViewController:[navigationController.viewControllers lastObject]];
    }
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabController = (UITabBarController *)rootViewController;
        return [self qnm_topViewController:tabController.selectedViewController];
    }
    if (rootViewController.presentedViewController) {
        return [self qnm_topViewController:rootViewController.presentedViewController];
    }
    return rootViewController;
}



-(id)qnm_JSONValue
{
    if (!self || ![self isKindOfClass:NSString.class]) {
        return nil;
    }
    NSString *str = (NSString *)self;
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err || !jsonObject) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return jsonObject;
}

-(NSString *)qnm_JSONString
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
