//
//  UIView+LdzfGesture.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import "UIView+LdzfGesture.h"

@implementation UIView (LdzfGesture)

// 添加Tap手势
- (void)ldzf_addTapGestureRecognizerWithTarget:(id)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

// 添加Pan手势
- (void)ldzf_addPanGestureRecognizerWithTarget:(id)target action:(SEL)action {
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

// 添加LongPress手势
- (void)ldzf_addLongPressGestureRecognizerWithTarget:(id)target action:(SEL)action {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:longPress];
}

@end
