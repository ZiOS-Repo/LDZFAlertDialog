//
//  PHAsset+Solo.h
//  IU_Categories
//
//  Created by zhuyuhui on 2021/7/3.
//

#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHAsset (Solo)
/**
 *  获取最新一张图片
 */
+ (PHAsset *)solo_latestAsset;

+ (UIImage *)solo_latestOriginImage;

+ (void)solo_latestImageWithSize:(CGSize)size completeBlock:(void(^)(UIImage *image))block;

@end

NS_ASSUME_NONNULL_END
