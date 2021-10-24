
#import <UIKit/UIKit.h>

@interface UIView (ConvenientMethod)

/**
 *  Create Line view.
 *
 *  @param frame Frame
 *  @param color Color
 *
 *  @return Line View.
 */
+ (UIView *)lineViewWithFrame:(CGRect)frame color:(UIColor *)color;

/**
 *  Create Line view.
 *
 *  @param frame Frame
 *  @param color Color
 *  @param tag   Tag
 *
 *  @return Line View.
 */
+ (UIView *)lineViewWithFrame:(CGRect)frame color:(UIColor *)color tag:(NSInteger)tag;


/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)removeAllSubviews;

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

@end
