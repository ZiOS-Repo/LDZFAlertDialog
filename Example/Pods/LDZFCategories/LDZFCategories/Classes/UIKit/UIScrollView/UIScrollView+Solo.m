//
//  UIScrollView+Solo.m
//  IU_Categories
//
//  Created by zhuyuhui on 2021/6/20.
//

#import "UIScrollView+Solo.h"

@implementation UIScrollView (Solo)
- (void)solo_scrollToTop {
    [self solo_scrollToTopAnimated:YES];
}

- (void)solo_scrollToBottom {
    [self solo_scrollToBottomAnimated:YES];
}

- (void)solo_scrollToLeft {
    [self solo_scrollToLeftAnimated:YES];
}

- (void)solo_scrollToRight {
    [self solo_scrollToRightAnimated:YES];
}

- (void)solo_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)solo_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)solo_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)solo_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
