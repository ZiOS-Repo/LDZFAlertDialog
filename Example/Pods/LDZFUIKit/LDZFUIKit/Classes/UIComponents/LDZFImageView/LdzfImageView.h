//
//  LdzfImageView.h
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>
@interface LdzfImageView : UIView
/**
 *  Picture's url string.
 */
@property (nonatomic, strong) NSString *urlString;

/**
 *  The placeholder's image.
 */
@property (nonatomic, strong) UIImage  *placeholderImage;

/**
 *  Default is UIViewContentModeScaleAspectFill.
 */
@property (nonatomic) UIViewContentMode placeholderImageContentMode;

/**
 *  Default is UIViewContentModeScaleAspectFill.
 */
@property (nonatomic) UIViewContentMode contentImageContentMode;

/**
 A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle, default value is UIRectCornerAllCorners.
 */
@property (nonatomic) UIRectCorner rectCorner;

/**
 The radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height, default value is CGSizeZero.
 */
@property (nonatomic) CGSize cornerRadii;

@end

