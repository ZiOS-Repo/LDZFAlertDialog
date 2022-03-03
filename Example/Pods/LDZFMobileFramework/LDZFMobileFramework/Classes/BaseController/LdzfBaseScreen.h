//
//  LdzfBaseScreen.h
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import <UIKit/UIKit.h>
#import "LdzfAppBar.h"
#import "LdzfMobileFrameworkUtil.h"
#import "LDZFMobileFrameworkThirdHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface LdzfBaseScreen : UIViewController
/// 自定义导航条
@property(nonatomic, strong, readonly) LdzfAppBar *appBar;
/// 内容视图【层级在自定义导航条下边】
@property(nonatomic, strong, readonly) UIView *ldzfView;
/// 返回按钮
@property(nonatomic, strong, readonly) UIButton *backBtn;
#pragma mark - init
/**
 *  init时调用，初始化一些基础数据，属性，可重载
 */
- (void)ldzfSetUp;
- (void)ldzfInitSubviews;
- (void)ldzfSetUpNavigationItems;
- (void)ldzfSetUpToolbarItems;
#pragma mark - 点击事件
/*!
 *  @brief  默认返回前一页面,子类可以重写该方法
 */
- (void)ldzfClickBackItem;

#pragma mark - Useful Method
- (void)resetStatusBarStyle:(UIStatusBarStyle)style;
- (void)resetNavHidden:(BOOL)hidden;
- (void)resetNavTitle:(NSString *)title;
- (void)resetNavBackgroundColor:(UIColor *)color;
- (void)resetNavBackgroundImg:(UIImage *)img;
- (void)resetNavBackItemImage:(UIImage *)img;
@end

NS_ASSUME_NONNULL_END
