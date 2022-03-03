//
//  CRJAppBar.h
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
@interface LdzfAppBar : UIView
/// 背景图
@property(nonatomic, strong) UIImageView *background;
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

@end
