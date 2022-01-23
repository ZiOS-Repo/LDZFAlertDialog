
#import <Foundation/Foundation.h>

@interface NSString (LDZF)

#pragma mark - StringAttribute.

/**
 *  Get the string's height with the fixed width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)ldzf_heightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
- (CGFloat)ldzf_widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

/**
 *  Get a line of text height.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
+ (CGFloat)ldzf_oneLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

#pragma mark - Font.

/**
 *  Get the string's height with the fixed width.
 *
 *  @param font  String's font.
 *  @param width Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)ldzf_heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
- (CGFloat)ldzf_widthWithStringFont:(UIFont *)font;

/**
 *  Get a line of text height.
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
+ (CGFloat)ldzf_oneLineOfTextHeightWithStringFont:(UIFont *)font;


#pragma mark - 字符串查找.
/**
 *  Finds and returns the ranges of a given string, within the given range of the receiver.
 *
 *  @param searchString searchString.
 *  @param mask         A mask specifying search options. The following options may be specified by combining them with the C bitwise OR operator: NSCaseInsensitiveSearch, NSLiteralSearch, NSBackwardsSearch, NSAnchoredSearch. See String Programming Guide for details on these options.
 *  @param range        serachRange.
 *
 *  @return Ranges.
 */
- (NSArray <NSValue *> *)ldzf_rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)mask serachRange:(NSRange)range;


/**
 Transform hex string like '0xF181' to unicode '\u{F181}'.
 
 @param hexString The hex string like '0xF181'
 @return The unicode.
 */
+ (NSString *)ldzf_unicodeWithHexString:(NSString *)hexString;



/// 将JSON 字符串转化成序列化对象
- (id)ldzf__JSONValue;

@end
