//
//  UIScrollView+LdzfGeneral.h
//  IU_Categories
//
//  Created by zhuyuhui on 2021/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (LdzfGeneral)
- (void)qnm_scrollToTop;
- (void)qnm_scrollToBottom;
- (void)qnm_scrollToLeft;
- (void)qnm_scrollToRight;
- (void)qnm_scrollToTopAnimated:(BOOL)animated;
- (void)qnm_scrollToBottomAnimated:(BOOL)animated;
- (void)qnm_scrollToLeftAnimated:(BOOL)animated;
- (void)qnm_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
