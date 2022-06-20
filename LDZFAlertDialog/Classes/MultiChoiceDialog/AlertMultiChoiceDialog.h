/*
 多选：
 可设置选中，不可选中

 */
#import <LDZFAlertDialog/AlertBaseDialog.h>
#import "AlertMultiChoiceDialogCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlertMultiChoiceDialog : AlertBaseDialog
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源
@property (nonatomic, strong) NSMutableArray *checkedItems;//选中
@property (nonatomic, strong) NSMutableArray *disableItems;//不可选中

@property(nonatomic, copy) void (^didSelectedItems)(AlertMultiChoiceDialog *dialog, NSArray *items);
@property(nonatomic, copy) void (^didSelectRowAtIndexPath)(AlertMultiChoiceDialog *dialog, NSIndexPath *indexPath);

@property(nonatomic, strong) Class cellClass;//AlertMultiChoiceDialogCell 子类
#pragma mark - Useful Method
- (void)enableItem:(id)item enable:(BOOL)enable;
- (void)checkedItem:(id)item check:(BOOL)check;

#pragma mark - 链式调用
- (AlertMultiChoiceDialog *(^)(Class cellClass))withCellClass;
@end

NS_ASSUME_NONNULL_END
/*
 Example:
 
 NSMutableArray *datas = [NSMutableArray array];
 for (int i = 0; i < 10; i++) {
     [datas addObject:[NSString stringWithFormat:@"%d",i]];
 }
 
 AlertMultiChoiceDialog *dialog = AlertMultiChoiceDialog.build;
 dialog.withInfo(@"-请选择-").withSelectedItem(@"4").withShowDatas(datas);
 [dialog setDialogWillShow:^(AlertBaseDialog *dialog) {
     [((AlertMultiChoiceDialog *)dialog).disableItems addObject:@"3"];
     [((AlertMultiChoiceDialog *)dialog).tableView reloadData];
 }];
 [dialog setDidSelectedItems:^(AlertMultiChoiceDialog *dialog, NSArray *items) {
     NSLog(@"%@",items);
     IUViewController *vc = [[IUViewController alloc] init];
     [self.navigationController pushViewController:vc animated:YES];
 }];
 [self presentViewController:dialog animated:NO completion:nil];
 
 */
