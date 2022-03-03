#import <Foundation/Foundation.h>


//数组是否为空
#define kfArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || ![array isKindOfClass:[NSArray class]] || array.count == 0)

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LdzfGeneral)
    
/// 排序对象是NSIndex的数组
- (NSArray *)ldzf_sortNSIndexArray;

/// 返回数组任意位置对象
- (nullable id)ldzf_randomObject;

@end

NS_ASSUME_NONNULL_END

