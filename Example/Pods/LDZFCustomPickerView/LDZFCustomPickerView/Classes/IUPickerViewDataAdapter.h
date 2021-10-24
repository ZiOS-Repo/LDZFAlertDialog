//
//  IUPickerViewDataAdapter.h
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <Foundation/Foundation.h>
#import "IUPickerViewComponent.h"
@interface IUPickerViewDataAdapter : NSObject

@property (nonatomic, strong) NSArray <IUPickerViewComponent *> *components;
@property (nonatomic)         CGFloat                          rowHeight;

+ (instancetype)pickerViewDataAdapterWithComponents:(NSArray <IUPickerViewComponent *> *)components rowHeight:(CGFloat)rowHeight;

+ (instancetype)pickerViewDataAdapterWithComponentsBlock:(void (^)(NSMutableArray <IUPickerViewComponent *> *components))componentsBlock rowHeight:(CGFloat)rowHeight;
@end
