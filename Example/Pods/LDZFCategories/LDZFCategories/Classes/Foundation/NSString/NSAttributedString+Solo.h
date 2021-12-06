
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSAttributedString (Solo)

/**
 *  Get the string's height with the fixed width.
 *
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)solo_heightWithFixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @return String's width.
 */
- (CGFloat)solo_width;

/**
 *  Get the coreText string's width.
 *
 *  @return String's width.
 */
- (CGFloat)solo_coreTextHeightWithFixedWidth:(CGFloat)width;

@end
