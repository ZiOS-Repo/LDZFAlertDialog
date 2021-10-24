
#import <UIKit/UIKit.h>
#import "LDZFCategories/LDZFCategories.h"
#import "LDZFGeneralTools/LDZFGeneralTools.h"
#import "Masonry/Masonry.h"
NS_ASSUME_NONNULL_BEGIN
@class AlertBaseDialog;

@protocol AlertBaseDialogDelegate <NSObject>

@optional
- (void)baseDialogWillShow:(AlertBaseDialog *)dialog;
- (void)baseDialogDidShow:(AlertBaseDialog *)dialog;
- (void)baseDialogWillHide:(AlertBaseDialog *)dialog;
- (void)baseDialogDidHide:(AlertBaseDialog *)dialog;
- (void)baseDialog:(AlertBaseDialog *)dialog didSelectedItems:(NSArray *)items;

- (void)baseDialog:(AlertBaseDialog *)dialog didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface AlertBaseDialog : UIViewController
@property(nonatomic, assign) NSInteger tag;
@property(nonatomic, strong) id picker;
// weak对象
@property(nonatomic, weak) id object;
// 代理
@property(nonatomic, weak) id <AlertBaseDialogDelegate>delegate;
// 信息数据
@property(nonatomic, strong) id info;
// 选中内容,可能是数组,可能是一个对象
@property(nonatomic, strong) id selectedItem;
// 显示内容的数据
@property(nonatomic, strong) NSArray *showDatas;

- (UIImage *)imageFromCustomBundle:(NSString *)name;


#pragma mark - 视图容器
@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UIView *containerView;
- (void)showContainerView;
- (void)hideContainerView;

#pragma mark - Chain Programming.

+ (instancetype)build;
- (AlertBaseDialog *(^)(NSInteger tag))withTag;
- (AlertBaseDialog *(^)(id object))withObject;
- (AlertBaseDialog *(^)(id <AlertBaseDialogDelegate> delegate))withDelegate;
- (AlertBaseDialog *(^)(id info))withInfo;
- (AlertBaseDialog *(^)(id selectedItem))withSelectedItem;
- (AlertBaseDialog *(^)(NSArray *showDatas))withShowDatas;
- (AlertBaseDialog *(^)(void))prepareFinish;//最后调用！！！

@end

NS_ASSUME_NONNULL_END
