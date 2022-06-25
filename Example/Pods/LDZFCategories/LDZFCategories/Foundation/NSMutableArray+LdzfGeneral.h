
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (LdzfGeneral)
 
/// 删除数组中索引值最低的对象。
- (void)qnm_removeFirstObject;

/// 删除并返回数组中索引值最低的对象。如果数组为空，则仅返回nil。
- (nullable id)qnm_popFirstObject;

/// 删除并返回数组中索引值最高的对象。如果数组为空，则仅返回nil。
- (nullable id)qnm_popLastObject;

/// 数组反转
- (void)qnm_reverse;

/// 随机排序
- (void)qnm_shuffle;

@end

NS_ASSUME_NONNULL_END
