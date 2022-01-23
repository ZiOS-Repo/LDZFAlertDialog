//
//  LdzfCardView.m
//  LDZFUIKit
//
//  Created by zhuyuhui on 2021/11/1.
//

#import "LdzfCardView.h"

@interface LdzfCardView ()

@property (nonatomic, strong) CAShapeLayer *bgLayer;

@end

@implementation LdzfCardView
- (void)layoutSubviews {
    [super layoutSubviews];
    [self updatePath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self buildBgLayer];
    }
    
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
        [self buildBgLayer];
    }
    
    return self;
}

- (void)buildBgLayer {
    
    self.rectCorner  = UIRectCornerAllCorners;
    self.cornerRadii = CGSizeZero;
    
    self.bgLayer = [[CAShapeLayer alloc] init];
    [self updatePath];
    
    self.layer.mask = self.bgLayer;
}

- (void)updatePath {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCorner cornerRadii:self.cornerRadii];
    self.bgLayer.frame = self.bounds;
    self.bgLayer.path  = maskPath.CGPath;
}


#pragma mark - Setter & Getter.

- (void)setRectCorner:(UIRectCorner)rectCorner {
    _rectCorner = rectCorner;
    [self updatePath];
}

- (void)setCornerRadii:(CGSize)cornerRadii {
    _cornerRadii = cornerRadii;
    [self updatePath];
}

@end
