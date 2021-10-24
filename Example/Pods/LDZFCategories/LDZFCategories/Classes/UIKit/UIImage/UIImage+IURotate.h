//
//  UIImage+IURotate.h
//  UIImage+Categories
//
//  Created by qinmin on 2017/4/13.
//  Copyright © 2017年 qinmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IURotate)

/** 纠正图片的方向 */
- (UIImage *)iu_fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)iu_rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)iu_flipVertical;

/** 水平翻转 */
- (UIImage *)iu_flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)iu_imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)iu_imageRotatedByRadians:(CGFloat)radians;

@end
