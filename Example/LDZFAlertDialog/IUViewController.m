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

@interface IUViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong, nullable) UITableView *recylerView;
@property(nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation IUViewController

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self ldzfInitSubviews];
    
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

- (void)ldzfInitSubviews {
    [self createTableViewWithStyle:UITableViewStylePlain];
}


- (void)createTableViewWithStyle:(UITableViewStyle)style {
    [self createTableViewWithFrame:self.view.bounds style:style];
}

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self createTableView:UITableView.class withFrame:frame style:style];
}

- (void)createTableView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self.recylerView removeFromSuperview];
    self.recylerView = nil;
    self.recylerView = [self preferredRecylerView:viewClass withFrame:frame style:style];
    [self.view addSubview:self.recylerView];
    [self.recylerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.recylerView.superview);
    }];
}

#pragma mark - getter
- (UITableView *)preferredRecylerView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    UITableView *recylerView = [[viewClass alloc] initWithFrame:frame style:style];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.separatorStyle = UITableViewCellSeparatorStyleNone;
    recylerView.showsVerticalScrollIndicator = NO;
    recylerView.showsHorizontalScrollIndicator = NO;
    recylerView.delegate = self;
    recylerView.dataSource = self;
    return recylerView;
}

#pragma mark - UITableViewDelegate
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
            dialog.withInfo(@"请选择-开始时间");
            [dialog setDidSelectedItems:^(AlertDateDialog *dialog, NSArray *items) {
                NSLog(@"%@",items);
                IUViewController *vc = [[IUViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }];
            [self presentViewController:dialog animated:NO completion:nil];

        }
        else if (indexPath.row == 1) {
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

        }
        else if (indexPath.row == 2) {
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
        }
    }
}



@end
