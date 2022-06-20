//
//  UIView+LdzfGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LdzfGeneral)

#pragma mark - General
/// 屏幕快照
- (UIImage *)qnm_snapshot;

/// 屏幕快照生成pdf
- (NSData *)qnm_snapshotPDF;

/// 截取 view 上某个位置的图像
- (UIImage *)qnm_cutoutInViewWithRect:(CGRect)rect;

/// 毛玻璃效果
/// @param blurStyle 模糊程度
- (void)qnm_addBlurEffectWith:(UIBlurEffectStyle)blurStyle;

#pragma mark - Draw

/**
 添加圆角，适用于自动布局，传入设置frame

 @param rect 目标view的frame
 @param corner 圆角位置
 @param radius 圆角大小
 */
- (void)qnm_addRectCornerWithViewBounds:(CGRect)rect corner:(UIRectCorner)corner radius:(CGFloat)radius;

/**
 添加圆角,适用于已知frame，即非自动布局

 @param corner 圆角位置
 @param radius 圆角大小
 */
- (void)qnm_addRectCornerWith:(UIRectCorner)corner radius:(CGFloat)radius;

/**
 添加圆角，适用于已知frame，即非自动布局，圆角位置为UIRectCornerAllCorners

 @param radius 圆角大小
 */
- (void)qnm_addAllCornerWith:(CGFloat)radius;

/**
 添加圆角，适用于自动布局，传入设置frame，圆角位置为UIRectCornerAllCorners

 @param rect 目标view的frame
 @param radius 圆角大小
 */
- (void)qnm_addAllCornerWithViewBounds:(CGRect)rect radius:(CGFloat)radius;

/**
 绘制虚线

 @param pointArr 通过NSStringFromCGPoint传入坐标数组
 @param lineWidth 虚线的宽度
 @param lineLength 虚线的长度
 @param lineSpacing 虚线的间距
 @param lineColor 虚线的颜色
 */
- (void)qnm_drawDashLineWithpointArray:(NSArray *)pointArr lineWidth:(float)lineWidth lineLength:(float)lineLength lineSpacing:(float)lineSpacing lineColor:(UIColor *)lineColor;



// 获取view的父控制器
- (UIViewController*)qnm_viewController;
@end

NS_ASSUME_NONNULL_END
