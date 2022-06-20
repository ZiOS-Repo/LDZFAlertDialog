#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LdzfGeneral)
    
/// 排序对象是NSIndex的数组
- (NSArray *)qnm_sortNSIndexArray;

/// 返回数组任意位置对象
- (nullable id)qnm_randomObject;


/// 分割数组
/// @param subSize 子长度
- (NSArray *)qnm_splitArrayWithSubSize:(NSInteger)subSize;
@end

NS_ASSUME_NONNULL_END

