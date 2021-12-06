//
//  IUTabViewScreen.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "IUBaseScreen.h"
NS_ASSUME_NONNULL_BEGIN

@interface IUTabViewScreen : IUBaseScreen<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *recylerView;
#pragma mark - getter
- (UITableView *)preferredRecylerView;
- (Class)preferredRecylerViewClass;
- (UITableViewStyle)preferredRecylerViewStyle;
@end

NS_ASSUME_NONNULL_END
