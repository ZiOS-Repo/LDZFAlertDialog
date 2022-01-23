//
//  NSBundle+LDZFPodBundle.h
//  CRJCategories
//
//  Created by zhuyuhui on 2020/9/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSBundle (LDZFPodBundle)
/**
 获取Pod库中的指定NSBundle
 Pod库中可能存在多个.bundle文件
 @param bundleName bundle名字
 @param podName pod的名字
 @return bundle
 */
+ (nullable NSBundle *)ldzf_subBundle:(NSString *)bundleName
                              podName:(NSString *)podName;
@end

NS_ASSUME_NONNULL_END
