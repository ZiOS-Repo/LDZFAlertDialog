//
//  LdzfPickerView.h
//  LdzfPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import "LdzfPickerViewDataAdapter.h"
@class LdzfPickerView;

@protocol LdzfPickerViewDelegate <NSObject>

@optional

- (void)customPickerView:(LdzfPickerView *)pickerView
            didSelectRow:(NSInteger)row
             inComponent:(NSInteger)component;

- (void)customPickerView:(LdzfPickerView *)pickerView
         didSelectedRows:(NSArray <NSNumber *> *)rows
           selectedDatas:(NSArray <id> *)datas;

@end

@interface LdzfPickerView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id <LdzfPickerViewDelegate>)delegate;

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id <LdzfPickerViewDelegate>)delegate
                  dataAdapter:(LdzfPickerViewDataAdapter *)dataAdapter;

@property (nonatomic, weak) id<LdzfPickerViewDelegate> delegate;
@property (nonatomic, strong, readonly) UIPickerView *pickView;
@property (nonatomic, strong) LdzfPickerViewDataAdapter *pickerViewDataAdapter;
- (void)reloadAllComponents;
- (void)reloadComponent:(NSInteger)component;
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;
- (NSInteger)selectedRowInComponent:(NSInteger)component;

#pragma mark - Debug

@property (nonatomic) BOOL showPickerCustomViewFrame;

@end


