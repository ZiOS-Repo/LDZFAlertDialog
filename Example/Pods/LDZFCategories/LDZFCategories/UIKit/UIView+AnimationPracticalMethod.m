

#import "UIView+AnimationPracticalMethod.h"

@implementation UIView (AnimationPracticalMethod)

- (void)alpha:(CGFloat)alpha duration:(NSTimeInterval)duration animated:(BOOL)animated {

    CGFloat effectiveAlpha = (alpha < 0 || alpha > 1) ? (alpha < 0 ? 0 : 1) : alpha;
    
    if (animated) {
        
        [UIView animateWithDuration:duration animations:^{
            
            self.alpha = effectiveAlpha;
        }];
        
    } else {
    
        self.alpha = alpha;
    }
}

@end
