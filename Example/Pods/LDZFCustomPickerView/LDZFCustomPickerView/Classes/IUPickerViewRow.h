//
//  IUPickerViewRow.h
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <Foundation/Foundation.h>
#import "IUPickerCustomView.h"

@interface IUPickerViewRow : NSObject
@property (nonatomic) Class      pickerCustomViewClass;
@property (nonatomic, strong) id data;

+ (instancetype)pickerViewRowWithViewClass:(Class)viewClass data:(id)data;

@end
