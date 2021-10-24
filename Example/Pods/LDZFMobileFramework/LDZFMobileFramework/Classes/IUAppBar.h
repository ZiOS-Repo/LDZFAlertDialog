//
//  CRJAppBar.h
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import "LDZFGeneralTools/LDZFGeneralTools.h"
#import "IUAppBarProtocol.h"
@interface IUAppBar : UIView<IUAppBarProtocol>
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
