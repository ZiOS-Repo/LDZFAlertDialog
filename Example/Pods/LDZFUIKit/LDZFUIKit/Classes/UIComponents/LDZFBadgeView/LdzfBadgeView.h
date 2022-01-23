//
//  LdzfBadgeView.h
//  LdzfBadgeView_Example
//
//  Created by zhuyuhui on 2020/9/6.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LDZFCategories/LDZFCategories.h>
typedef NS_ENUM(NSUInteger, LDZFBadgePosition) {
    
    LDZFBadgePositionCenterLeft,
    LDZFBadgePositionCenterRight,
    
    LDZFBadgePositionTopLeft,
    LDZFBadgePositionTopRight,
    
    LDZFBadgePositionBottomLeft,
    LDZFBadgePositionBottomRight,
};

@interface LdzfBadgeView : UIView

/**
 *  bedge值
 */
@property (nonatomic, strong) NSString  *badgeValue;

/**
 *  被附着的view
 */
@property (nonatomic, weak)   UIView    *contentView;

/**
 *  敏感增长宽度,默认为10
 */
@property (nonatomic)  CGFloat        sensitiveWidth;

/**
 *  固定高度,默认为20
 */
@property (nonatomic)  CGFloat        fixedHeight;

/**
 *  位置信息,默认为BadgePositionTopRight
 */
@property (nonatomic)  LDZFBadgePosition  position;

/**
 *  字体,默认为12
 */
@property (nonatomic, strong) UIFont    *font;

/**
 *  字体颜色,默认为白色
 */
@property (nonatomic, strong) UIColor   *textColor;

/**
 *  bedge颜色,默认为红色
 */
@property (nonatomic, strong) UIColor   *badgeColor;

/**
 *  开始生效
 */
- (void)makeEffect;

/**
 *  设置BadgeValue
 *
 *  @param value    BadgeValue
 *  @param animated 是否执行动画
 */
- (void)setBadgeValue:(NSString *)value animated:(BOOL)animated;

@end
/*
 使用示例：
 
 UIView *rectView           = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
 rectView.layer.borderWidth = 0.5f;
 rectView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
 rectView.center            = self.view.center;
 [self.view addSubview:rectView];
 
 {
     LdzfBadgeView *badgeView = [[LdzfBadgeView alloc] init];
     badgeView.contentView     = rectView;
     badgeView.sensitiveWidth  = 30.f;
     badgeView.position        = LDZFBadgePositionCenterLeft;
     [badgeView makeEffect];
     badgeView.badgeValue = @"Good";
     
     [GCDQueue executeInMainQueue:^{
         
         badgeView.badgeValue = @"GCDQueue";
         
     } afterDelaySecs:5.f];
 }
 
 {
     LdzfBadgeView *badgeView = [[LdzfBadgeView alloc] init];
     badgeView.contentView     = rectView;
     badgeView.position        = LDZFBadgePositionTopLeft;
     badgeView.badgeColor      = [UIColor blackColor];
     badgeView.sensitiveWidth  = 30.f;
     [badgeView makeEffect];
     badgeView.badgeValue = @"0";
     
     [GCDQueue executeInMainQueue:^{
         [badgeView setBadgeValue:@"10000+" animated:YES];
         
     } afterDelaySecs:5.f];
 }
 
 */

