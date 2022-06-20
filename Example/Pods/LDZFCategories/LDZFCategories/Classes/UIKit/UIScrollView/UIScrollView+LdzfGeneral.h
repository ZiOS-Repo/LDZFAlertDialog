//
//  UIScrollView+LdzfGeneral.h
//  IU_Categories
//
//  Created by zhuyuhui on 2021/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (LdzfGeneral)

/**
 Scroll content to top with animation.
 */
- (void)qnm_scrollToTop;

/**
 Scroll content to bottom with animation.
 */
- (void)qnm_scrollToBottom;

/**
 Scroll content to left with animation.
 */
- (void)qnm_scrollToLeft;

/**
 Scroll content to right with animation.
 */
- (void)qnm_scrollToRight;

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)qnm_scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)qnm_scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)qnm_scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)qnm_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
