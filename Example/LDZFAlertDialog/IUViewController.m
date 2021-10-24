//
//  IUViewController.m
//  IU_AlertDialog
//
//  Created by zhuyuhui434@gmail.com on 06/04/2021.
//  Copyright (c) 2021 zhuyuhui434@gmail.com. All rights reserved.
//

#import "IUViewController.h"
#import <LDZFAlertDialog/LDZFAlertDialog.h>

#import "TNTComponentCell.h"

@interface IUViewController ()<AlertBaseDialogDelegate>

@end

@implementation IUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[
        @{
            @"title": @"基础弹窗", @"data": @[
                    @{@"name": @"日期"},
                    @{@"name": @"单选"},
                    @{@"name": @"多选"},
                    @{@"name": @"Bottom Translate"},
                    @{@"name": @"Center Fading"},
                    @{@"name": @"Center FromTop"},
                    @{@"name": @"Center FromBottom"}
            ]},
    ].mutableCopy;
    
    
    
    // 步骤1：
    self.recylerView.rowHeight = UITableViewAutomaticDimension;
    // 步骤2：
    self.recylerView.estimatedRowHeight = 100.0;

}
#pragma mark - UITableViewDelegate
//- (UITableViewStyle)preferredRecylerViewStyle {
//    return UITableViewStyleGrouped;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.dataSource[section][@"title"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.dataSource[section][@"data"];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    TNTComponentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TNTComponentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *arr = self.dataSource[indexPath.section][@"data"];
    if (arr.count > 0) {
        cell.contentLabel.text = arr[indexPath.row][@"name"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AlertDateDialog *dialog = AlertDateDialog.build;
            dialog.withInfo(@"请选择-开始时间").withDelegate(self).prepareFinish();
            [self presentViewController:dialog animated:NO completion:nil];

        }
        else if (indexPath.row == 1) {
            NSMutableArray *datas = [NSMutableArray array];
            for (int i = 0; i < 10; i++) {
                [datas addObject:[NSString stringWithFormat:@"%d",i]];
            }
            AlertSingleChoiceDialog *dialog = AlertSingleChoiceDialog.build;
            dialog.withInfo(@"请选择").withDelegate(self);
            dialog.withSelectedItem(@"").withShowDatas(datas).prepareFinish();
            [self presentViewController:dialog animated:NO completion:nil];

        }
        else if (indexPath.row == 2) {
            NSMutableArray *datas = [NSMutableArray array];
            for (int i = 0; i < 10; i++) {
                [datas addObject:[NSString stringWithFormat:@"%d",i]];
            }
            
            AlertMultiChoiceDialog *dialog = AlertMultiChoiceDialog.build;
            dialog.withInfo(@"-请选择-").withDelegate(self);
            dialog.withSelectedItem(@"4").withShowDatas(datas).prepareFinish();
            [self presentViewController:dialog animated:NO completion:nil];
        }
    }
}

#pragma mark - AlertBaseDialogDelegate
- (void)baseDialog:(AlertBaseDialog *)dialog didSelectedItems:(NSArray *)items {
    if (items) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@",items]);
    }
}

- (void)baseDialogWillShow:(AlertBaseDialog *)dialog {
    if ([dialog isKindOfClass:AlertMultiChoiceDialog.class]) {
        [((AlertMultiChoiceDialog *)dialog).disableItems addObject:@"3"];
        [((AlertMultiChoiceDialog *)dialog).tableView reloadData];
    }
}

//- (void)baseDialogDidShow:(CRJAlertBaseDialog *)dialog {
//    if ([dialog isKindOfClass:CRJMultiChoiceDialog.class]) {
//        [((CRJMultiChoiceDialog *)dialog).disableDatas addObject:@"3"];
//        [((CRJMultiChoiceDialog *)dialog).tableView reloadData];
//    }
//}


@end
