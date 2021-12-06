//
//  UIImage+SoloGenerate.h
//  JXCategoryKit
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, SoloTriangleDirection) { // 生成三角图片方向
    SoloTriangleDirection_Down,
    SoloTriangleDirection_Left,
    SoloTriangleDirection_Right,
    SoloTriangleDirection_Up
};

@interface UIImage (SoloGenerate)

/**
 生成带圆角的颜色图片

 @param tintColor 图片颜色
 @param targetSize 生成尺寸
 @param cornerRadius 圆角大小
 @param backgroundColor 背景颜色
 */
+ (UIImage *)solo_cornerRadiusImageWithColor:(UIColor *)tintColor targetSize:(CGSize)targetSize corners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor;

/**
 生成矩形的颜色图片

 @param color 图片颜色
 @param targetSize 生成尺寸
 */
+ (UIImage *)solo_squareImageWithColor:(UIColor *)color targetSize:(CGSize)targetSize;

/**
 生成带圆角的颜色图片,背景默认白色

 @param color 图片颜色
 @param targetSize 生成尺寸
 @param cornerRadius 圆角大小
 */
+ (UIImage *)solo_cornerRadiusImageWithColor:(UIColor *)color targetSize:(CGSize)targetSize cornerRadius:(CGFloat)cornerRadius;

/// 生成渐变色的UIImage
/// @param size 尺寸
/// @param colors 颜色数组
/// @param startP 开始坐标
/// @param endP 结束坐标
+ (UIImage*)solo_gradientColorImageWithSize:(CGSize)size andColors:(NSArray*)colors startPoint:(CGPoint)startP
endPoint:(CGPoint)endP;

/// 生成三角图片
/// @param size 尺寸
/// @param color 颜色
/// @param direction 三角方向
+ (UIImage *)solo_triangleImageWithSize:(CGSize)size color:(UIColor *)color direction:(SoloTriangleDirection)direction;

/// 从苹果表情符号创建图像
/// @param emoji 表情符号
/// @param size 尺寸
+ (nullable UIImage *)solo_imageWithEmoji:(NSString *)emoji size:(CGFloat)size;

/// 图像绘制block
/// @param size 尺寸
/// @param drawBlock 绘制回调
+ (nullable UIImage *)solo_imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock;


@end

NS_ASSUME_NONNULL_END
