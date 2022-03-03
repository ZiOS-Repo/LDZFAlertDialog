

#import "NSMutableArray+LdzfSafe.h"

@implementation NSMutableArray (LdzfSafe)
 
-(void)ldzf_addObj:(nullable id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)ldzf_addString:(nullable NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)ldzf_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)ldzf_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)ldzf_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)ldzf_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)ldzf_addCGFloat:(CGFloat)f
{
   [self addObject:@(f)];
}
-(void)ldzf_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)ldzf_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)ldzf_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)ldzf_addSize:(CGSize)o
{
   [self addObject:NSStringFromCGSize(o)];
}
-(void)ldzf_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

@end
