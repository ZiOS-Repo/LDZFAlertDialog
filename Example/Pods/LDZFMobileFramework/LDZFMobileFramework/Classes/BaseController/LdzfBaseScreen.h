//
//  LdzfBaseScreen.h
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import <UIKit/UIKit.h>
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import "LdzfAppBar.h"
#import "LdzfMobileFrameworkUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface LdzfBaseScreen : UIViewController
/**
 *    @brief    自定义导航条
 */
@property(nonatomic, strong, readonly) LdzfAppBar *appBar;
/**
 *    @brief    是否隐藏自定义导航条
 */
@property(nonatomic, assign) BOOL hideAppBar;
/**
 *    @brief    设置标题
 */
@property(nonatomic, copy) NSString *navTitle;
/**
 *    @brief    自定义导航条背景色
 */
@property(nonatomic, strong) UIColor *appBarBgColor;
/**
 *    @brief    自定义导航条背景图片
 */
@property(nonatomic, strong) UIImage *appBarBgImage;
/**
 *    @brief    内容视图【层级在自定义导航条下边】
 */
@property(nonatomic, strong, readonly) UIView *ldzfView;
/**
 *    @brief    返回按钮
 */
@property(nonatomic, strong) UIButton *backBtn;
/*!
 *    @brief  判断UIStatusBarStyle
 */
@property(nonatomic, assign) BOOL isLightContentStyle;

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
/*!
 *  @brief  设置UIStatusBarStyle
 */
- (void)statusBarIsLightContentStyle:(BOOL)boolValue;

#pragma mark - getter
///返回键图标,子类可以重写该方法
- (UIImage *)getBackItemImage;
@end

NS_ASSUME_NONNULL_END
