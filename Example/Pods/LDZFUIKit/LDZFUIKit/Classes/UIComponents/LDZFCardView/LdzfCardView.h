//
//  LdzfCardView.h
//  LDZFUIKit
//
//  Created by zhuyuhui on 2021/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LdzfCardView : UIView
/**
 A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle, default value is UIRectCornerAllCorners.
 */
@property (nonatomic) UIRectCorner rectCorner;

/**
 The radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height, default value is CGSizeZero.
 */
@property (nonatomic) CGSize cornerRadii;

@end

NS_ASSUME_NONNULL_END
