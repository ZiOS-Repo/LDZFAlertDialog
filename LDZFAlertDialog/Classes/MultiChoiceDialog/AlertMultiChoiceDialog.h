
#import "LDZFAlertDialog/AlertBaseDialog.h"
#import "AlertMultiChoiceDialogCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlertMultiChoiceDialog : AlertBaseDialog
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源
@property (nonatomic, strong) NSMutableArray *checkedItems;//选中
@property (nonatomic, strong) NSMutableArray *disableItems;//不可选中


@property(nonatomic, strong) Class cellClass;//AlertMultiChoiceDialogCell 子类
#pragma mark - Useful Method
- (void)enableItem:(id)item enable:(BOOL)enable;
- (void)checkedItem:(id)item check:(BOOL)check;

- (AlertMultiChoiceDialog *(^)(Class cellClass))withCellClass;
@end

NS_ASSUME_NONNULL_END
