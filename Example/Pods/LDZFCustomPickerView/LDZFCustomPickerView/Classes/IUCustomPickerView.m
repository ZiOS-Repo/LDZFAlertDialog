//
//  IUCustomPickerView.m
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "IUCustomPickerView.h"

@interface IUCustomPickerView () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView                *pickView;

@end

@implementation IUCustomPickerView

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id <IUCustomPickerViewDelegate>)delegate
                  dataAdapter:(IUPickerViewDataAdapter *)dataAdapter {
    
    self.pickerViewDataAdapter = dataAdapter;
    self.delegate              = delegate;
    
    if (self = [super initWithFrame:frame]) {
        self.pickView            = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.pickView.delegate   = self;
        self.pickView.dataSource = self;
        [self addSubview:self.pickView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id <IUCustomPickerViewDelegate>)delegate {
    
    return [self initWithFrame:frame delegate:delegate dataAdapter:nil];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.pickView.frame  = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)reloadAllComponents {
    
    [self.pickView reloadAllComponents];
}

- (void)reloadComponent:(NSInteger)component {
    
    [self.pickView reloadComponent:component];
}

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated {
    
    [self.pickView selectRow:row inComponent:component animated:animated];
}

- (NSInteger)selectedRowInComponent:(NSInteger)component {
 
    return [self.pickView selectedRowInComponent:component];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return self.pickerViewDataAdapter.components.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.pickerViewDataAdapter.components[component].rows.count;
}

#pragma mark - UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return self.pickerViewDataAdapter.components[component].componentWidth;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return self.pickerViewDataAdapter.rowHeight;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    
    IUPickerViewComponent *pickerViewComponent = self.pickerViewDataAdapter.components[component];
    IUPickerViewRow       *pickerViewRow       = self.pickerViewDataAdapter.components[component].rows[row];
    
    IUPickerCustomView *customView = (IUPickerCustomView *)view;
    if (customView == nil) {
        customView = [[pickerViewRow.pickerCustomViewClass alloc] initWithFrame:CGRectMake(0, 0,pickerViewComponent.componentWidth,self.pickerViewDataAdapter.rowHeight)];
    }
    
    customView.row       = row;
    customView.component = component;
    customView.data      = pickerViewRow.data;
    [customView loadContent];
    
    if (self.showPickerCustomViewFrame == YES) {

        customView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15f];
    }
    
    return customView;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customPickerView:didSelectRow:inComponent:)]) {
        
        [self.delegate customPickerView:self didSelectRow:row inComponent:component];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customPickerView:didSelectedRows:selectedDatas:)]) {
    
        NSMutableArray *datas = [NSMutableArray array];
        NSMutableArray *rows  = [NSMutableArray array];
        
        for (int i = 0; i < self.pickerViewDataAdapter.components.count; i++) {
            
            NSInteger row  = [pickerView selectedRowInComponent:i];
            id        data = nil;
            
            if ([self.pickerViewDataAdapter.components[i].rows count]) {
             
               data = self.pickerViewDataAdapter.components[i].rows[row].data;
            }
            
            [rows  addObject:@(row)];
            [datas addObject:data ? data : [NSNull null]];
        }

        [self.delegate customPickerView:self didSelectedRows:rows selectedDatas:datas];
    }
}

@end

