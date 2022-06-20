
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (LdzfSafe)
-(void)qnm_addObj:(nullable id)i;

-(void)qnm_addString:(nullable NSString*)i;

-(void)qnm_addBool:(BOOL)i;

-(void)qnm_addInt:(int)i;

-(void)qnm_addInteger:(NSInteger)i;

-(void)qnm_addUnsignedInteger:(NSUInteger)i;

-(void)qnm_addCGFloat:(CGFloat)f;

-(void)qnm_addChar:(char)c;

-(void)qnm_addFloat:(float)i;

-(void)qnm_addPoint:(CGPoint)o;

-(void)qnm_addSize:(CGSize)o;

-(void)qnm_addRect:(CGRect)o;

@end

NS_ASSUME_NONNULL_END
