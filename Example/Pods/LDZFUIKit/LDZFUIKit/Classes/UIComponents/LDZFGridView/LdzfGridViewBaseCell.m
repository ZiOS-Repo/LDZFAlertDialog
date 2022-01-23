//
//  LdzfGridViewBaseCell.m
//  CRJCollectionGridView
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "LdzfGridViewBaseCell.h"

@implementation LdzfGridViewBaseCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

- (void)selectedEvent {
    
}

+ (LdzfGridCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier data:(id)data type:(NSInteger)type {
    NSString *identifierString = nil;
    reuseIdentifier.length <= 0 ? (identifierString = NSStringFromClass([self class])) : (identifierString = reuseIdentifier);    
    return [LdzfGridCellDataAdapter collectionGridCellDataAdapterWithCellReuseIdentifier:identifierString data:data cellType:type];
}
@end
