//
//  IUAppBarProtocol.h
//  LDZFMobileFramework
//
//  Created by zhuyuhui on 2021/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IUAppBarProtocol <NSObject>
/// 背景图
@property(nonatomic, strong) UIImageView *bgView;
/// 导航条
@property(nonatomic, strong) UIView *navigationBar;
/// 左侧
@property(nonatomic, strong) UIView *leftContainers;
/// 右侧
@property(nonatomic, strong) UIView *rightContainers;
/// 标题
@property(nonatomic, strong) UILabel *titleLabel;
/// 底部分割线
@property(nonatomic, strong) UIView *divideLine;

- (void)setLeftItems:(NSArray <UIView *>*)items;
- (void)setRightItems:(NSArray <UIView *>*)items;

- (void)viewDidLayoutSubviews;
@end

NS_ASSUME_NONNULL_END
