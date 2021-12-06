//
//  IUCollectionViewScreen.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "IUBaseScreen.h"
NS_ASSUME_NONNULL_BEGIN

@interface IUCollectionViewScreen : IUBaseScreen<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView *recylerView;
#pragma mark - getter
- (UICollectionView *)preferredRecylerView;
- (Class)preferredRecylerViewClass;
- (UICollectionViewLayout *)preferredRecylerViewLayout;
@end

NS_ASSUME_NONNULL_END
