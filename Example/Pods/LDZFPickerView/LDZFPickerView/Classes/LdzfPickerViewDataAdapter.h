//
//  LdzfPickerViewDataAdapter.h
//  LdzfCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <Foundation/Foundation.h>
#import "LdzfPickerViewComponent.h"
@interface LdzfPickerViewDataAdapter : NSObject

@property (nonatomic, strong) NSArray <LdzfPickerViewComponent *> *components;
@property (nonatomic, assign) CGFloat rowHeight;

+ (instancetype)pickerViewDataAdapterWithComponents:(NSArray <LdzfPickerViewComponent *> *)components rowHeight:(CGFloat)rowHeight;

+ (instancetype)pickerViewDataAdapterWithComponentsBlock:(void (^)(NSMutableArray <LdzfPickerViewComponent *> *components))componentsBlock rowHeight:(CGFloat)rowHeight;
@end
