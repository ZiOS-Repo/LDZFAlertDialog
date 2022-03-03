//
//  NSDictionary+LdzfGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2022/1/25.
//

#import <Foundation/Foundation.h>
//字典是否为空
#define kfDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || ![dic isKindOfClass:[NSDictionary class]] || dic.allKeys == 0 ? YES:NO)

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (LdzfGeneral)

@end

NS_ASSUME_NONNULL_END
