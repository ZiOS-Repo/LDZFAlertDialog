//
//  LdzfGridCellDataAdapter.h
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LdzfGridCellDataAdapter : NSObject
@property (nonatomic, strong) id             data;
@property (nonatomic, strong) NSString      *cellReuseIdentifier;
@property (nonatomic, strong) NSIndexPath   *indexPath;
@property (nonatomic)         NSInteger      cellType;

+ (instancetype)collectionGridCellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifier data:(id)data cellType:(NSInteger)cellType;

@end

