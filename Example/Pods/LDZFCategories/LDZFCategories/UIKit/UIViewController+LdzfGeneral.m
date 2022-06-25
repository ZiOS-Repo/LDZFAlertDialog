//
//  UIViewController+LdzfGeneral.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import "UIViewController+LdzfGeneral.h"

@implementation UIViewController (LdzfGeneral)
- (UIViewController *)qnm_previousViewController {
    if (self.navigationController.viewControllers && self.navigationController.viewControllers.count > 1 && self.navigationController.topViewController == self) {
        NSUInteger count = self.navigationController.viewControllers.count;
        return (UIViewController *)[self.navigationController.viewControllers objectAtIndex:count - 2];
    }
    return nil;
}

@end
