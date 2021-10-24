
#import <UIKit/UIKit.h>

@interface UIImage (IUColor)
+ (UIImage *)iu_imageWithSize:(CGSize)size
                        color:(UIColor *)color;

+ (UIImage *)iu_imageWithSize:(CGSize)size
                    drawBlock:(void (^)(CGContextRef context))drawBlock;

- (UIImage *)iu_imageByRoundCornerRadius:(CGFloat)radius;

- (UIImage *)iu_imageByRoundCornerRadius:(CGFloat)radius
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(UIColor *)borderColor;

- (UIImage *)iu_imageByRoundCornerRadius:(CGFloat)radius
                                 corners:(UIRectCorner)corners
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(UIColor *)borderColor
                          borderLineJoin:(CGLineJoin)borderLineJoin ;

- (UIImage *)iu_imageByGrayscale;

- (UIImage *)iu_imageByBlurSoft;

- (UIImage *)iu_imageByBlurLight;

- (UIImage *)iu_imageByBlurExtraLight;

- (UIImage *)iu_imageByBlurDark;

- (UIImage *)iu_imageByBlurWithTint:(UIColor *)tintColor;

- (UIImage *)iu_imageByBlurRadius:(CGFloat)blurRadius
                        tintColor:(UIColor *)tintColor
                         tintMode:(CGBlendMode)tintBlendMode
                       saturation:(CGFloat)saturation
                        maskImage:(UIImage *)maskImage;

/**
 *  根据图片名返回一张能够自由拉伸的图片 (从中间拉伸)
 */
+ (UIImage *)iu_resizableImage:(NSString *)imgName;

+ (UIImage *)iu_resizableImage:(NSString *)imgName capInsets:(UIEdgeInsets)capInsets;

+ (UIImage *)iu_imageAlwaysShowOriginalImageWithImageName:(NSString *)imageName;

+ (UIImage*)iu_thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
/// 获取屏幕截图
///
/// @return 屏幕截图图像
+ (UIImage *)iu_screenShot;
@end
