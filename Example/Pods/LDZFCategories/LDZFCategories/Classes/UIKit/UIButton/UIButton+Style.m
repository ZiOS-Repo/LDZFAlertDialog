
#import "UIButton+Style.h"

@implementation UIButton (Style)

- (void)titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                    verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                    contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets {

    self.contentHorizontalAlignment = horizontalAlignment;
    self.contentVerticalAlignment   = verticalAlignment;
    self.contentEdgeInsets          = contentEdgeInsets;
}

- (void)titleLabelColorWithNormalStateColor:(UIColor *)normalStateColor
                      highlightedStateColor:(UIColor *)highlightedStateColor
                         disabledStateColor:(UIColor *)disabledStateColor {

    if (normalStateColor) {

        [self setTitleColor:normalStateColor forState:UIControlStateNormal];
    }

    if (highlightedStateColor) {
        
        [self setTitleColor:highlightedStateColor forState:UIControlStateHighlighted];
    }
    
    if (disabledStateColor) {
        
        [self setTitleColor:disabledStateColor forState:UIControlStateDisabled];
    }
}

- (void)buttonSolidBackgroundColorWithNormalStateColor:(UIColor *)normalStateColor
                                 highlightedStateColor:(UIColor *)highlightedStateColor
                                    disabledStateColor:(UIColor *)disabledStateColor {
    
    if (normalStateColor) {
        
        [self setBackgroundImage:[self imageWithSize:CGSizeMake(5, 5) color:normalStateColor]      forState:UIControlStateNormal];
    }

    if (highlightedStateColor) {

        [self setBackgroundImage:[self imageWithSize:CGSizeMake(5, 5) color:highlightedStateColor] forState:UIControlStateHighlighted];
    }

    if (disabledStateColor) {

        [self setBackgroundImage:[self imageWithSize:CGSizeMake(5, 5) color:disabledStateColor]    forState:UIControlStateDisabled];
    }
}

+ (UIButton *)labelButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                              font:(UIFont *)font
               horizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                 verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                 contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                            target:(id)target
                            action:(SEL)action
                  normalTitleColor:(UIColor *)normalStateColor
             highlightedTitleColor:(UIColor *)highlightedStateColor
                disabledTitleColor:(UIColor *)disabledStateColor {
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    button.contentHorizontalAlignment = horizontalAlignment;
    button.contentVerticalAlignment   = verticalAlignment;
    button.contentEdgeInsets          = contentEdgeInsets;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (normalStateColor) {
        
        [button setTitleColor:normalStateColor forState:UIControlStateNormal];
    }
    
    if (highlightedStateColor) {
        
        [button setTitleColor:highlightedStateColor forState:UIControlStateHighlighted];
    }
    
    if (disabledStateColor) {
        
        [button setTitleColor:disabledStateColor forState:UIControlStateDisabled];
    }
    
    return button;
}

+ (UIButton *)iconButtonWithFrame:(CGRect)frame
              horizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                           target:(id)target
                           action:(SEL)action
                      normalImage:(UIImage *)normalImage
                   highlightImage:(UIImage *)highlightImage
                    disabledImage:(UIImage *)disabledImage {

    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    button.contentHorizontalAlignment = horizontalAlignment;
    button.contentVerticalAlignment   = verticalAlignment;
    button.contentEdgeInsets          = contentEdgeInsets;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (normalImage) {
        
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (highlightImage) {
        
        [button setImage:highlightImage forState:UIControlStateHighlighted];
    }
    
    if (disabledImage) {
        
        [button setImage:highlightImage forState:UIControlStateDisabled];
    }
    
    return button;
}


#pragma mark - Private method.

- (UIImage *)imageWithSize:(CGSize)size color:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - CustomIcon.
- (void)setIconInLeft
{
    [self setIconInLeftWithSpacing:0];
}

- (void)setIconInRight
{
    [self setIconInRightWithSpacing:0];
}

- (void)setIconInTop
{
    [self setIconInTopWithSpacing:0];
}

- (void)setIconInBottom
{
    [self setIconInBottomWithSpacing:0];
}

- (void)setIconInLeftWithSpacing:(CGFloat)Spacing
{
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = Spacing,
        .bottom = 0,
        .right  = -Spacing,
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = -Spacing,
        .bottom = 0,
        .right  = Spacing,
    };
}

- (void)setIconInRightWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + Spacing / 2),
        .bottom = 0,
        .right  =   (img_W + Spacing / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + Spacing / 2),
        .bottom = 0,
        .right  = - (tit_W + Spacing / 2),
    };
}

- (void)setIconInTopWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    =   (tit_H / 2 + Spacing / 2),
        .left   = - (img_W / 2),
        .bottom = - (tit_H / 2 + Spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = - (img_H / 2 + Spacing / 2),
        .left   =   (tit_W / 2),
        .bottom =   (img_H / 2 + Spacing / 2),
        .right  = - (tit_W / 2),
    };
}

- (void)setIconInBottomWithSpacing:(CGFloat)Spacing
{
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = - (tit_H / 2 + Spacing / 2),
        .left   = - (img_W / 2),
        .bottom =   (tit_H / 2 + Spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    =   (img_H / 2 + Spacing / 2),
        .left   =   (tit_W / 2),
        .bottom = - (img_H / 2 + Spacing / 2),
        .right  = - (tit_W / 2),
    };
}

@end
