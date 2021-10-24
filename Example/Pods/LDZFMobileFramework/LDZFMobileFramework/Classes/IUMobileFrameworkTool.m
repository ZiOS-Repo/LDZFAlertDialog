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
    NSString *ext = name.pathExtension;
    if (ext.length == 0) ext = @"png";
    NSString *path;
    NSBundle *addBundle = [self AssetsBundle];
    NSString *pass = [NSString stringWithFormat:@"%@.%@",name,ext];
    path = [addBundle.bundlePath stringByAppendingPathComponent:pass];
    if (!path) return nil;
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
