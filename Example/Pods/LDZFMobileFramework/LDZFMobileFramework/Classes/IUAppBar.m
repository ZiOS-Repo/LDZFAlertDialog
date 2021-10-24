//
//  IUAppBar.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "IUAppBar.h"
#import <LDZFCategories/LDZFCategories.h>
@interface IUAppBar ()
@property(nonatomic, assign) CGFloat navigationBarHeight;
@end


@implementation IUAppBar

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
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = @"";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.divideLine = [[UIView alloc] init];

        [self addSubview:self.bgView];
        [self addSubview:self.navigationBar];
        [self addSubview:self.divideLine];
        
        [self.navigationBar addSubview:self.leftContainers];
        [self.navigationBar addSubview:self.rightContainers];
        [self.navigationBar addSubview:self.titleLabel];
    
        [self layout];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat appBarHeight = [self getAppBarHeight];
    CGFloat navigationBarHeight = [self getNavigationBarHeight];
    
    self.frame = CGRectMake(0, 0, self.superview.width, appBarHeight);
    self.bgView.frame = self.bounds;
    self.navigationBar.frame = CGRectMake(0, self.height - navigationBarHeight, self.width, navigationBarHeight);
    self.divideLine.frame = CGRectMake(0, self.height - 1, self.width, 1);
    self.leftContainers.frame = CGRectMake(0, 0, self.navigationBar.width/2, self.navigationBar.height);
    self.rightContainers.frame = CGRectMake(self.navigationBar.width/2, 0, self.navigationBar.width/2, self.navigationBar.height);
    ///左侧
    UIView *lastItem_L;
    for (UIView *item in self.leftContainers.subviews) {
        item.centerY = self.leftContainers.height/2;
        if (@available(iOS 11.0, *)) {
            item.left = lastItem_L ? CGRectGetMaxX(lastItem_L.frame) : self.safeAreaInsets.left;
        } else {
            item.left = lastItem_L ? CGRectGetMaxX(lastItem_L.frame) : 0;
        }
        lastItem_L = item;
    }
    
    ///右侧
    UIView *lastItem_R;
    for (UIView *item in self.rightContainers.subviews.reverseObjectEnumerator) {
        item.centerY = self.rightContainers.height/2;
        if (@available(iOS 11.0, *)) {
            item.right = lastItem_R ? CGRectGetMinX(lastItem_R.frame) : self.rightContainers.width - self.safeAreaInsets.right;
        } else {
            item.right = lastItem_R ? CGRectGetMinX(lastItem_R.frame) : self.rightContainers.width;
        }
        lastItem_R = item;
    }
}

- (void)viewDidLayoutSubviews {
    [self layoutSubviews];
}

- (void)layout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.centerY.equalTo(self.titleLabel.superview);
        make.width.lessThanOrEqualTo(@200);
    }];
}

- (void)setLeftItems:(NSArray<UIView *> *)items {
    [self.leftContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (UIView *item in items) {
        [self.leftContainers addSubview:item];
    }
}

- (void)setRightItems:(NSArray<UIView *> *)items {
    [self.rightContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (UIView *item in items) {
        [self.rightContainers addSubview:item];
    }
}

#pragma mark - 常用值设置
- (CGFloat)getAppBarHeight {
    BOOL IsPortrait = IUDeviceInfo.isPortrait;//是否是竖屏
    CGFloat safeAreaTop = 0;
    if (IsPortrait) {
        if (IUDeviceInfo.isFringeScreen) {
            safeAreaTop = IUDeviceInfo.fringeScreenTopSafeHeight;
        } else {
            safeAreaTop = 20;
        }
    } else {
        safeAreaTop = 0;
    }
    
    if ([self isPresent]){
        safeAreaTop = 0;
    }
    
    
    CGFloat appBarH = safeAreaTop + [self getNavigationBarHeight];
    return appBarH;

}

- (CGFloat)getNavigationBarHeight {
    return 44;
}

- (BOOL)isPresent {
    BOOL isPresent;
    if ([self.viewController isPushedFromNavigationController]){
        isPresent = NO; //push方式
    } else {
        isPresent = YES;  // modal方式
    }
    return isPresent;
}



@end
