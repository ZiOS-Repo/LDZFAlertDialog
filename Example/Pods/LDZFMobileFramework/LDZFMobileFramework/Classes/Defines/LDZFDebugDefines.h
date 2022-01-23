//
//  LdzfDebugDefines.h
//  Pods
//
//  Created by zhuyuhui on 2021/10/30.
//

#ifndef LdzfDebugDefines_h
#define LdzfDebugDefines_h

#define BUTTON_WITH_ACTION(_title, _sel)  \
{   \
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
    button.backgroundColor = UIColor.blueColor;\
    button.layer.cornerRadius = 4;\
    button.titleLabel.font = [UIFont systemFontOfSize:14];\
    [button setTitle:_title forState:UIControlStateNormal];\
    [button addTarget:self action:@selector(_sel) forControlEvents:UIControlEventTouchUpInside];\
    button.frame = CGRectMake(hMargin, vPadding + (index++) * (height + vMargin), width, height);   \
    [scrollView addSubview:button]; \
}

#define CREATE_UI(_addButton)   \
{   \
    UIScrollView *scrollView = [[UIScrollView alloc] init];  \
    [self.ldzfView addSubview:scrollView];  \
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {    \
        make.top.mas_equalTo(self.ldzfView.mas_top);  \
        make.bottom.mas_equalTo(self.ldzfView.mas_bottom);    \
        make.left.mas_equalTo(self.ldzfView.mas_left);  \
        make.right.mas_equalTo(self.ldzfView.mas_right);    \
    }]; \
    CGFloat hMargin = 0.05 * self.view.width, vMargin = 15; \
    CGFloat width = self.view.width - 2 * hMargin, height = 44; \
    NSInteger index = 0;    \
    CGFloat vPadding = 50;  \
    _addButton  \
    CGFloat maxY = 2 * vPadding + (index - 1) * (height + vMargin) + height;    \
    if (maxY > scrollView.height) { \
        scrollView.contentSize = CGSizeMake(scrollView.width, maxY);    \
    }   \
}

#endif /* LdzfDebugDefines_h */
