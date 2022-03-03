
#import "UILabel+LdzfGeneral.h"

@implementation UILabel (LdzfGeneral)

- (void)ldzf_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock {

    self.text = text;
    [self sizeToFit];
    
    if (configBlock) {
        configBlock(self);
    }
}

- (void)ldzf_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock {
    
    self.attributedText = text;
    [self sizeToFit];
    
    if (configBlock) {
        configBlock(self);
    }
}

@end
