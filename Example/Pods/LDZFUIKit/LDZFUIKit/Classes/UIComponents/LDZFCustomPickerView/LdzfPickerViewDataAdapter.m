//
//  LdzfPickerViewDataAdapter.m
//  LdzfCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "LdzfPickerViewDataAdapter.h"

@implementation LdzfPickerViewDataAdapter
+ (instancetype)pickerViewDataAdapterWithComponents:(NSArray <LdzfPickerViewComponent *> *)components rowHeight:(CGFloat)rowHeight {
    
    LdzfPickerViewDataAdapter *adpater = [[[self class] alloc] init];
    adpater.components             = components;
    adpater.rowHeight              = rowHeight;
    
    return adpater;
}

+ (instancetype)pickerViewDataAdapterWithComponentsBlock:(void (^)(NSMutableArray <LdzfPickerViewComponent *> *))componentsBlock rowHeight:(CGFloat)rowHeight {
    
    NSMutableArray *array = [NSMutableArray array];
    if (componentsBlock) {
        
        componentsBlock(array);
    }
    
    LdzfPickerViewDataAdapter *adpater = [[[self class] alloc] init];
    adpater.components             = [NSArray arrayWithArray:array];
    adpater.rowHeight              = rowHeight;
    
    return adpater;
}
@end

