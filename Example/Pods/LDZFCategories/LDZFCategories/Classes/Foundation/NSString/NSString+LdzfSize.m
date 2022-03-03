
#import "NSString+LdzfSize.h"

@implementation NSString (LdzfSize)

- (CGFloat)ldzf_heightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width {
    
    NSParameterAssert(attribute);
    
    CGFloat height = 0;
    
    if (self.length) {
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:attribute
                                         context:nil];
        
        height = rect.size.height;
    }
    
    return height;
}

- (CGFloat)ldzf_widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute {
    
    NSParameterAssert(attribute);
    
    CGFloat width = 0;
    
    if (self.length) {
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:attribute
                                         context:nil];
        
        width = rect.size.width;
    }
    
    return width;
}

+ (CGFloat)ldzf_oneLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute {
    
    NSParameterAssert(attribute);
    
    CGFloat height = 0;
    CGRect rect    = [@"One" boundingRectWithSize:CGSizeMake(200, MAXFLOAT)
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil];
    
    height = rect.size.height;
    return height;
}

- (CGFloat)ldzf_heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width {

    NSParameterAssert(font);
    
    CGFloat height = 0;
    
    if (self.length) {
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName: font}
                                         context:nil];
        
        height = rect.size.height;
    }
    
    return height;
}

- (CGFloat)ldzf_widthWithStringFont:(UIFont *)font {

    NSParameterAssert(font);
    
    CGFloat width = 0;
    
    if (self.length) {
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName: font}
                                         context:nil];
        
        width = rect.size.width;
    }
    
    return width;
}

+ (CGFloat)ldzf_oneLineOfTextHeightWithStringFont:(UIFont *)font {

    NSParameterAssert(font);
    
    CGFloat height = 0;
    CGRect rect    = [@"One" boundingRectWithSize:CGSizeMake(200, MAXFLOAT)
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName: font}
                                          context:nil];
    
    height = rect.size.height;
    return height;
}
@end
