
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (LdzfSafe)
-(void)ldzf_addObj:(nullable id)i;

-(void)ldzf_addString:(nullable NSString*)i;

-(void)ldzf_addBool:(BOOL)i;

-(void)ldzf_addInt:(int)i;

-(void)ldzf_addInteger:(NSInteger)i;

-(void)ldzf_addUnsignedInteger:(NSUInteger)i;

-(void)ldzf_addCGFloat:(CGFloat)f;

-(void)ldzf_addChar:(char)c;

-(void)ldzf_addFloat:(float)i;

-(void)ldzf_addPoint:(CGPoint)o;

-(void)ldzf_addSize:(CGSize)o;

-(void)ldzf_addRect:(CGRect)o;

@end

NS_ASSUME_NONNULL_END
