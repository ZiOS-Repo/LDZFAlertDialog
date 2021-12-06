
#import "UILabel+Solo.h"

@implementation UILabel (Solo)

- (void)solo_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock {

    self.text = text;
    [self sizeToFit];
    
    if (configBlock) {
        configBlock(self);
    }
}

- (void)solo_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock {
    
    self.attributedText = text;
    [self sizeToFit];
    
    if (configBlock) {
        configBlock(self);
    }
}

@end
