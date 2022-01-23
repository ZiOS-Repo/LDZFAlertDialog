//
//  LdzfGridView+ConvenientMethod.h
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "LdzfGridView.h"

@interface LdzfGridView (ConvenientMethod)

/**
 *  Create CollectionGridView.
 *
 *  @param width               The fixed width.
 *  @param contentEdgeInsets   Content edgeInsets.
 *  @param horizontalGap       horizontal gap.
 *  @param verticalGap         Vertical gap.
 *  @param gridHeight          Grid height.
 *  @param horizontalCellCount Horizontal cell's count.
 *  @param registerCells       Register cells.
 *  @param adapters            Adapters.
 *  @param delegate            CollectionGridView's delegate.
 *
 *  @return CollectionGridView.
 */
+ (instancetype)collectionGridViewWithFixedWidth:(CGFloat)width
                   contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                       horizontalGap:(CGFloat)horizontalGap
                         verticalGap:(CGFloat)verticalGap
                          gridHeight:(CGFloat)gridHeight
                 horizontalCellCount:(NSInteger)horizontalCellCount
                       registerCells:(NSArray <LdzfGridViewBaseCellClassType *>*)registerCells
                            adapters:(NSArray <LdzfGridCellDataAdapter *> *)adapters
                            delegate:(id <LdzfGridViewDelegate>)delegate;
@end

