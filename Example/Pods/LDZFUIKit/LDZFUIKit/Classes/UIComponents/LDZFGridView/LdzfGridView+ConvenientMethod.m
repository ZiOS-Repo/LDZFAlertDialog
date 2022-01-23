//
//  LdzfGridView+ConvenientMethod.m
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "LdzfGridView+ConvenientMethod.h"

@implementation LdzfGridView (ConvenientMethod)
+ (instancetype)collectionGridViewWithFixedWidth:(CGFloat)width
  contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
      horizontalGap:(CGFloat)horizontalGap
        verticalGap:(CGFloat)verticalGap
         gridHeight:(CGFloat)gridHeight
horizontalCellCount:(NSInteger)horizontalCellCount
      registerCells:(NSArray<LdzfGridViewBaseCellClassType *> *)registerCells
           adapters:(NSArray<LdzfGridCellDataAdapter *> *)adapters
           delegate:(id<LdzfGridViewDelegate>)delegate
{
    LdzfGridView *gridView = [[LdzfGridView alloc] initWithFrame:CGRectMake(0, 0, width, 10)];
    gridView.contentEdgeInsets   = contentEdgeInsets;
    gridView.horizontalGap       = horizontalGap;
    gridView.verticalGap         = verticalGap;
    gridView.gridHeight          = gridHeight;
    gridView.horizontalCellCount = horizontalCellCount;
    gridView.registerCells       = registerCells;
    gridView.adapters            = adapters;
    gridView.delegate            = delegate;
    [gridView makeTheConfigEffective];
    [gridView reloadData];
    [gridView resetSize];
    return gridView;
}
@end
