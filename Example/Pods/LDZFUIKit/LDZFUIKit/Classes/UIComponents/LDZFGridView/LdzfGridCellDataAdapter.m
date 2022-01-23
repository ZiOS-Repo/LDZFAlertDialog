//
//  LdzfGridCellDataAdapter.m
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "LdzfGridCellDataAdapter.h"

@implementation LdzfGridCellDataAdapter
+ (instancetype)collectionGridCellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifier data:(id)data cellType:(NSInteger)cellType {
    LdzfGridCellDataAdapter *adapter = [[self class] new];
    adapter.cellReuseIdentifier            = cellReuseIdentifier;
    adapter.data                           = data;
    adapter.cellType                       = cellType;
    
    return adapter;
}

@end
