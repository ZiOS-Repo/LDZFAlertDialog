#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LdzfGeneral)
    
/// 排序对象是NSIndex的数组
- (NSArray *)ldzf_sortNSIndexArray;

/// 返回数组任意位置对象
- (nullable id)ldzf_randomObject;


/// 分割数组
/// @param subSize 子长度
- (NSArray *)ldzf_splitArrayWithSubSize:(NSInteger)subSize;
@end

NS_ASSUME_NONNULL_END

