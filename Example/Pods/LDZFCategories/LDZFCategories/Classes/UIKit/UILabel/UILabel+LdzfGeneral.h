
#import <UIKit/UIKit.h>

@interface UILabel (LdzfGeneral)

- (void)ldzf_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock;
- (void)ldzf_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock;


@end
