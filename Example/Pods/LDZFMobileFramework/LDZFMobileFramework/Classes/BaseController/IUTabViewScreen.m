//
//  IUTabViewScreen.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "IUTabViewScreen.h"
@interface IUTabViewScreen ()
@end

@implementation IUTabViewScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)iuInitSubviews {
    [super iuInitSubviews];
    if (!_recylerView) {
        UITableView *recylerView = [self preferredRecylerView];
        [recylerView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [self.iuView addSubview:recylerView];
        [recylerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(recylerView.superview);
        }];
        self.recylerView = recylerView;
    }
}


#pragma mark - getter
- (UITableView *)preferredRecylerView {
    UITableView *recylerView = [[[self preferredRecylerViewClass] alloc] initWithFrame:self.view.bounds style:[self preferredRecylerViewStyle]];
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
    return recylerView;
}

- (Class)preferredRecylerViewClass {
    return [UITableView class];
}

- (UITableViewStyle)preferredRecylerViewStyle {
    return UITableViewStylePlain;
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
