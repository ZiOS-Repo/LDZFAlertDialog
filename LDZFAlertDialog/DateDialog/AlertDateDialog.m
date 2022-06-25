
#import "AlertDateDialog.h"

@interface AlertDateDialog ()

@end

@implementation AlertDateDialog
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
    titleLabel.text = @"选择日期";
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
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
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
    UIDatePicker *datePicker  = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerEvent:) forControlEvents:UIControlEventValueChanged];
    [self.containerView addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(datePicker.superview);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    self.picker = datePicker;
    
    [self setupInitialData];
}

- (void)setupInitialData {
    UIDatePicker *picker = self.picker;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文
    picker.locale = locale;
    if (@available(iOS 13.4, *)) {
        picker.preferredDatePickerStyle = UIDatePickerStyleWheels;
        
    } else {
        // Fallback on earlier versions
    }
        
    if (self.selectedItem && [self.selectedItem isKindOfClass:[NSDate class]]) {
        picker.date = self.selectedItem;
    }
}


#pragma mark -
#pragma mark - datePickerEvent
- (void)datePickerEvent:(UIDatePicker *)picker {

}


#pragma mark -
#pragma mark - clickEvent

- (void)clickCancel {
    [self dissMiss];
}

- (void)clickConfirm {
    UIDatePicker *picker = self.picker;
    NSMutableArray *items = [NSMutableArray array];
    if (picker.date) [items addObject:picker.date];
    self.dismissFlag = YES;
    kWeakSelf
    [self hideContainerViewWithCompletion:^(BOOL finished) {
        kStrongSelf
        strongSelf.dismissFlag = NO;
        // 动画Animated必须是NO，不然消失之后，会有0.35s时间，再点击无效
        [strongSelf dismissViewControllerAnimated:NO completion:nil];
        if (strongSelf.didSelectedItems) {
            strongSelf.didSelectedItems(strongSelf, items);
        }
    }];
}


@end
