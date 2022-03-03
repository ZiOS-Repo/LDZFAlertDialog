//
//  UIViewController+LdzfGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LdzfGeneral)
/** 获取和自身处于同一个UINavigationController里的上一个UIViewController */
@property(nullable, nonatomic, weak, readonly) UIViewController *ldzf_previousViewController;


@end

NS_ASSUME_NONNULL_END
