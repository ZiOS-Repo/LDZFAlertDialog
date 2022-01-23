//
//  LdzfFile.m
//  CRJGeneralTools_Example
//
//  Created by zhuyuhui on 2020/9/12.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "LdzfFile.h"

@implementation LdzfFile

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.subFiles = [NSMutableArray array];
    }
    
    return self;
}

- (NSArray <LdzfFile *> *)allFiles {
    
    NSMutableArray *subFiles = [NSMutableArray array];
    
    [self rootFile:self array:subFiles];
    
    return subFiles;
}

- (void)rootFile:(LdzfFile *)file array:(NSMutableArray *)array {
    
    for (LdzfFile *subFile in file.subFiles) {
        
        [array addObject:subFile];
        
        if (subFile.isDirectory) {
            
            [self rootFile:subFile array:array];
        }
    }
}

- (NSString *)description {

    return [NSString stringWithFormat:@"<%@ : %p> isDirectory[%@] isHiden[%@] %@",
            [self class],
            self,
            (_isDirectory == YES ? @"Y" : @"N"),
            (_isHiden == YES ? @"Y" : @"N"),
            _fileName];
}

@end
