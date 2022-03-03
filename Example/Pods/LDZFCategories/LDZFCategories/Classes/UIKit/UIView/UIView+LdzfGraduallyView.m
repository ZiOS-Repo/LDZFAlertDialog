//
//  UIView+LdzfGraduallyView.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2022/1/25.
//

#import "UIView+LdzfGraduallyView.h"
#import "UIColor+Categorys.h"
@implementation UIView (LdzfGraduallyView)
- (void)ldzf_addSimpleGraduallyLayer {
    
    [self ldzf_addGraduallyLayer:self.bounds withStartColor:kHexColor(0xEEEEEE) withendColor:kHexColor(0xD8D8D8)];
}

- (void)ldzf_addGraduallyLayer:(CGRect)frame {
    [self ldzf_addGraduallyLayer:frame withStartColor:kHexColor(0xEEEEEE) withendColor:kHexColor(0xD8D8D8)];
}

- (void)ldzf_addGraduallyLayerWithStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor {
    [self ldzf_addGraduallyLayerWithStartColor:startColor withendColor:endColor];
}

- (void)ldzf_addGraduallyLayer:(CGRect)frame withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor {
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = frame;
    [self.layer addSublayer:gradientLayer];
}

- (void)ldzf_addGradientLayer:(CGRect)frame withCornerRadius:(CGFloat)cornerRadius withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor {
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = frame;
    gradientLayer.cornerRadius = cornerRadius;
    gradientLayer.masksToBounds = YES;
    [self.layer addSublayer:gradientLayer];
}

- (void)ldzf_addGradientBorderLayer:(CGRect)frame withBorderWidth:(CGFloat)borderWidth withCornerRadius:(CGFloat)cornerRadius withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor {
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer]; //添加渐变背景色
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = frame;
    gradientLayer.cornerRadius = cornerRadius;
    gradientLayer.masksToBounds = YES;

    CALayer *maskLayer = [CALayer layer]; //添加白色遮罩
    maskLayer.backgroundColor = UIColor.whiteColor.CGColor;
    maskLayer.masksToBounds = YES;
    maskLayer.cornerRadius = cornerRadius - borderWidth;
    maskLayer.frame = CGRectMake(borderWidth, borderWidth, frame.size.width - 2 * borderWidth, frame.size.height - 2 * borderWidth);
    [self.layer addSublayer:gradientLayer];
    [self.layer addSublayer:maskLayer];
}

- (CAGradientLayer *)ldzf_graduallylayer {
    CAGradientLayer *gradlayer;
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            gradlayer = (CAGradientLayer *)layer;
            break;
        }
    }
    return gradlayer;
}

- (CAGradientLayer *)ldzf_achiveGraduallylayer
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    return gradientLayer;
}

- (void)ldzf_removeGradientLayer
{
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
}

@end
