
#import <UIKit/UIKit.h>

@interface UILabel (LdzfGeneral)

- (void)qnm_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock;
- (void)qnm_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock;


@end
