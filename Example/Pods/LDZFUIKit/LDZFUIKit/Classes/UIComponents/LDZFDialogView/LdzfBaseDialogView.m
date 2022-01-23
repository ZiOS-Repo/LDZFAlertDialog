//
//  LdzfBaseDialogView.m
//  Animations
//
//  Created by YouXianMing on 2017/11/29.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "LdzfBaseDialogView.h"
#import <LDZFCategories/LDZFCategories.h>
@interface LdzfBaseDialogView ()
@property (nonatomic, weak) UIView  *superiorView;
@property (nonatomic, strong) UIView   *contentView;
@property (nonatomic, strong) UIButton *backgroundButton;

@end

@implementation LdzfBaseDialogView

- (void)prepare {
    if (!self.superiorView) {
        self.superiorView = [NSObject ldzf_window];
    }
    // 创建背景的按钮
    self.frame                            = self.superiorView.bounds;
    self.backgroundButton                 = [[UIButton alloc] initWithFrame:self.superiorView.bounds];
    self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.f];
    [self.backgroundButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backgroundButton];
    
    // 创建contentView
    CGRect frame = CGRectMake(0, self.superiorView.height, self.superiorView.width, [[self class] contentViewHeight]);
    self.contentView    = [[UIView alloc] initWithFrame:frame];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    
    // 在contentView里面添加显示的view
    [self buildViewsInContentView:self.contentView];
    
    // 对picker进行配置
    [self configPicker];
}

- (void)buildViewsInContentView:(UIView *)contentView {
    
    // Overwrite by subclass.
}

- (void)configPicker {
    
    // Overwrite by subclass.
}

+ (instancetype)showPickerViewWithDelegate:(id <LdzfBaseDialogViewDelegate>)delegate
                                       tag:(NSInteger)tag
                                    object:(id)object
                                      info:(id)info
                              selectedItem:(id)selectedItem
                                 showDatas:(NSArray *)showDatas {
    
    LdzfBaseDialogView *pickerView = [[self class] new];
    pickerView.delegate            = delegate;
    pickerView.tag                 = tag;
    pickerView.object              = object;
    pickerView.info                = info;
    pickerView.selectedItem        = selectedItem;
    pickerView.showDatas           = showDatas;
    
    [pickerView prepare];
    [pickerView show];
    
    return pickerView;
}

- (void)show {
    
    [self.superiorView addSubview:self];
    
    // 代理 - 将要显示
    if (self.delegate && [self.delegate respondsToSelector:@selector(LdzfBaseDialogViewWillShow:)]) {
    
        [self.delegate LdzfBaseDialogViewWillShow:self];
    }
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
        self.contentView.frame  = CGRectMake(0,self.superiorView.height - [[self class] contentViewHeight], self.superiorView.width, [[self class] contentViewHeight]);
        
    } completion:^(BOOL finished) {
        
        // 代理 - 已经显示
        if (self.delegate && [self.delegate respondsToSelector:@selector(LdzfBaseDialogViewDidShow:)]) {
            
            [self.delegate LdzfBaseDialogViewDidShow:self];
        }
    }];
}

- (void)hide {
    
    // 代理 - 将要消失
    if (self.delegate && [self.delegate respondsToSelector:@selector(LdzfBaseDialogViewWillHide:)]) {
        
        [self.delegate LdzfBaseDialogViewWillHide:self];
    }
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.f];
        self.contentView.frame  = CGRectMake(0, self.superiorView.frame.size.height, self.superiorView.frame.size.width, [[self class] contentViewHeight]);
        
    } completion:^(BOOL finished) {
        
        // 代理 - 已经消失
        if (self.delegate && [self.delegate respondsToSelector:@selector(LdzfBaseDialogViewDidHide:)]) {
            
            [self.delegate LdzfBaseDialogViewDidHide:self];
        }
        
        self.superiorView = nil;
        [self removeFromSuperview];
    }];
}

- (void)buttonEvent:(UIButton *)button {
    
    [self hide];
}

+ (CGFloat)contentViewHeight {
    
    return 0;
}

- (void)dealloc {
    
    NSLog(@"%@ dealloc.", NSStringFromClass([self class]));
}

#pragma mark - Chain Programming.

+ (instancetype)build {
    
    return [[self class] new];
}

- (LdzfBaseDialogView *(^)(NSInteger tag))withTag {
    
    return ^ LdzfBaseDialogView * (NSInteger tag) {
        
        self.tag = tag;
        
        return self;
    };
}

- (LdzfBaseDialogView *(^)(id object))withObject {
    
    return ^ LdzfBaseDialogView * (id object) {
        
        self.object = object;
        
        return self;
    };
}

- (LdzfBaseDialogView *(^)(id <LdzfBaseDialogViewDelegate> delegate))withDelegate {
    
    return ^ LdzfBaseDialogView * (id <LdzfBaseDialogViewDelegate> delegate) {
        
        self.delegate = delegate;
        
        return self;
    };
}

- (LdzfBaseDialogView *(^)(id info))withInfo {
    
    return ^ LdzfBaseDialogView * (id info) {
        
        self.info = info;
        
        return self;
    };
}

- (LdzfBaseDialogView *(^)(id selectedItem))withSelectedItem {
    
    return ^ LdzfBaseDialogView * (id selectedItem) {
        
        self.selectedItem = selectedItem;
        
        return self;
    };
}

- (LdzfBaseDialogView *(^)(NSArray *showDatas))withShowDatas {
    
    return ^ LdzfBaseDialogView * (NSArray *showDatas) {
        
        self.showDatas = showDatas;
        
        return self;
    };
}

- (LdzfBaseDialogView *(^)(UIView *superiorView))prepareAndShowIn {
    
    return ^ LdzfBaseDialogView * (UIView *superiorView) {
        self.superiorView = superiorView;
        [self prepare];
        [self show];
        return self;
    };
}

@end
