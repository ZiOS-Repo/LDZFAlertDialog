

#import "AlertSingleChoiceDialog.h"
#import "AlertSingleChoiceDialogRowView.h"

@interface AlertSingleChoiceDialog ()<LdzfPickerViewDelegate>
{
    LdzfCustomPickerView *_pickerView;
}
@property(nonatomic, assign) BOOL isAnimating;
@end

@implementation AlertSingleChoiceDialog
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
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
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(cancelBtn.superview.mas_safeAreaLayoutGuideLeft).offset(12);
        } else {
            make.left.equalTo(cancelBtn.superview).offset(12);
        }
        make.centerY.equalTo(cancelBtn.superview);
    }];
    [cancelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [topBarView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.right.equalTo(cancelBtn.superview.mas_safeAreaLayoutGuideRight).offset(-12);
        } else {
            make.right.equalTo(cancelBtn.superview).offset(-12);
        }
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
    _pickerView = [[LdzfCustomPickerView alloc] initWithFrame:CGRectMake(0, 44.f, self.view.width, 0) delegate:self];
    [self.containerView addSubview:_pickerView];
    [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.containerView);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    [self setupInitialData];
}

- (void)setupInitialData {
    // 获取rows
    NSMutableArray <LdzfPickerViewRowModel *> *rows = [NSMutableArray array];
    [self.showDatas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [rows addObject:[LdzfPickerViewRowModel pickerViewRowWithViewClass:[AlertSingleChoiceDialogRowView class] data:obj]];
    }];
    
    LdzfPickerViewComponent   *component  = [LdzfPickerViewComponent pickerViewComponentWithRows:rows componentWidth:self.view.width];
    LdzfPickerViewDataAdapter *adpater    = [LdzfPickerViewDataAdapter pickerViewDataAdapterWithComponents:@[component] rowHeight:40.f];
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




#pragma mark -
#pragma mark - clickEvent

- (void)clickCancel {
    [self dissMiss];
}

- (void)clickConfirm {
    self.dismissFlag = YES;
    kWeakSelf
    [self hideContainerViewWithCompletion:^(BOOL finished) {
        kStrongSelf
        strongSelf.dismissFlag = NO;
        // 动画Animated必须是NO，不然消失之后，会有0.35s时间，再点击无效
        [strongSelf dismissViewControllerAnimated:NO completion:nil];
        if (strongSelf.didSelectedItems) {
            NSInteger selectedIndex = [strongSelf->_pickerView.pickView selectedRowInComponent:0];
            if (selectedIndex < strongSelf.showDatas.count) {
                strongSelf.didSelectedItems(strongSelf, @[strongSelf.showDatas[selectedIndex]]);
            }
        }
    }];
}

#pragma mark - LdzfPickerViewDelegate
- (void)customPickerView:(LdzfCustomPickerView *)pickerView didSelectedRows:(NSArray<NSNumber *> *)rows selectedDatas:(NSArray<id> *)datas {
    
}




#pragma mark - 懒加载

@end
