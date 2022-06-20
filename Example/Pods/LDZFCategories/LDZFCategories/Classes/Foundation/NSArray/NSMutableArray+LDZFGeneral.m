
#import "NSMutableArray+LdzfGeneral.h"

@implementation NSMutableArray (LdzfGeneral)

- (void)qnm_removeFirstObject
{ 
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

- (id)qnm_popFirstObject
{
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self qnm_removeFirstObject];
    }
    return obj;
}

- (id)qnm_popLastObject
{
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}

- (void)qnm_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

- (void)qnm_shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}


@end
