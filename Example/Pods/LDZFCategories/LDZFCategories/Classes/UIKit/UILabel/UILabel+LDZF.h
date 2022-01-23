
#import <UIKit/UIKit.h>

@interface UILabel (LDZF)

- (void)ldzf_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock;
- (void)ldzf_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock;


@end
