

#import "AlertSingleChoiceDialog.h"
#import <LDZFCustomPickerView/LDZFCustomPickerView.h>

#import "AlertSingleChoiceDialogRowView.h"

@interface AlertSingleChoiceDialog ()<IUCustomPickerViewDelegate>
{
    IUCustomPickerView *_pickerView;
}
@property(nonatomic, assign) BOOL isAnimating;
@end

@implementation AlertSingleChoiceDialog
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

// 1
// 屏幕旋转时调用
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.isAnimating) {
        
    } else {
        if (IUDeviceInfo.isPortrait) {
            //竖屏
            self.containerView.frame = CGRectMake(0,self.view.height - 300, self.view.width, 300.0);

        } else {
            //横屏
            self.containerView.frame = CGRectMake(0,self.view.height - 250, self.view.width, 250.0);
        }
    }
}


#pragma mark -
#pragma mark - clickEvent

- (void)clickCancel {
    [self hideContainerView];
}

- (void)clickConfirm {
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialog:didSelectedItems:)]) {
        NSInteger selectedIndex = [_pickerView.pickView selectedRowInComponent:0];
        [self.delegate baseDialog:self didSelectedItems:@[self.showDatas[selectedIndex]]];
    }
    [self hideContainerView];
}

- (void)showContainerView {
    self.isAnimating = YES;
    self.containerView.frame = CGRectMake(0,self.view.height, self.view.width, (IUDeviceInfo.isPortrait ? 300.0:250.0));
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.alpha = 1.0f ;
        self.containerView.y = self.view.height - (IUDeviceInfo.isPortrait ? 300.0:250.0);
        
    } completion:^(BOOL finished) {
        self.isAnimating = NO;
    }];
}

- (void)hideContainerView {
    self.isAnimating = YES;
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.backgroundView.alpha = 0.0f ;
        
        self.containerView.y = self.view.height;
        
    } completion:^(BOOL finished) {
        // 动画Animated必须是NO，不然消失之后，会有0.35s时间，再点击无效
        [self dismissViewControllerAnimated:NO completion:nil];
        self.isAnimating = NO;
    }];
}

#pragma mark -
#pragma mark - UI

- (void)setupUI {
#pragma mark - 顶部
    UIView *topBarView = [[UIView alloc] init];
    [self.containerView addSubview:topBarView];
    [topBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(topBarView.superview);
        make.height.mas_equalTo(44);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"请选择";
    titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [topBarView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(titleLabel.superview);
    }];
    if (self.info && [self.info isKindOfClass:[NSString class]]) {
        titleLabel.text = self.info;
    }
    
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [topBarView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cancelBtn.superview).offset(12);
        make.centerY.equalTo(cancelBtn.superview);
    }];
    [cancelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [topBarView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(confirmBtn.superview).offset(-12);
        make.centerY.equalTo(confirmBtn.superview);
    }];
    [confirmBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    // 顶部线条
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [topBarView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(line.superview).offset(0);
        make.height.mas_equalTo(0.5);
    }];
#pragma mark - 其他
    // 创建pickerView
    _pickerView = [[IUCustomPickerView alloc] initWithFrame:CGRectMake(0, 44.f, self.view.width, 0) delegate:self];
    [self.containerView addSubview:_pickerView];
    [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.containerView);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    [self setupInitialData];
}

- (void)setupInitialData {
    // 获取rows
    NSMutableArray <IUPickerViewRow *> *rows = [NSMutableArray array];
    [self.showDatas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [rows addObject:[IUPickerViewRow pickerViewRowWithViewClass:[AlertSingleChoiceDialogRowView class] data:obj]];
    }];
    
    IUPickerViewComponent   *component  = [IUPickerViewComponent pickerViewComponentWithRows:rows componentWidth:self.view.width];
    IUPickerViewDataAdapter *adpater    = [IUPickerViewDataAdapter pickerViewDataAdapterWithComponents:@[component] rowHeight:40.f];
    _pickerView.pickerViewDataAdapter = adpater;
    
    // 如果有初始选定元素,则直接定位到初始选定元素的地方
    if (self.selectedItem && [self.selectedItem isKindOfClass:[NSAttributedString class]]) {
        
        __block NSInteger index = 0;
        [self.showDatas enumerateObjectsUsingBlock:^(NSAttributedString *string, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([string isEqualToAttributedString:self.selectedItem]) {
                
                index = idx;
                *stop = YES;
            }
        }];
        
        [_pickerView selectRow:index inComponent:0 animated:NO];
    }
}

#pragma mark - IUCustomPickerViewDelegate
- (void)customPickerView:(IUCustomPickerView *)pickerView didSelectedRows:(NSArray<NSNumber *> *)rows selectedDatas:(NSArray<id> *)datas
{

}



#pragma mark - 懒加载

@end
