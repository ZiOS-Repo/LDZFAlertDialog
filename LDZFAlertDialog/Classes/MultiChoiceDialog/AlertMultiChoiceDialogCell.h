

#import <UIKit/UIKit.h>
#import "Masonry/Masonry.h"
NS_ASSUME_NONNULL_BEGIN
@class AlertMultiChoiceDialog;
@interface AlertMultiChoiceDialogCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *selectImgView;
@property (nonatomic, strong) UIView *bLine;
@property (nonatomic, strong) id data;
@property (nonatomic, weak) AlertMultiChoiceDialog *dialog;

- (void)setupCell;
- (void)buildSubview;
- (void)loadContent;
@end

NS_ASSUME_NONNULL_END
