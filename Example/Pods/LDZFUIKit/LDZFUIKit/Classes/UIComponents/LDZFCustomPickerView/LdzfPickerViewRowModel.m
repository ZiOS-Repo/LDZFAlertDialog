//
//  LdzfPickerViewRowModel.m
//  LdzfCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "LdzfPickerViewRowModel.h"

@implementation LdzfPickerViewRowModel
+ (instancetype)pickerViewRowWithViewClass:(Class)viewClass data:(id)data {
    
    LdzfPickerViewRowModel *row        = [[[self class] alloc] init];
    row.pickerCustomViewClass = viewClass;
    row.data                  = data;
    
    return row;
}
@end
