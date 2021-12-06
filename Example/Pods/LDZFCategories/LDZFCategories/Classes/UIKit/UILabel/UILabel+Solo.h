
#import <UIKit/UIKit.h>

@interface UILabel (Solo)

- (void)solo_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock;
- (void)solo_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock;


@end
