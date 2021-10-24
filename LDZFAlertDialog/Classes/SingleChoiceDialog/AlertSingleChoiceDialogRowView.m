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

- (void)buildSubView {
    
    self.label = [UILabel new];
    [self addSubview:self.label];
}

- (void)loadContent {
    
    self.label.text = self.data;
    [self.label sizeToFit];
    
    self.label.center = self.middlePoint;
}

@end
