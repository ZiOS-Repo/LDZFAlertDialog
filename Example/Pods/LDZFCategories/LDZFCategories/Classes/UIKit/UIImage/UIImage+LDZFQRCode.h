//
//  UIImage+LdzfQRCode.h
//  JXCategoryKit
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LdzfQRCode)

/// 生成二维码
/// @param content 内容
/// @param outputSize 生成尺寸
/// @param tintColor 颜色，设置颜色时背景会变为透明
/// @param logo logo图
/// @param logoFrame logo位置
/// @param isHighLevel 是否高清，设置颜色和logo默认高清
+ (UIImage *)qnm_qrHUDImageByContent:(NSString *)content outputSize:(CGFloat)outputSize tintColor:(nullable UIColor *)tintColor logo:(nullable UIImage *)logo logoFrame:(CGRect)logoFrame isCorrectionHighLevel:(BOOL)isHighLevel;

/// 生成高清二维码图片（默认大小为430*430）
/// @param content 内容
+ (UIImage *)qnm_qrImageByContent:(NSString *)content;

/// 生成高清二维码
/// @param content 内容
/// @param outputSize 输出尺寸
+ (UIImage *)qnm_qrHUDImageByContent:(NSString *)content outputSize:(CGFloat)outputSize;

/// 生成高清二维码
/// @param content 内容
/// @param outputSize 输出尺寸
/// @param color 颜色
+ (UIImage *)qnm_qrImageByContent:(NSString *)content outputSize:(CGFloat)outputSize color:(nullable UIColor *)color;

/// 生成高清二维码
/// @param content 内容
/// @param logo logo，默认放在中间位置
+ (UIImage *)qnm_qrImageWithContent:(NSString *)content outputSize:(CGFloat)outputSize logo:(nullable UIImage *)logo;

/**
 获取二维码内内容
 */
- (NSString *)qnm_getQRCodeContentString;

@end

NS_ASSUME_NONNULL_END
