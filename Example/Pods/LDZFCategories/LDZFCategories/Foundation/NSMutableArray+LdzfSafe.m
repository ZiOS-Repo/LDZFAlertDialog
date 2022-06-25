

#import "NSMutableArray+LdzfSafe.h"

@implementation NSMutableArray (LdzfSafe)
 
-(void)qnm_addObj:(nullable id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)qnm_addString:(nullable NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)qnm_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)qnm_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)qnm_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)qnm_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)qnm_addCGFloat:(CGFloat)f
{
   [self addObject:@(f)];
}
-(void)qnm_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)qnm_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)qnm_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)qnm_addSize:(CGSize)o
{
   [self addObject:NSStringFromCGSize(o)];
}
-(void)qnm_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

@end
