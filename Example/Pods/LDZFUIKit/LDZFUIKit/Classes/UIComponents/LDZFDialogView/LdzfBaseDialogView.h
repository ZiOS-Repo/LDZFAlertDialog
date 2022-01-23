#import <UIKit/UIKit.h>
@class LdzfBaseDialogView;

@protocol LdzfBaseDialogViewDelegate <NSObject>

@optional
- (void)LdzfBaseDialogViewWillShow:(LdzfBaseDialogView *)dialogView;
- (void)LdzfBaseDialogViewDidShow:(LdzfBaseDialogView *)dialogView;
- (void)LdzfBaseDialogViewWillHide:(LdzfBaseDialogView *)dialogView;
- (void)LdzfBaseDialogViewDidHide:(LdzfBaseDialogView *)dialogView;
- (void)LdzfBaseDialogView:(LdzfBaseDialogView *)dialogView
         didSelectedIndexs:(NSArray <NSNumber *> *)indexs
                     items:(NSArray *)items;

@end

@interface LdzfBaseDialogView : UIView
// contentView的高度,需要子类提供数据
@property (nonatomic, class, readonly)  CGFloat  contentViewHeight;
// 由子类在buildViewsInContentView中赋值,在configPicker中使用
@property (nonatomic, weak)   id    picker;
@property (nonatomic, weak)   id    object; // weak对象
@property (nonatomic, weak)   id <LdzfBaseDialogViewDelegate>  delegate;     // 代理
@property (nonatomic, strong) id    info;   // 信息数据
@property (nonatomic, strong) id    selectedItem; // 选中内容,可能是数组,可能是一个对象
@property (nonatomic, strong) NSArray   *showDatas;    // 显示内容的数据

+ (instancetype)showPickerViewWithDelegate:(id <LdzfBaseDialogViewDelegate>)delegate
                                       tag:(NSInteger)tag
                                    object:(id)object
                                      info:(id)info
                              selectedItem:(id)selectedItem
                                 showDatas:(NSArray *)showDatas;

/**
 在执行此方法之前,需要先提供contentViewHeight的数值
 */
- (void)prepare;

/**
 [子类重载] 在contentView中添加内容
 */
- (void)buildViewsInContentView:(UIView *)contentView;

/**
 [子类重载] 对picker进行配置以及数据的处理
 */
- (void)configPicker;

/**
 显示
 */
- (void)show;

/**
 隐藏
 */
- (void)hide;

#pragma mark - Chain Programming.

+ (instancetype)build;
- (LdzfBaseDialogView *(^)(NSInteger tag))withTag;
- (LdzfBaseDialogView *(^)(id object))withObject;
- (LdzfBaseDialogView *(^)(id <LdzfBaseDialogViewDelegate> delegate))withDelegate;
- (LdzfBaseDialogView *(^)(id info))withInfo;
- (LdzfBaseDialogView *(^)(id selectedItem))withSelectedItem;
- (LdzfBaseDialogView *(^)(NSArray *showDatas))withShowDatas;
- (LdzfBaseDialogView *(^)(UIView *superiorView))prepareAndShowIn;

@end
