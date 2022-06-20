//
//  UIImage+LdzfEffect.h
//  JXCategoryKit
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LdzfEffect)

/// 使用CoreImage技术使图片模糊
/// @param blurNum 模糊数值 0~100 （默认100）
- (UIImage *)qnm_blurImageWithCoreImageBlurNumber:(CGFloat)blurNum;

/// 使用Accelerate技术模糊图片，模糊效果比CoreImage效果更美观，效率要比CoreImage要高，处理速度快
/// @param blurValue 模糊数值 0 ~ 1.0，默认0.1
- (UIImage *)qnm_blurImageWithAccelerateBlurValue:(CGFloat)blurValue;

/// 高亮模糊
-(UIImage *)qnm_applyLightEffect;

/// 轻度亮模糊
-(UIImage *)qnm_applyExtraLightEffect;

/// 暗色模糊
-(UIImage *)qnm_applyDarkEffect;

/// 自定义颜色模糊图片
/// @param tintColor 影响颜色
-(UIImage *)qnm_applyTintEffectWithColor:(UIColor*)tintColor;

/// 模糊图片
/// @param blurRadius 模糊半径
/// @param tintColor 颜色
/// @param saturationDeltaFactor 饱和增量因子 0 图片色为黑白 小于0颜色反转 大于0颜色增深
/// @param maskImage 遮罩图像
-(UIImage*)qnm_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor*)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(nullable UIImage*)maskImage;

@end

NS_ASSUME_NONNULL_END
