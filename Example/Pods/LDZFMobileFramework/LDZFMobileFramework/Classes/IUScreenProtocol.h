//
//  IUScreenProtocol.h
//
//  Created by yuhui on 2021/1/8.
//

#import <Foundation/Foundation.h>
#import "IUAppBarProtocol.h"
NS_ASSUME_NONNULL_BEGIN

/// IUBaseScreen
@protocol IUBaseScreenProtocol <NSObject>
#pragma mark - init
- (void)iuSetUp;
- (void)iuInitSubviews;
- (void)iuSetUpNavigationItems;
- (void)iuSetUpToolbarItems;
#pragma mark - 点击事件
- (void)iuClickBackItem;
#pragma mark - 控件
///导航条
- (UIView <IUAppBarProtocol>*)getAppBar;
///返回键
- (UIButton *)getBackItem;
///返回键图标
- (UIImage *)getBackItemImage;
@end

/// TableViewScreen
@protocol IUTableViewScreenProtocol <NSObject,UITableViewDelegate, UITableViewDataSource>
- (UITableView *)preferredRecylerView;
- (UITableViewStyle)preferredRecylerViewStyle;
@property(nonatomic, assign) int page;
@property(nonatomic, assign) int pageSize;
@property(nonatomic, strong) NSMutableArray *dataSource;
- (void)showDZNEmptyView;
- (void)hideDZNEmptyView;
@end

/// CollectionViewScreen
@protocol IUCollectionViewScreenProtocol <NSObject,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
- (UICollectionView *)preferredRecylerView;
- (UICollectionViewLayout *)preferredRecylerViewLayout;
@property(nonatomic, assign) int page;
@property(nonatomic, assign) int pageSize;
@property(nonatomic, strong) NSMutableArray *dataSource;
- (void)showDZNEmptyView;
- (void)hideDZNEmptyView;
@end







NS_ASSUME_NONNULL_END
