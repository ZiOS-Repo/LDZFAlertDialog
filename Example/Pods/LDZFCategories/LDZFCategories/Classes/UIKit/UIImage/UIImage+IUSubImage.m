//
//  UIImage+IUSubImage.m
//  IU_Categories
//
//  Created by zhuyuhui on 2021/7/3.
//

#import "UIImage+IUSubImage.h"

@implementation UIImage (IUSubImage)

///截取当前image对象rect区域内的图像
- (UIImage *)iu_subImageWithRect:(CGRect)rect {
    CGImageRef newImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    CGImageRelease(newImageRef);
    return newImage;
}

///压缩图片至指定尺寸
- (UIImage *)iu_rescaleImageToSize:(CGSize)size {
    CGRect rect = (CGRect){CGPointZero, size};
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}

///压缩图片至指定像素
- (UIImage *)iu_rescaleImageToPX:(CGFloat )toPX {
    CGSize size = self.size;
    if(size.width <= toPX && size.height <= toPX)
    {
        return self;
    }
    CGFloat scale = size.width / size.height;
    
    if(size.width > size.height)
    {
        size.width = toPX;
        size.height = size.width / scale;
    }
    else
    {
        size.height = toPX;
        size.width = size.height * scale;
    }
    return [self iu_rescaleImageToSize:size];
}

///指定大小生成一个平铺的图片
- (UIImage *)iu_getTiledImageWithSize:(CGSize)size {
    UIView *tempView = [[UIView alloc] init];
    tempView.bounds = (CGRect){CGPointZero, size};
    tempView.backgroundColor = [UIColor colorWithPatternImage:self];
    
    UIGraphicsBeginImageContext(size);
    [tempView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *bgImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return bgImage;
}

///UIView转化为UIImage
+ (UIImage *)iu_imageFromView:(UIView *)view {
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

///将两个图片生成一张图片
+ (UIImage*)iu_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage {
    CGImageRef firstImageRef = firstImage.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    CGImageRef secondImageRef = secondImage.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergedSize);
    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
