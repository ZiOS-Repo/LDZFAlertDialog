//
//  IUPickerCustomView.h
//  IUCustomPickerView
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>

@interface IUPickerCustomView : UIView
@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger component;
@property (nonatomic, weak) id data;

- (void)setup;
- (void)buildSubView;
- (void)loadContent;
@end

