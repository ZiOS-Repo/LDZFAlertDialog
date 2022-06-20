
#import <Foundation/Foundation.h>

@interface NSString (LdzfSize)

#pragma mark - StringAttribute.

/**
 *  Get the string's height with the fixed width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)qnm_heightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
- (CGFloat)qnm_widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

/**
 *  Get a line of text height.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
+ (CGFloat)qnm_oneLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

#pragma mark - Font.

/**
 *  Get the string's height with the fixed width.
 *
 *  @param font  String's font.
 *  @param width Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)qnm_heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
- (CGFloat)qnm_widthWithStringFont:(UIFont *)font;

/**
 *  Get a line of text height.
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
+ (CGFloat)qnm_oneLineOfTextHeightWithStringFont:(UIFont *)font;





@end
