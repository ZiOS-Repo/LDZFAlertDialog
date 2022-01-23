//
//  LdzfTabViewScreen.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "LdzfTabViewScreen.h"
@interface LdzfTabViewScreen ()
@end

@implementation LdzfTabViewScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableViewWithStyle:UITableViewStylePlain];
    self.enableFooterRefresh = YES;
    self.enableHeaderRefresh = YES;
}


- (void)createTableViewWithStyle:(UITableViewStyle)style {
    [self createTableViewWithFrame:self.ldzfView.bounds style:style];
}

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self createTableView:UITableView.class withFrame:frame style:style];
}

- (void)createTableView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self.recylerView removeFromSuperview];
    self.recylerView = nil;
    self.recylerView = [self preferredRecylerView:UITableView.class withFrame:frame style:style];
    [self setEnableFooterRefresh:self.enableFooterRefresh];
    [self setEnableHeaderRefresh:self.enableHeaderRefresh];
    [self.ldzfView addSubview:self.recylerView];
    [self.recylerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.recylerView.superview);
    }];
}

#pragma mark - 刷新
- (void)setEnableHeaderRefresh:(BOOL)enableHeaderRefresh {
    _enableHeaderRefresh = enableHeaderRefresh;
    if (enableHeaderRefresh) {
        kWeakSelf
        // 下拉刷新
        self.recylerView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            kStrongSelf
            [strongSelf headerRefreshAction];
        }];
    } else {
        self.recylerView.mj_header = nil;
    }
}

- (void)setEnableFooterRefresh:(BOOL)enableFooterRefresh {
    _enableFooterRefresh = enableFooterRefresh;
    
    if (enableFooterRefresh) {
        // 上拉刷新
        kWeakSelf
        self.recylerView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            kStrongSelf
            [strongSelf footerRefreshAction];
        }];
    } else {
        self.recylerView.mj_footer = nil;
    }
}

- (void)setEnableRefresh:(BOOL)enableRefresh {
    _enableRefresh = enableRefresh;
    self.enableHeaderRefresh = enableRefresh;
    self.enableFooterRefresh = enableRefresh;
}

- (void)footerRefreshAction {
    
}

- (void)headerRefreshAction {
    
}

- (void)startRefresh {
    [self.recylerView.mj_header beginRefreshing];
}

- (void)stopRefresh {
    [self.recylerView.mj_header endRefreshing];
    [self.recylerView.mj_footer endRefreshing];
}

- (BOOL)isRefreshing {
    if ([self.recylerView.mj_header isRefreshing]) {
        return YES;
    }
    if ([self.recylerView.mj_footer isRefreshing]) {
        return YES;
    }
    return NO;
}




#pragma mark - getter
- (UITableView *)preferredRecylerView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    UITableView *recylerView = [[viewClass alloc] initWithFrame:frame style:style];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.separatorStyle = UITableViewCellSeparatorStyleNone;
    recylerView.showsVerticalScrollIndicator = NO;
    recylerView.showsHorizontalScrollIndicator = NO;
    recylerView.delegate = self;
    recylerView.dataSource = self;
    if (@available(iOS 11.0, *)) {
        recylerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        recylerView.estimatedRowHeight = 0;
        recylerView.estimatedSectionHeaderHeight = 0;
        recylerView.estimatedSectionFooterHeight = 0;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    [recylerView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    return recylerView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
@end
