
#import "UILabel+LdzfGeneral.h"

@implementation UILabel (LdzfGeneral)

- (void)qnm_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock {

    self.text = text;
    [self sizeToFit];
    
    if (configBlock) {
        configBlock(self);
    }
}

- (void)qnm_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock {
    
    self.attributedText = text;
    [self sizeToFit];
    
    if (configBlock) {
        configBlock(self);
    }
}

@end
