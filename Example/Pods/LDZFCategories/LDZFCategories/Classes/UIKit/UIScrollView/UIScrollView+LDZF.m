//
//  UIScrollView+LDZF.m
//  IU_Categories
//
//  Created by zhuyuhui on 2021/6/20.
//

#import "UIScrollView+LDZF.h"

@implementation UIScrollView (LDZF)
- (void)ldzf_scrollToTop {
    [self ldzf_scrollToTopAnimated:YES];
}

- (void)ldzf_scrollToBottom {
    [self ldzf_scrollToBottomAnimated:YES];
}

- (void)ldzf_scrollToLeft {
    [self ldzf_scrollToLeftAnimated:YES];
}

- (void)ldzf_scrollToRight {
    [self ldzf_scrollToRightAnimated:YES];
}

- (void)ldzf_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)ldzf_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)ldzf_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)ldzf_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
