//
//  UIView+LdzfGesture.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LdzfGesture)

/**
 添加Tap手势
 
 @param target target description
 @param action 方法名
 */
- (void)ldzf_addTapGestureRecognizerWithTarget:(id)target action:(SEL)action;

/**
 添加Pan手势
 
 @param target target description
 @param action 方法名
 */
- (void)ldzf_addPanGestureRecognizerWithTarget:(id)target action:(SEL)action;

/**
 添加LongPress手势
 
 @param target target description
 @param action 方法名
 */
- (void)ldzf_addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
