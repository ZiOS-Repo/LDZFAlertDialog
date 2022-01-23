

#import "AlertMultiChoiceDialog.h"

@interface AlertMultiChoiceDialog ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, assign) BOOL isAnimating;
@end

@implementation AlertMultiChoiceDialog
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
        self.containerView.frame = CGRectMake(0,self.view.height - [self containerViewHeight], self.view.width, [self containerViewHeight]);
    }
}

#pragma mark -
#pragma mark - clickEvent

- (void)clickCancel {
    [self hideContainerView];
}

- (void)clickConfirm {
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialog:didSelectedItems:)]) {
        [self.delegate baseDialog:self didSelectedItems:self.checkedItems];
    }
    [self hideContainerView];
}

- (void)showContainerView {
    self.isAnimating = YES;
    self.containerView.frame = CGRectMake(0,self.view.height, self.view.width, [self containerViewHeight]);
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.alpha = 1.0f ;
        self.containerView.y = self.view.height - [self containerViewHeight];
        
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
    line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [topBarView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(line.superview).offset(0);
        make.height.mas_equalTo(0.5);
    }];
#pragma mark - 其他
    self.dataSource = [NSMutableArray array];
    self.checkedItems = [NSMutableArray array];
    self.disableItems = [NSMutableArray array];
    
    [self.containerView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.tableView.superview);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    
    if (!self.cellClass) {
        self.cellClass = AlertMultiChoiceDialogCell.class;
    }
    [self.tableView registerClass:self.cellClass forCellReuseIdentifier:identifier];
    
    [self setupInitialData];
}

- (void)setupInitialData {
    [self.dataSource removeAllObjects];

    [self.showDatas enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      [self.dataSource addObject:obj];
    }];

    if (self.selectedItem) {
        if ([self.selectedItem isKindOfClass:[NSString class]]) {
            NSString *selString = self.selectedItem;
            NSArray *selData = @[];
            if ([selString containsString:@","]) {
                selData = [selString componentsSeparatedByString:@","];
            }
            else if ([selString containsString:@"，"]) {
                selData = [selString componentsSeparatedByString:@"，"];
            }
            else {
                selData = @[self.selectedItem];
            }
            
            for (NSString *item in selData) {
                if ([self.dataSource containsObject:item]) {
                    [self.checkedItems addObject:item];
                }
            }
        }
        else if ([self.selectedItem isKindOfClass:[NSArray class]]) {
            for (id item in self.selectedItem) {
                if ([self.dataSource containsObject:item]) {
                    [self.checkedItems addObject:item];
                }
            }
        }
    }
    [self.tableView reloadData];
}


#pragma mark -
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if ([cell isKindOfClass:AlertMultiChoiceDialogCell.class]) {
        id data = [self.dataSource objectAtIndex:indexPath.row];
        ((AlertMultiChoiceDialogCell *)cell).data = data;
        ((AlertMultiChoiceDialogCell *)cell).dialog = self;
        [((AlertMultiChoiceDialogCell *)cell) loadContent];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialog:didSelectRowAtIndexPath:)]) {
        [self.delegate baseDialog:self didSelectRowAtIndexPath:indexPath];
    } else {
        id data = [self.dataSource objectAtIndex:indexPath.row];
        if ([self.checkedItems containsObject:data]) {
            [self.checkedItems removeObject:data];
        } else {
            [self.checkedItems addObject:data];
        }
        [self.tableView reloadData];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.tableView.rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - Useful Method
- (void)enableItem:(id)item enable:(BOOL)enable {
    if (!item) {
        return;
    }
    [self.disableItems removeObject:item];
    if (!enable) {
        [self.disableItems addObject:item];
    }
    [self.tableView reloadData];
}
- (void)checkedItem:(id)item check:(BOOL)check{
    if (!item) {
        return;
    }
    [self.checkedItems removeObject:item];
    if (check) {
        [self.checkedItems addObject:item];
    }
    [self.tableView reloadData];
}

- (AlertMultiChoiceDialog *(^)(Class cellClass))withCellClass {
    return ^ AlertMultiChoiceDialog * (Class cellClass) {
        self.cellClass = cellClass;
        return self;
    };
}







#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 48;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        _tableView.tableFooterView = footer;
    }
    return _tableView;
}

@end
