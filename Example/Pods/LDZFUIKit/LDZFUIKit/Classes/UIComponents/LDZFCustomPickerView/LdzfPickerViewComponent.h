//
//  LdzfPickerViewComponent.h
//  LdzfCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "LdzfPickerViewRowModel.h"
@interface LdzfPickerViewComponent : UIView

@property (nonatomic, strong) NSArray <LdzfPickerViewRowModel *> *rows;
@property (nonatomic)         CGFloat                    componentWidth;

+ (instancetype)pickerViewComponentWithRows:(NSArray <LdzfPickerViewRowModel *> *)rows componentWidth:(CGFloat)componentWidth;

+ (instancetype)pickerViewComponentWithRowsBlock:(void (^)(NSMutableArray <LdzfPickerViewRowModel *> *rows))rowsBlock componentWidth:(CGFloat)componentWidth;
@end

