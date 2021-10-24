//
//  IUPickerViewRow.m
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "IUPickerViewRow.h"

@implementation IUPickerViewRow
+ (instancetype)pickerViewRowWithViewClass:(Class)viewClass data:(id)data {
    
    IUPickerViewRow *row        = [[[self class] alloc] init];
    row.pickerCustomViewClass = viewClass;
    row.data                  = data;
    
    return row;
}
@end
