//
//  LdzfAppBar.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "LdzfAppBar.h"
#import "LDZFMobileFrameworkThirdHeader.h"
@interface LdzfAppBar ()

@end

@implementation LdzfAppBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.background];
        [self addSubview:self.navigationBar];
        [self addSubview:self.divideLine];
                
        [self.navigationBar addSubview:self.leftContainers];
        [self.navigationBar addSubview:self.rightContainers];
        [self.navigationBar addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(self.navigationBar);
            make.width.mas_lessThanOrEqualTo(200);
        }];
        [self.divideLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(PixelOne);
        }];
        [self.leftContainers mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.navigationBar);
            make.width.mas_equalTo(SCREEN_WIDTH/2);
        }];
        [self.rightContainers mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.navigationBar);
            make.width.mas_equalTo(SCREEN_WIDTH/2);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setLeftItems:(NSArray<UIView *> *)items {
    [self.leftContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    ///左侧
    UIView *lastItem_L;
    for (UIView *item in items) {
        [self.leftContainers addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftContainers.mas_centerY);
            make.size.mas_equalTo(item.viewSize);
            if (lastItem_L) {
                make.left.equalTo(lastItem_L.mas_right).offset(5);
            } else {
                make.left.equalTo(self.leftContainers).offset(5);
            }
        }];
        lastItem_L = item;
    }
}

- (void)setRightItems:(NSArray<UIView *> *)items {
    [self.rightContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *lastItem_L;
    for (UIView *item in items) {
        [self.rightContainers addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.rightContainers.mas_centerY);
            make.size.mas_equalTo(item.viewSize);
            if (lastItem_L) {
                make.right.equalTo(lastItem_L.mas_left).offset(-5);
            } else {
                make.right.equalTo(self.rightContainers).offset(-5);
            }
        }];
        lastItem_L = item;
    }
}
#pragma mark - getter setter
- (UIImageView *)background {
    if (!_background) {
        _background = [[UIImageView alloc] initWithFrame:self.bounds];
        _background.userInteractionEnabled = YES;;
    }
    return _background;
}

- (UIView *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - NavigationBarHeight, SCREEN_WIDTH, NavigationBarHeight)];
        _navigationBar.backgroundColor = [UIColor clearColor];
    }
    return _navigationBar;
}

- (UIView *)leftContainers {
    if (!_leftContainers) {
        _leftContainers = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, NavigationBarHeight)];
        _leftContainers.backgroundColor = [UIColor clearColor];
    }
    return _leftContainers;
}

- (UIView *)rightContainers {
    if (!_rightContainers) {
        _rightContainers = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, NavigationBarHeight)];
        _rightContainers.backgroundColor = [UIColor clearColor];
    }
    return _rightContainers;
}

- (UIView *)divideLine {
    if (!_divideLine) {
        _divideLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - PixelOne, SCREEN_WIDTH, PixelOne)];
    }
    return _divideLine;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 2;
        _titleLabel.text = @"";
    }
    return _titleLabel;
}
@end
