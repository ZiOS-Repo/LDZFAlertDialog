#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LDZFGeneral)
    
/**
 排序对象是NSIndex的数组
 */
- (NSArray *)ldzf_sortNSIndexArray;

/// 返回数组任意位置对象
- (nullable id)ldzf_randomObject;

@end

NS_ASSUME_NONNULL_END
