//
//  UIImage+IUSubImage.h
//  IU_Categories
//
//  Created by zhuyuhui on 2021/7/3.
//

#import <UIKit/UIKit.h>

@interface UIImage (IUSubImage)

///截取当前image对象rect区域内的图像
- (UIImage *)iu_subImageWithRect:(CGRect)rect;
///压缩图片至指定尺寸
- (UIImage *)iu_rescaleImageToSize:(CGSize)size;

///压缩图片至指定像素
- (UIImage *)iu_rescaleImageToPX:(CGFloat )toPX;

///指定大小生成一个平铺的图片
- (UIImage *)iu_getTiledImageWithSize:(CGSize)size;

///UIView转化为UIImage
+ (UIImage *)iu_imageFromView:(UIView *)view;

///将两个图片生成一张图片
+ (UIImage*)iu_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;
@end

