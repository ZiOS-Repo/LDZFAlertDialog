//
//  IUPickerViewDataAdapter.m
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "IUPickerViewDataAdapter.h"

@implementation IUPickerViewDataAdapter
+ (instancetype)pickerViewDataAdapterWithComponents:(NSArray <IUPickerViewComponent *> *)components rowHeight:(CGFloat)rowHeight {
    
    IUPickerViewDataAdapter *adpater = [[[self class] alloc] init];
    adpater.components             = components;
    adpater.rowHeight              = rowHeight;
    
    return adpater;
}

+ (instancetype)pickerViewDataAdapterWithComponentsBlock:(void (^)(NSMutableArray <IUPickerViewComponent *> *))componentsBlock rowHeight:(CGFloat)rowHeight {
    
    NSMutableArray *array = [NSMutableArray array];
    if (componentsBlock) {
        
        componentsBlock(array);
    }
    
    IUPickerViewDataAdapter *adpater = [[[self class] alloc] init];
    adpater.components             = [NSArray arrayWithArray:array];
    adpater.rowHeight              = rowHeight;
    
    return adpater;
}
@end

