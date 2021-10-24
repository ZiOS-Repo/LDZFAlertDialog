
#import "AlertBaseDialog.h"
@interface AlertBaseDialog ()

@end

@implementation AlertBaseDialog

// 这里主动释放一些空间，加速内存的释放，防止有时候消失之后，再点不出来。
- (void)dealloc
{
    NSLog(@"%@ --> dealloc",[self class]);
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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@ viewWillAppear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogWillShow:)]) {
        [self.delegate baseDialogWillShow:self];
    }
    [self showContainerView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ viewDidAppear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogDidShow:)]) {
        [self.delegate baseDialogDidShow:self];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ viewWillDisappear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogWillHide:)]) {
        [self.delegate baseDialogWillHide:self];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@ viewDidDisappear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogDidHide:)]) {
        [self.delegate baseDialogDidHide:self];
    }
}

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
#pragma mark - Chain Programming.
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

- (AlertBaseDialog *(^)(id <AlertBaseDialogDelegate> delegate))withDelegate {
    return ^ AlertBaseDialog * (id <AlertBaseDialogDelegate> delegate) {
        self.delegate = delegate;
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

- (AlertBaseDialog *(^)(void))prepareFinish {
    return ^ AlertBaseDialog * (void) {
        return self;
    };
}

#pragma mark - 懒加载
- (void)showContainerView {
    
}
- (void)hideContainerView {
    
}



#pragma mark - getter setter
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:0.5f];
        _backgroundView.alpha = 0.0f;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideContainerView)];
        [_backgroundView addGestureRecognizer:tap];
    }
    return _backgroundView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
//        _containerView.layer.borderColor = [UIColor redColor].CGColor;
//        _containerView.layer.borderWidth = 1.0 ;
    }
    return _containerView;
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
