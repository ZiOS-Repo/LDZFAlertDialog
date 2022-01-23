//
//  LdzfGridViewBaseCell.h
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import <UIKit/UIKit.h>
#import "LdzfGridCellDataAdapter.h"
@class LdzfGridView;

@interface LdzfGridViewBaseCell : UICollectionViewCell

@property (nonatomic, strong) id data;
@property (nonatomic, strong) LdzfGridCellDataAdapter *dataAdapter;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) LdzfGridView *collectionGridView;

#pragma mark - Method you should overwrite.

/**
 *  Setup cell, override by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, override by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, override by subclass.
 */
- (void)loadContent;

/**
 *  Selected event, override by subclass.
 */
- (void)selectedEvent;

#pragma mark - Constructor.

+ (LdzfGridCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier data:(id)data type:(NSInteger)type;

@end

