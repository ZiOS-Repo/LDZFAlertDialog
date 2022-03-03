//
//  LdzfPickerViewComponent.m
//  LdzfCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "LdzfPickerViewComponent.h"

@implementation LdzfPickerViewComponent


+ (instancetype)pickerViewComponentWithRows:(NSArray <LdzfPickerViewRowModel *> *)rows
                             componentWidth:(CGFloat)componentWidth {
    
    LdzfPickerViewComponent *component = [[[self class] alloc] init];
    component.rows                 = rows;
    component.componentWidth       = componentWidth;
    
    return component;
}

+ (instancetype)pickerViewComponentWithRowsBlock:(void (^)(NSMutableArray <LdzfPickerViewRowModel *> *rows))rowsBlock
                                  componentWidth:(CGFloat)componentWidth {
    
    NSMutableArray *rows = [NSMutableArray array];
    if (rowsBlock) {
        
        rowsBlock(rows);
    }
    
    LdzfPickerViewComponent *component = [[[self class] alloc] init];
    component.rows                 = [NSArray arrayWithArray:rows];
    component.componentWidth       = componentWidth;
    
    return component;
}

@end
