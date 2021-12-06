//
//  IUBaseScreen.m
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import "IUBaseScreen.h"
@interface IUBaseScreen ()
/**
 *    @brief    自定义导航条
 */
@property(nonatomic, strong, readwrite) IUAppBar *appBar;
/**
 *    @brief    内容视图【层级在自定义导航条下边】
 */
@property(nonatomic, strong, readwrite) UIView *iuView;
@end

@implementation IUBaseScreen

- (id)init{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        [self iuSetUp];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self iuSetUp];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self =[super initWithCoder:aDecoder]) {
        [self iuSetUp];
    }
    return self;
}

///// 返回 iOS 如何判断当前页面是push进入还是present进入
//- (BOOL)checkIsPresented{
//    if (self.presentingViewController && self.navigationController.viewControllers.count == 1) {
//        return YES;
//    } else {
//        return NO;
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self iuInitSubviews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self iuSetUpNavigationItems];
    [self iuSetUpToolbarItems];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.iuView.frame = CGRectMake(0, NavigationContentTopConstant, self.view.width, self.view.height - NavigationContentTopConstant);
}

#pragma mark - IUBaseScreenProtocol
#pragma mark - init
- (void)iuSetUp {
    self.hideAppBar = NO;
    self.fd_prefersNavigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)iuInitSubviews {
    self.iuView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.iuView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.iuView];
    
    [self.view addSubview:self.appBar];
    self.appBarBgColor = [UIColor whiteColor];
    [self.view bringSubviewToFront:self.appBar];
}

- (void)iuSetUpNavigationItems {
    if (self.navigationController.viewControllers.count > 1) {
        NSMutableArray *L_Items = [NSMutableArray array];
        NSMutableArray *R_Items = [NSMutableArray array];
        
        [L_Items addObject:self.backItem];
        [self.appBar setLeftItems:L_Items];
        [self.appBar setRightItems:R_Items];
    }
}

- (void)iuSetUpToolbarItems {
    
}
#pragma mark - 点击事件
- (void)iuClickBackItem{
    if (self.presentingViewController && self.navigationController.viewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Useful Method
- (void)statusBarIsLightContentStyle:(BOOL)boolValue{
    if (self.isLightContentStyle == boolValue) {
        return;
    }
    self.isLightContentStyle = boolValue;
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - getter & sertter
- (IUAppBar *)appBar {
    if (!_appBar) {
        _appBar = [[IUAppBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NavigationContentTopConstant)];
        _appBar.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _appBar.titleLabel.textColor = [UIColor blackColor];
        _appBar.divideLine.backgroundColor = kHexColor(0xEEEEEE);
    }
    return  _appBar;
}

- (UIButton *)backItem{
    if (!_backItem) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, NavigationBarHeight, NavigationBarHeight)];
        [btn setImage:[self getBackItemImage] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(iuClickBackItem) forControlEvents:UIControlEventTouchUpInside];
        _backItem = btn;
    }
    return _backItem;
}

- (UIImage *)getBackItemImage {
    return [IUMobileFrameworkTool imageNamed:@"navigation_back"];
}

- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    if (self.appBar) {
        self.appBar.titleLabel.text = navTitle;
        [self.appBar setNeedsLayout];
    }
}

- (void)setAppBarBgColor:(UIColor *)appBarBgColor {
    _appBarBgColor = appBarBgColor;
    if (self.appBar) {
        self.appBar.bgView.backgroundColor = appBarBgColor;
    }
}

- (void)setAppBarBgImage:(UIImage *)appBarBgImage {
    _appBarBgImage = appBarBgImage;
    if (self.appBar) {
        self.appBar.bgView.image = appBarBgImage;
    }
}

- (void)setHideAppBar:(BOOL)hideAppBar {
    _hideAppBar = hideAppBar;
    self.appBar.hidden = hideAppBar;
}

#pragma mark - Orientation
//是否跟随屏幕旋转
- (BOOL)shouldAutorotate{
    return NO;
}
//支持旋转的方向有哪些
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskAll);
}
//控制 vc present进来的横竖屏和进入方向 ，支持的旋转方向必须包含改返回值的方向 （详细的说明见下文）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Status bar
- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    if (!self.isLightContentStyle) {
        return UIStatusBarStyleDefault;
    }
    return UIStatusBarStyleLightContent;
}


@end
