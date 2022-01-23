//
//  NSBundle+LDZFPodBundle.m
//  CRJCategories
//
//  Created by zhuyuhui on 2020/9/22.
//

#import "NSBundle+LDZFPodBundle.h"

@implementation NSBundle (LDZFPodBundle)

+ (NSBundle *)ldzf_subBundle:(NSString *)bundleName podName:(NSString *)podName;
{
    if (bundleName == nil || podName == nil) {
        return nil;
    }
    
    //去除文件后缀
    if ([bundleName containsString:@".bundle"]) {
        bundleName = [bundleName componentsSeparatedByString:@".bundle"].firstObject;
    }
    
    
    //没使用framwork的情况下
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    
    if (!associateBundleURL) {//使用framework形式
        associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
        associateBundleURL = [associateBundleURL URLByAppendingPathComponent:podName];
        associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
        NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
        associateBundleURL = [associateBunle URLForResource:bundleName withExtension:@"bundle"];
    }
    //生产环境直接返回空
    return associateBundleURL?[NSBundle bundleWithURL:associateBundleURL]:nil;
}



@end
