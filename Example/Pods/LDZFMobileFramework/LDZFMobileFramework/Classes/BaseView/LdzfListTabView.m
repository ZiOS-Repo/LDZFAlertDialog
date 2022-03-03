//
//  LdzfListTabView.m
//  LDZFMobileFramework
//
//  Created by zhuyuhui on 2022/2/11.
//

#import "LdzfListTabView.h"
#import "LdzfTableView.h"

@implementation LdzfListTabView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ldzfInitSubviews];
    }
    return self;
}

- (void)ldzfInitSubviews {
    [self createTableViewWithStyle:UITableViewStylePlain];
    self.enableFooterRefresh = NO;
    self.enableHeaderRefresh = NO;
}


- (void)createTableViewWithStyle:(UITableViewStyle)style {
    [self createTableViewWithFrame:self.bounds style:style];
}

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self createTableView:LdzfTableView.class withFrame:frame style:style];
}

- (void)createTableView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self.recylerView removeFromSuperview];
    self.recylerView = nil;
    self.recylerView = [self preferredRecylerView:viewClass withFrame:frame style:style];
    [self setEnableFooterRefresh:self.enableFooterRefresh];
    [self setEnableHeaderRefresh:self.enableHeaderRefresh];
    [self addSubview:self.recylerView];
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
        self.recylerView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
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
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
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
