
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (LdzfGeneral)
 
/// 删除数组中索引值最低的对象。
- (void)ldzf_removeFirstObject;

/// 删除并返回数组中索引值最低的对象。如果数组为空，则仅返回nil。
- (nullable id)ldzf_popFirstObject;

/// 删除并返回数组中索引值最高的对象。如果数组为空，则仅返回nil。
- (nullable id)ldzf_popLastObject;

/// 数组反转
- (void)ldzf_reverse;

/// 随机排序
- (void)ldzf_shuffle;

@end

NS_ASSUME_NONNULL_END
