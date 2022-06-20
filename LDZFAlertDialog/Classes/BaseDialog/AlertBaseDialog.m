
#import "AlertBaseDialog.h"
@interface AlertBaseDialog ()
@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UIView *containerView;
@end

@implementation AlertBaseDialog

// 这里主动释放一些空间，加速内存的释放，防止有时候消失之后，再点不出来。
- (void)dealloc {
    NSLog(@"%@ --> dealloc",[self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    [self.backgroundView removeFromSuperview];
    [self.containerView removeFromSuperview];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 必须写这句话，不然看不到上一个控制器的View
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

#pragma mark - 布局UI
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.containerView];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.backgroundView.superview);
    }];
    
    CGFloat containerViewHeight = [self containerViewHeight];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(0);
        make.width.equalTo(self.view.mas_width);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(containerViewHeight);
    }];
    //注册通知
    [self registerNotification];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.dialogWillShow) {
        self.dialogWillShow(self);
    }
    self.showFlag = YES;
    kWeakSelf
    [self showContainerViewWithCompletion:^(BOOL finished) {
        kStrongSelf
        strongSelf.showFlag = NO;
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.dialogDidShow) {
        self.dialogDidShow(self);
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.dialogWillHide) {
        self.dialogWillHide(self);
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.dialogDidHide) {
        self.dialogDidHide(self);
    }
}


#pragma mark - 展示 & 隐藏
- (void)showContainerViewWithCompletion:(void (^)(BOOL))completion {
    [self.view layoutIfNeeded];//获取containerView高度
    self.backgroundView.alpha = 1.0f ;
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(self.containerView.height);
    }];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.alpha = 1.0f ;
        [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(0);
        }];
        [self.view layoutIfNeeded];
    } completion:completion];
}

- (void)hideContainerViewWithCompletion:(void (^)(BOOL))completion{
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.alpha = 0.0f ;
        [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(self.containerView.height);
        }];
        [self.view layoutIfNeeded];
    } completion:completion];
}


- (void)dissMiss {
    self.dismissFlag = YES;
    kWeakSelf
    [self hideContainerViewWithCompletion:^(BOOL finished) {
        kStrongSelf
        strongSelf.dismissFlag = NO;
        // 动画Animated必须是NO，不然消失之后，会有0.35s时间，再点击无效
        [strongSelf dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (CGFloat)containerViewHeight {
    return IS_DEVICE_LANDSCAPE ? 250:300;
}

#pragma mark - 懒加载
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:0.5f];
        _backgroundView.alpha = 0.0f;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissMiss)];
        [_backgroundView addGestureRecognizer:tap];
    }
    return _backgroundView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}




#pragma mark - 注册通知
- (void)registerNotification {
    //注册屏幕旋转通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeStatusBarFrameNotification:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}
/*
 屏幕旋转后，方法调用顺序:
 didChangeRotate会调用两次！！！
 1. didChangeRotate
 2. viewWillTransitionToSize
 3. didChangeRotate
 */

- (void)didChangeStatusBarFrameNotification:(NSNotification*)notice {
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait ||
        [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {
        //竖屏
        NSLog(@"竖屏");
        [self didChangeRotateWithIsPortrait:YES];
    } else {
        //横屏
        NSLog(@"横屏");
        [self didChangeRotateWithIsPortrait:NO];
    }
}

// 横竖屏将要切换会调用
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"横竖屏进行了切换size:%@",NSStringFromCGSize(size));
    if (size.width < size.height) {
        [self didChangeRotateWithIsPortrait:YES];
    } else {
        [self didChangeRotateWithIsPortrait:NO];
    }
}



#pragma mark - 转屏
//1.决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
      return YES;
}

//2.返回支持的旋转方向
//iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
//iPad设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
     return UIInterfaceOrientationMaskAll;
}

//3.返回进入界面默认显示方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
     return UIInterfaceOrientationPortrait;
}
@end


#pragma mark - 屏幕旋转发生回调
@implementation AlertBaseDialog(ScreenRotate)
/// 屏幕旋转事件
/// @param isPortrait YES 竖屏，NO 横屏
- (void)didChangeRotateWithIsPortrait:(BOOL)isPortrait {
    
}
@end

#pragma mark - 工具
@implementation AlertBaseDialog(Utils)
- (UIImage *)imageFromCustomBundle:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *bundleName = bundle.infoDictionary[@"CFBundleExecutable"];
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
        stringByAppendingPathComponent:[NSString  stringWithFormat:@"/%@.bundle",bundleName]];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}

@end



#pragma mark - Chain Programming.
@implementation AlertBaseDialog(ChainProgramming)

+ (instancetype)build {
    return [[[self class] alloc] init];
}

- (AlertBaseDialog *(^)(NSInteger tag))withTag {
    return ^ AlertBaseDialog * (NSInteger tag) {
        self.tag = tag;
        return self;
    };
}


- (AlertBaseDialog *(^)(id object))withObject {
    return ^ AlertBaseDialog * (id object) {
        self.object = object;
        return self;
    };
}

- (AlertBaseDialog *(^)(id info))withInfo {
    return ^ AlertBaseDialog * (id info) {
        self.info = info;
        return self;
    };
}

- (AlertBaseDialog *(^)(id selectedItem))withSelectedItem {
    return ^ AlertBaseDialog * (id selectedItem) {
        self.selectedItem = selectedItem;
        return self;
    };
}

- (AlertBaseDialog *(^)(NSArray *showDatas))withShowDatas {
    return ^ AlertBaseDialog * (NSArray *showDatas) {
        self.showDatas = showDatas;
        return self;
    };
}

@end
