//
//  IUCollectionViewScreen.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "IUCollectionViewScreen.h"
@interface IUCollectionViewScreen ()

@end

@implementation IUCollectionViewScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)iuInitSubviews {
    [super iuInitSubviews];
    if (!_recylerView) {
        UICollectionView *recylerView = [self preferredRecylerView];
        [recylerView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self.iuView addSubview:recylerView];
        [recylerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(recylerView.superview);
        }];
        self.recylerView = recylerView;
    }
}

#pragma mark - getter
- (UICollectionView *)preferredRecylerView {
    UICollectionView *recylerView = [[[self preferredRecylerViewClass] alloc] initWithFrame:self.view.bounds collectionViewLayout:[self preferredRecylerViewLayout]];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.showsVerticalScrollIndicator = NO;
    recylerView.showsHorizontalScrollIndicator = NO;
    recylerView.delegate = self;
    recylerView.dataSource = self;
    if (@available(iOS 11.0, *)) {
        recylerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    return cell;
}

@end
