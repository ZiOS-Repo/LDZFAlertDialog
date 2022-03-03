//
//  LdzfListCollectionView.m
//  LDZFMobileFramework
//
//  Created by zhuyuhui on 2022/2/11.
//

#import "LdzfListCollectionView.h"

@implementation LdzfListCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ldzfInitSubviews];
    }
    return self;
}

- (void)ldzfInitSubviews {
    [self createTableView];
    self.enableFooterRefresh = NO;
    self.enableHeaderRefresh = NO;
}

- (void)createTableView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [self createTableViewWithFrame:self.bounds collectionViewLayout:layout];
}

- (void)createTableViewWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    [self createTableView:UICollectionView.class withFrame:frame collectionViewLayout:layout];
}

- (void)createTableView:(Class)viewClass withFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    [self.recylerView removeFromSuperview];
    self.recylerView = nil;
    self.recylerView = [self preferredRecylerView:viewClass withFrame:frame collectionViewLayout:layout];
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
- (UICollectionView *)preferredRecylerView:(Class)viewClass withFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    UICollectionView *recylerView = [[viewClass alloc] initWithFrame:frame collectionViewLayout:layout];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.showsVerticalScrollIndicator = NO;
    recylerView.showsHorizontalScrollIndicator = NO;
    recylerView.delegate = self;
    recylerView.dataSource = self;
    if (@available(iOS 11.0, *)) {
        recylerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
    }
    [recylerView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    return recylerView;
}

- (Class)preferredRecylerViewClass {
    return [UICollectionView class];
}

- (UICollectionViewLayout *)preferredRecylerViewLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return layout;
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}


@end
