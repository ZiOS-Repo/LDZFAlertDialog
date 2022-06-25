
#import <LDZFAlertDialog/AlertBaseDialog.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertDateDialog : AlertBaseDialog
@property(nonatomic, copy) void (^didSelectedItems)(AlertDateDialog *dialog, NSArray *items);
@end

NS_ASSUME_NONNULL_END
/*
 Example:
 
 AlertDateDialog *dialog = AlertDateDialog.build;
 dialog.withInfo(@"请选择-开始时间");
 [dialog setDidSelectedItems:^(AlertDateDialog *dialog, NSArray *items) {
     NSLog(@"%@",items);
     IUViewController *vc = [[IUViewController alloc] init];
     [self.navigationController pushViewController:vc animated:YES];
 }];
 [self presentViewController:dialog animated:NO completion:nil];

 
 */
