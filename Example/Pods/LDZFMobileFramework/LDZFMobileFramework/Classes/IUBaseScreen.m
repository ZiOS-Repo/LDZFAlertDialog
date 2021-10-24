//
//  IUBaseScreen.m
//  IU_MobileFramework
//
//  Created by zhuyuhui on 2021/6/10.
//

#import "IUBaseScreen.h"
@interface IUBaseScreen ()

@end

@implementation IUBaseScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    [self iuSetUp];
    [self iuInitSubviews];
    //data
    self.appBar.titleLabel.text = self.title;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self iuSetUpNavigationItems];
    [self iuSetUpToolbarItems];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.appBar viewDidLayoutSubviews];
    self.iuView.frame = self.view.bounds;
}

#pragma mark - IUBaseScreenProtocol
#pragma mark - init
- (void)iuSetUp {
    self.fd_prefersNavigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)iuInitSubviews {
    self.iuView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.iuView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.iuView];
    [self.iuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.iuView.superview);
    }];

    self.appBar = [self getAppBar];
    [self.view insertSubview:self.appBar aboveSubview:self.iuView];
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

#pragma mark - 控件
- (UIView <IUAppBarProtocol>*)getAppBar{
    IUAppBar *appBar = [[IUAppBar alloc] initWithFrame:CGRectZero];
    appBar.backgroundColor = [UIColor whiteColor];
    appBar.titleLabel.font = [UIFont systemFontOfSize:17];
    appBar.titleLabel.textColor = [UIColor blackColor];
    appBar.divideLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    return appBar;
}

///返回键
- (UIButton *)getBackItem {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setImage:[self getBackItemImage] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(iuClickBackItem) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

///返回键图标
- (UIImage *)getBackItemImage {
    return [IUMobileFrameworkTool imageNamed:@"navigation_back"];
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.appBar.titleLabel.text = title;
}

#pragma mark - getter setter
- (UIButton *)backItem{
    if (!_backItem) {
        _backItem = [self getBackItem];
    }
    return _backItem;
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
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}

@end
