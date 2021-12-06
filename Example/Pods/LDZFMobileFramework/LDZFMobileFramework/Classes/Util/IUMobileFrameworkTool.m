//
//  IUMobileFrameworkTool.m
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import "IUMobileFrameworkTool.h"
#import <LDZFCategories/LDZFCategories.h>
@implementation IUMobileFrameworkTool
+ (NSBundle *)AssetsBundle {
    static NSBundle *bundle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle subBundleWithBundleName:@"LDZFMobileFramework" podName:@"LDZFMobileFramework"];
    });
    return bundle;
}

+ (NSBundle *)AssetsExtBundle {
    static NSBundle *bundle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle subBundleWithBundleName:@"LDZFMobileFrameworkExt" podName:@"LDZFMobileFramework"];
    });
    return bundle;
}

+ (UIImage *)imageNamed:(NSString *)name{
    if (!name) return nil;
    NSBundle *addBundle = [self AssetsBundle];
    UIImage *image = [UIImage imageNamed:name inBundle:addBundle compatibleWithTraitCollection:nil];
    return image;
}

@end