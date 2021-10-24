//
//  IUPickerViewComponent.h
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "IUPickerViewRow.h"
@interface IUPickerViewComponent : UIView

@property (nonatomic, strong) NSArray <IUPickerViewRow *> *rows;
@property (nonatomic)         CGFloat                    componentWidth;

+ (instancetype)pickerViewComponentWithRows:(NSArray <IUPickerViewRow *> *)rows componentWidth:(CGFloat)componentWidth;

+ (instancetype)pickerViewComponentWithRowsBlock:(void (^)(NSMutableArray <IUPickerViewRow *> *rows))rowsBlock componentWidth:(CGFloat)componentWidth;
@end

