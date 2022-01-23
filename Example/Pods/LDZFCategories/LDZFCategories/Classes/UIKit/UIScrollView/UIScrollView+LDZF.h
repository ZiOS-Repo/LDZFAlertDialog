//
//  UIScrollView+LDZF.h
//  IU_Categories
//
//  Created by zhuyuhui on 2021/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (LDZF)

/**
 Scroll content to top with animation.
 */
- (void)ldzf_scrollToTop;

/**
 Scroll content to bottom with animation.
 */
- (void)ldzf_scrollToBottom;

/**
 Scroll content to left with animation.
 */
- (void)ldzf_scrollToLeft;

/**
 Scroll content to right with animation.
 */
- (void)ldzf_scrollToRight;

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)ldzf_scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)ldzf_scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)ldzf_scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)ldzf_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
