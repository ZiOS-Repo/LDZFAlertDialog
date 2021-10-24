//
//  IUPickerViewComponent.m
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "IUPickerViewComponent.h"

@implementation IUPickerViewComponent


+ (instancetype)pickerViewComponentWithRows:(NSArray <IUPickerViewRow *> *)rows
                             componentWidth:(CGFloat)componentWidth {
    
    IUPickerViewComponent *component = [[[self class] alloc] init];
    component.rows                 = rows;
    component.componentWidth       = componentWidth;
    
    return component;
}

+ (instancetype)pickerViewComponentWithRowsBlock:(void (^)(NSMutableArray <IUPickerViewRow *> *rows))rowsBlock
                                  componentWidth:(CGFloat)componentWidth {
    
    NSMutableArray *rows = [NSMutableArray array];
    if (rowsBlock) {
        
        rowsBlock(rows);
    }
    
    IUPickerViewComponent *component = [[[self class] alloc] init];
    component.rows                 = [NSArray arrayWithArray:rows];
    component.componentWidth       = componentWidth;
    
    return component;
}

@end
