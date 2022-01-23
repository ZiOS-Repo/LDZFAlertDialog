//
//  LdzfGridView.h
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import <UIKit/UIKit.h>
#import "LdzfGridViewBaseCell.h"
#import "LdzfGridCellDataAdapter.h"
@class LdzfGridView;
@class LdzfGridViewBaseCellClassType;
#pragma mark - LdzfGridViewDelegate

@protocol LdzfGridViewDelegate <NSObject>

@optional
- (void)LdzfGridView:(LdzfGridView *)gridView didSelectedCell:(LdzfGridViewBaseCell *)cell;

@end


@interface LdzfGridView : UIView

/**
 *  CollectionGridView's delegate.
 */
@property (nonatomic, weak) id <LdzfGridViewDelegate> delegate;

/**
 *  Content edgeInsets, default is UIEdgeInsetsMake(5, 5, 5, 5).
 */
@property (nonatomic) UIEdgeInsets contentEdgeInsets;

/**
 *  Horizontal item's gap, default is 5.f.
 */
@property (nonatomic) CGFloat horizontalGap;

/**
 *  Vertical item's gap, default is 5.f.
 */
@property (nonatomic) CGFloat verticalGap;

/**
 *  Item's height, default is 20.f.
 */
@property (nonatomic) CGFloat gridHeight;

/**
 *  The cell's count at the horizontal direction, default is 3.
 */
@property (nonatomic) NSUInteger horizontalCellCount;

/**
 *  Register the cells.
 */
@property (nonatomic, strong) NSArray <LdzfGridViewBaseCellClassType *> *registerCells;

/**
 *  The cells data adapter.
 */
@property (nonatomic, strong) NSArray <LdzfGridCellDataAdapter *> *adapters;

/**
 *  To make the config effective.
 */
- (void)makeTheConfigEffective;

/**
 *  Reset the view's size.
 */
- (void)resetSize;

/**
 *  Get the cell's size.
 */
@property (nonatomic, readonly) CGSize cellSize;

/**
 *  Get the CollectionView's content size.
 */
@property (nonatomic, readonly) CGSize contentSize;

/**
 *  Reloads just the items at the specified index paths.
 *
 *  @param indexPaths An array of NSIndexPath objects identifying the items you want to update.
 */
- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;

/**
 *  Reload data.
 */
- (void)reloadData;
@end


#pragma mark - CollectionGridViewCellClassType Class

@interface LdzfGridViewBaseCellClassType : NSObject
@property (nonatomic)         Class      className;
@property (nonatomic, strong) NSString  *reuseIdentifier;
@property (nonatomic, assign) BOOL isNib;
@property (nonatomic, strong) NSBundle *bundleOrNil;
@end

NS_INLINE LdzfGridViewBaseCellClassType *LdzfGridViewBaseCellClassTypeCreate(Class className, NSString  *reuseIdentifier,BOOL isNib,NSBundle *bundleOrNil) {
    LdzfGridViewBaseCellClassType *type = [LdzfGridViewBaseCellClassType new];
    type.className                   = className;
    type.reuseIdentifier             = reuseIdentifier;
    type.isNib                       = isNib;
    type.bundleOrNil                 = bundleOrNil;
    return type;
}
