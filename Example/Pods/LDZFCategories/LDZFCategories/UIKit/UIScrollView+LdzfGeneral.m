//
//  UIScrollView+LdzfGeneral.m
//  IU_Categories
//
//  Created by zhuyuhui on 2021/6/20.
//

#import "UIScrollView+LdzfGeneral.h"

@implementation UIScrollView (LdzfGeneral)
- (void)qnm_scrollToTop {
    [self qnm_scrollToTopAnimated:YES];
}

- (void)qnm_scrollToBottom {
    [self qnm_scrollToBottomAnimated:YES];
}

- (void)qnm_scrollToLeft {
    [self qnm_scrollToLeftAnimated:YES];
}

- (void)qnm_scrollToRight {
    [self qnm_scrollToRightAnimated:YES];
}

- (void)qnm_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)qnm_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)qnm_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)qnm_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
