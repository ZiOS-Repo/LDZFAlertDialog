//
//  LdzfIconEdgeInsetsLabel.h
//  LdzfEdgeInsetsLabel
//
//  Created by zhuyuhui on 2020/9/7.
//

#import <UIKit/UIKit.h>
#import <LDZFCategories/LDZFCategories.h>
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    IconAtLeft,
    IconAtRight,
} IconEdgeDirection;
@interface LdzfIconEdgeInsetsLabel : UILabel
@property (nonatomic, strong) UIView             *iconView;
@property (nonatomic)         UIEdgeInsets        edgeInsets;
@property (nonatomic)         IconEdgeDirection  direction;
@property (nonatomic)         CGFloat             gap;

- (void)sizeToFitWithText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
