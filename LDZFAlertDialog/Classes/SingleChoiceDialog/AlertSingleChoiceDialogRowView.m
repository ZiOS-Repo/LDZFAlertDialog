//
//  AlertSingleChoiceDialogRowView.m
//  Animations
//
//  Created by YouXianMing on 2017/11/29.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "AlertSingleChoiceDialogRowView.h"

@interface AlertSingleChoiceDialogRowView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation AlertSingleChoiceDialogRowView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = self.bounds;
}


- (void)buildSubView {
    self.label = [[UILabel alloc] init];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

- (void)loadContent {
    if ([self.data isKindOfClass:NSString.class]) {
        self.label.text = self.data;
    }
    else if ([self.data isKindOfClass:NSAttributedString.class]) {
        self.label.attributedText = self.data;
    }
    [self.label sizeToFit];
}

@end
