//
//  IUCustomPickerView.h
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import "IUPickerViewDataAdapter.h"
@class IUCustomPickerView;

@protocol IUCustomPickerViewDelegate <NSObject>

@optional

- (void)customPickerView:(IUCustomPickerView *)pickerView
            didSelectRow:(NSInteger)row
             inComponent:(NSInteger)component;

- (void)customPickerView:(IUCustomPickerView *)pickerView
         didSelectedRows:(NSArray <NSNumber *> *)rows
           selectedDatas:(NSArray <id> *)datas;

@end

@interface IUCustomPickerView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id <IUCustomPickerViewDelegate>)delegate;

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id <IUCustomPickerViewDelegate>)delegate
                  dataAdapter:(IUPickerViewDataAdapter *)dataAdapter;

@property (nonatomic, weak) id<IUCustomPickerViewDelegate> delegate;
@property (nonatomic, strong, readonly) UIPickerView *pickView;
@property (nonatomic, strong) IUPickerViewDataAdapter *pickerViewDataAdapter;
- (void)reloadAllComponents;
- (void)reloadComponent:(NSInteger)component;
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;
- (NSInteger)selectedRowInComponent:(NSInteger)component;

#pragma mark - Debug

@property (nonatomic) BOOL showPickerCustomViewFrame;

@end


