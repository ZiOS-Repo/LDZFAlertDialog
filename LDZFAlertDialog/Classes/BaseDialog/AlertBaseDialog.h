
#import <UIKit/UIKit.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN
@interface AlertBaseDialog : UIViewController
#pragma mark - 视图容器
@property(nonatomic, strong, readonly) UIView *backgroundView;
@property(nonatomic, strong, readonly) UIView *containerView;

#pragma mark - 参数
@property(nonatomic, assign) NSInteger tag;
@property(nonatomic, strong) id info;
@property(nonatomic, strong) id picker;
@property(nonatomic, strong) id selectedItem;// 选中内容,可能是数组,可能是一个对象
@property(nonatomic, strong) NSArray *showDatas;// 显示内容的数据
@property(nonatomic, weak) id object;// weak对象

#pragma mark - 回调
@property(nonatomic, copy) void (^dialogWillShow)(AlertBaseDialog *dialog);
@property(nonatomic, copy) void (^dialogDidShow)(AlertBaseDialog *dialog);
@property(nonatomic, copy) void (^dialogWillHide)(AlertBaseDialog *dialog);
@property(nonatomic, copy) void (^dialogDidHide)(AlertBaseDialog *dialog);


#pragma mark - ContainerView相关
@property(nonatomic, assign) BOOL showFlag;
@property(nonatomic, assign) BOOL dismissFlag;

- (CGFloat)containerViewHeight;
- (void)showContainerViewWithCompletion:(nullable void (^)(BOOL finished))completion;
- (void)hideContainerViewWithCompletion:(nullable void (^)(BOOL finished))completion;
- (void)dissMiss;


@end


#pragma mark - 屏幕旋转发生回调
@interface AlertBaseDialog(ScreenRotate)
/// 屏幕旋转事件
/// @param isPortrait YES 竖屏，NO 横屏
- (void)didChangeRotateWithIsPortrait:(BOOL)isPortrait;
@end


#pragma mark - 工具
@interface AlertBaseDialog(Utils)
- (UIImage *)imageFromCustomBundle:(NSString *)name;
@end


#pragma mark - Chain Programming.
@interface AlertBaseDialog(ChainProgramming)
+ (instancetype)build;
- (AlertBaseDialog *(^)(NSInteger tag))withTag;
- (AlertBaseDialog *(^)(id object))withObject;
- (AlertBaseDialog *(^)(id info))withInfo;
- (AlertBaseDialog *(^)(id selectedItem))withSelectedItem;
- (AlertBaseDialog *(^)(NSArray *showDatas))withShowDatas;
@end


NS_ASSUME_NONNULL_END
