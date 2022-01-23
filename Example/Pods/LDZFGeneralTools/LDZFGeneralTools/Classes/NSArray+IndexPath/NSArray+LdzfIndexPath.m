//
//  NSArray+LdzfIndexPath.m
//  CRJGeneralTools_Example
//
//  Created by zhuyuhui on 2020/9/12.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "NSArray+LdzfIndexPath.h"

@implementation NSArray (LdzfIndexPath)
- (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsFirstRowFrom:(NSInteger)from section:(NSInteger)section {
    
    NSMutableArray *array = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [array addObject:[NSIndexPath indexPathForRow:idx + from inSection:section]];
    }];
    
    return array;
}

- (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsInSection:(NSInteger)section {
    
    return [self ldzf_indexPathsFirstRowFrom:0 section:section];
}

@end

@implementation NSIndexPath (LdzfIndexPath)

+ (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsWithRange:(NSRange)range section:(NSInteger)section {
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = range.location; i < range.length; i++) {
        
        [array addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    return array;
}

+ (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsWithArray:(NSArray *)array section:(NSInteger)section {
    
    NSRange range = NSMakeRange(0, array.count);
    return [self ldzf_indexPathsWithRange:range section:section];
}

@end
