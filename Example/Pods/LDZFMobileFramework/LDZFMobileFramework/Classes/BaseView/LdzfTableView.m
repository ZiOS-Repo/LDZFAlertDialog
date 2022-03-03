//
//  LdzfTableView.m
//  LDZFMobileFramework
//
//  Created by zhuyuhui on 2022/3/3.
//

#import "LdzfTableView.h"

@implementation LdzfTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self adjust];
    }
    return self;
}

- (void)adjust {
    //iOS15
    if (@available(iOS 15.0, *)) {
        self.sectionHeaderTopPadding = 0;
    } else {
        // Fallback on earlier versions
    }
    
    //iOS11
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    } else {
        // Fallback on earlier versions
    }
}
@end
