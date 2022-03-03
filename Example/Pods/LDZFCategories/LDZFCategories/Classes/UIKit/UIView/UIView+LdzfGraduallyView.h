//
//  UIView+LdzfGraduallyView.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2022/1/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LdzfGraduallyView)
- (void)ldzf_addSimpleGraduallyLayer;
- (void)ldzf_addGraduallyLayer:(CGRect)frame;
- (void)ldzf_addGraduallyLayerWithStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor;

- (void)ldzf_addGraduallyLayer:(CGRect)frame withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor;

/// 添加渐变背景带圆角
/// @param frame frame
/// @param cornerRadius 圆角
/// @param startColor 渐变色起始颜色
/// @param endColor 渐变色终止颜色
- (void)ldzf_addGradientLayer:(CGRect)frame withCornerRadius:(CGFloat)cornerRadius withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor;

/// 添加渐变色边框
/// @param frame frame
/// @param borderWidth 边框宽度
/// @param cornerRadius 圆角
/// @param startColor 渐变色起始颜色
/// @param endColor 渐变色终止颜色
- (void)ldzf_addGradientBorderLayer:(CGRect)frame withBorderWidth:(CGFloat)borderWidth withCornerRadius:(CGFloat)cornerRadius withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor;


- (CAGradientLayer *)ldzf_achiveGraduallylayer;

- (void)ldzf_removeGradientLayer;

- (CAGradientLayer *)ldzf_graduallylayer;

@end

NS_ASSUME_NONNULL_END
