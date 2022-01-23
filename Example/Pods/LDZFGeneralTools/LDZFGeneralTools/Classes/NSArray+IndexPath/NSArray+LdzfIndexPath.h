//
//  NSArray+LdzfIndexPath.h
//  CRJGeneralTools_Example
//
//  Created by zhuyuhui on 2020/9/12.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LdzfIndexPath)

- (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsFirstRowFrom:(NSInteger)from section:(NSInteger)section;
- (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsInSection:(NSInteger)section;

@end


@interface NSIndexPath (LdzfIndexPath)

+ (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsWithRange:(NSRange)range section:(NSInteger)section;
+ (NSMutableArray <NSIndexPath *> *)ldzf_indexPathsWithArray:(NSArray *)array section:(NSInteger)section;

@end
