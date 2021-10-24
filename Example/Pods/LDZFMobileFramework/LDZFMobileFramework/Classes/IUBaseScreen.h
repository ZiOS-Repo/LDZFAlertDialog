//
//  IUBaseScreen.h
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import <UIKit/UIKit.h>
#import "FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h"
#import "LDZFCategories/LDZFCategories.h"
#import "LDZFGeneralTools/LDZFGeneralTools.h"
#import "IUScreenProtocol.h"

#import "IUAppBar.h"
#import "IUMobileFrameworkTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface IUBaseScreen : UIViewController<IUBaseScreenProtocol>
/// 自定义导航条
@property (nonatomic, strong) UIView<IUAppBarProtocol> *appBar;
/// 内容视图【子视图应加入该视图】
@property (nonatomic, strong) UIView *iuView;
/// 返回按钮
@property (nonatomic, strong) UIButton *backItem;

@end

NS_ASSUME_NONNULL_END
