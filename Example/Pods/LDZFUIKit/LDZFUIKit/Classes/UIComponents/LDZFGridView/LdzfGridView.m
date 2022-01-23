//
//  LdzfGridView.m
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "LdzfGridView.h"

@interface LdzfGridView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView            *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;

@property (nonatomic) CGSize cellSize;
@property (nonatomic) CGSize contentSize;

@end

@implementation LdzfGridView

#pragma mark - Init

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.contentEdgeInsets   = UIEdgeInsetsMake(5, 5, 5, 5);
        self.horizontalGap       = 5.f;
        self.verticalGap         = 5.f;
        self.gridHeight          = 20.f;
        self.horizontalCellCount = 3;
        
        // Init UICollectionViewFlowLayout.
        self.flowLayout                         = [[UICollectionViewFlowLayout alloc] init];
        self.flowLayout.minimumInteritemSpacing = 0;
        
        // Init UICollectionView.
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator   = NO;
        self.collectionView.backgroundColor                = [UIColor clearColor];
        self.collectionView.delegate                       = self;
        self.collectionView.dataSource                     = self;
        [self addSubview:self.collectionView];
    }
    
    return self;
}

- (void)makeTheConfigEffective {
    CGFloat scale = 1.0/([UIScreen mainScreen].scale);
    
    CGFloat width     = self.frame.size.width;
    //实际屏幕宽度算的cell宽度
    CGFloat orignalItemWidth = (width - self.contentEdgeInsets.left -
                         self.contentEdgeInsets.right -
                         _horizontalGap * (_horizontalCellCount - 1)) / (CGFloat)_horizontalCellCount;
    //根据屏幕缩放率算出cell宽度并进行调整
    CGFloat resultItemwidth = floor(orignalItemWidth)+scale;
    if (resultItemwidth<orignalItemWidth) {
        resultItemwidth += scale;
    }
    
    self.collectionView.contentInset        = self.contentEdgeInsets;
    self.flowLayout.minimumLineSpacing      = self.verticalGap;
    self.flowLayout.minimumInteritemSpacing = self.horizontalGap;
    self.flowLayout.itemSize                = CGSizeMake(resultItemwidth, self.gridHeight);
    
    self.cellSize = self.flowLayout.itemSize;
}

#pragma mark - Reload data.

- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    
    [self.collectionView reloadItemsAtIndexPaths:indexPaths];
}

- (void)reloadData {
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionView's delegate & data source.

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _adapters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LdzfGridCellDataAdapter *adapter = _adapters[indexPath.row];
    LdzfGridViewBaseCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:adapter.cellReuseIdentifier forIndexPath:indexPath];
    cell.dataAdapter        = adapter;
    cell.data               = adapter.data;
    cell.indexPath          = indexPath;
    cell.collectionView     = collectionView;
    cell.collectionGridView = self;
    [cell loadContent];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LdzfGridViewBaseCell *cell = (LdzfGridViewBaseCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell selectedEvent];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(LdzfGridView:didSelectedCell:)]) {
        [self.delegate LdzfGridView:self didSelectedCell:cell];
    }
}

#pragma mark - Setter & Getter

- (void)setRegisterCells:(NSArray <LdzfGridViewBaseCellClassType *> *)registerCells {
    
    _registerCells = registerCells;
    
    for (LdzfGridViewBaseCellClassType *type in registerCells) {
        if (type.isNib) {
            [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(type.className) bundle:type.bundleOrNil] forCellWithReuseIdentifier:type.reuseIdentifier];
        } else {
            [self.collectionView registerClass:type.className forCellWithReuseIdentifier:type.reuseIdentifier];
        }
    }
}

- (CGSize)contentSize {
    
    CGSize size = [_flowLayout collectionViewContentSize];
    
    size.width  += self.contentEdgeInsets.left + self.contentEdgeInsets.right;
    size.height += self.contentEdgeInsets.top  + self.contentEdgeInsets.bottom;
    
    return size;
}

- (void)resetSize {
    
    CGRect newFrame = self.frame;
    newFrame.size   = [self contentSize];
    self.frame      = newFrame;
}

@end


@implementation LdzfGridViewBaseCellClassType

@end
