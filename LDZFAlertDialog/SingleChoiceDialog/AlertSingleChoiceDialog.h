
#import <LDZFAlertDialog/AlertBaseDialog.h>
#import <LDZFPickerView/LDZFPickerView.h>
#import "AlertSingleChoiceDialogRowView.h"
NS_ASSUME_NONNULL_BEGIN

@interface AlertSingleChoiceDialog : AlertBaseDialog
@property(nonatomic, copy) void (^didSelectedItems)(AlertSingleChoiceDialog *dialog, NSArray *items);
@end

NS_ASSUME_NONNULL_END
/*
 Example:
 
 NSMutableArray *datas = [NSMutableArray array];
 for (int i = 0; i < 10; i++) {
     [datas addObject:[NSString stringWithFormat:@"%d",i]];
 }
 AlertSingleChoiceDialog *dialog = AlertSingleChoiceDialog.build;
 dialog.withInfo(@"请选择").withSelectedItem(@"3").withShowDatas(datas);
 [dialog setDidSelectedItems:^(AlertSingleChoiceDialog *dialog, NSArray *items) {
     NSLog(@"%@",items);
     IUViewController *vc = [[IUViewController alloc] init];
     [self.navigationController pushViewController:vc animated:YES];
 }];
 [self presentViewController:dialog animated:NO completion:nil];
 
 */
