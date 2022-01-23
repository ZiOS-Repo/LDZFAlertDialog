//
//  UIViewController+LDZFGeneral.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import "UIViewController+LDZFGeneral.h"

@implementation UIViewController (LDZFGeneral)
- (UIViewController *)ldzf_previousViewController {
    if (self.navigationController.viewControllers && self.navigationController.viewControllers.count > 1 && self.navigationController.topViewController == self) {
        NSUInteger count = self.navigationController.viewControllers.count;
        return (UIViewController *)[self.navigationController.viewControllers objectAtIndex:count - 2];
    }
    return nil;
}

@end
