//
//  LdzfAppBar.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "LdzfAppBar.h"
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
@interface LdzfAppBar ()

@end


@implementation LdzfAppBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.bgView.userInteractionEnabled = YES;;
        
        self.navigationBar = [[UIView alloc] initWithFrame:CGRectZero];
        self.navigationBar.backgroundColor = [UIColor clearColor];
        
        self.leftContainers = [[UIView alloc] initWithFrame:CGRectZero];
        self.leftContainers.backgroundColor = [UIColor clearColor];

        self.rightContainers = [[UIView alloc] initWithFrame:CGRectZero];
        self.rightContainers.backgroundColor = [UIColor clearColor];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.text = @"";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 2;
        self.divideLine = [[UIView alloc] init];

        [self addSubview:self.bgView];
        [self addSubview:self.navigationBar];
        [self addSubview:self.divideLine];
        
        [self.navigationBar addSubview:self.leftContainers];
        [self.navigationBar addSubview:self.rightContainers];
        [self.navigationBar addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(self.navigationBar);
            make.width.mas_lessThanOrEqualTo(200);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.bgView.frame = self.bounds;
    self.navigationBar.frame = CGRectMake(0, self.height - NavigationBarHeight, self.width, NavigationBarHeight);
    self.divideLine.frame = CGRectMake(0, self.height - PixelOne, self.width, PixelOne);
    self.leftContainers.frame = CGRectMake(0, 0, self.navigationBar.width/2, NavigationBarHeight);
    self.rightContainers.frame = CGRectMake(self.navigationBar.width/2, 0, self.navigationBar.width/2, NavigationBarHeight);
    ///左侧
    UIView *lastItem_L;
    for (UIView *item in self.leftContainers.subviews) {
        item.centerY = self.leftContainers.height/2;
        if (@available(iOS 11.0, *)) {
            item.left = lastItem_L ? CGRectGetMaxX(lastItem_L.frame) + 10 : self.safeAreaInsets.left;
        } else {
            item.left = lastItem_L ? CGRectGetMaxX(lastItem_L.frame) + 10 : 10;
        }
        lastItem_L = item;
    }
    ///右侧
    UIView *lastItem_R;
    for (UIView *item in self.rightContainers.subviews.reverseObjectEnumerator) {
        item.centerY = self.rightContainers.height/2;
        if (@available(iOS 11.0, *)) {
            item.right = lastItem_R ? CGRectGetMinX(lastItem_R.frame) - 10 : self.rightContainers.width - self.safeAreaInsets.right;
        } else {
            item.right = lastItem_R ? CGRectGetMinX(lastItem_R.frame) - 10 : self.rightContainers.width - 10;
        }
        lastItem_R = item;
    }
}

- (void)setLeftItems:(NSArray<UIView *> *)items {
    [self.leftContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (UIView *item in items) {
        [self.leftContainers addSubview:item];
    }
    [self setNeedsLayout];
}

- (void)setRightItems:(NSArray<UIView *> *)items {
    [self.rightContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (UIView *item in items) {
        [self.rightContainers addSubview:item];
    }
    [self setNeedsLayout];
}

@end
