//
//  IUBaseScreen.h
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import <UIKit/UIKit.h>
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import "IUAppBar.h"
#import "IUMobileFrameworkTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface IUBaseScreen : UIViewController
/**
 *    @brief    自定义导航条
 */
@property(nonatomic, strong, readonly) IUAppBar *appBar;
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
@property(nonatomic, strong, readonly) UIView *iuView;
/**
 *    @brief    返回按钮
 */
@property(nonatomic, strong) UIButton *backItem;
/*!
 *    @brief  判断UIStatusBarStyle
 */
@property(nonatomic, assign) BOOL isLightContentStyle;

#pragma mark - init
/**
 *  init时调用，初始化一些基础数据，属性，可重载
 */
- (void)iuSetUp;
- (void)iuInitSubviews;
- (void)iuSetUpNavigationItems;
- (void)iuSetUpToolbarItems;
#pragma mark - 点击事件
/*!
 *  @brief  默认返回前一页面,子类可以重写该方法
 */
- (void)iuClickBackItem;

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
