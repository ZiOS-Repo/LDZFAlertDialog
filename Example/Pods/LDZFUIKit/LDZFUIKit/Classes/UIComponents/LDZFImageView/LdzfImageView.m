//
//  LdzfImageView.m
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "LdzfImageView.h"

@interface LdzfImageView ()

@property (nonatomic, strong) UIImageView *placeHoderImageView;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) NSString    *pUrlString;

@property (nonatomic, strong) CAShapeLayer *bgLayer;

@end

@implementation LdzfImageView

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.placeHoderImageView.frame = self.bounds;
    self.contentImageView.frame    = self.bounds;
    [self updatePath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self buildSubviews];
        [self buildBgLayer];
    }
    
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
    
        [self buildSubviews];
        [self buildBgLayer];
    }
    
    return self;
}

- (void)buildSubviews {
    
    self.layer.masksToBounds = YES;
    
    self.placeHoderImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.contentImageView    = [[UIImageView alloc] initWithFrame:self.bounds];
    
    [self addSubview:self.placeHoderImageView];
    [self addSubview:self.contentImageView];
    
    self.contentImageContentMode     = UIViewContentModeScaleAspectFill;
    self.placeholderImageContentMode = UIViewContentModeScaleAspectFill;
}

- (void)buildBgLayer {
    
    self.rectCorner  = UIRectCornerAllCorners;
    self.cornerRadii = CGSizeZero;
    
    self.bgLayer = [[CAShapeLayer alloc] init];
    [self updatePath];
    
    self.layer.mask = self.bgLayer;
}

- (void)updatePath {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCorner cornerRadii:self.cornerRadii];
    self.bgLayer.frame = self.bounds;
    self.bgLayer.path  = maskPath.CGPath;
}


#pragma mark - Setter & Getter.

- (void)setPlaceholderImage:(UIImage *)placeholderImage {
    
    _placeHoderImageView.image = placeholderImage;
}

- (UIImage *)placeholderImage {
    
    return _placeHoderImageView.image;
}

- (void)setUrlString:(NSString *)urlString {
    
    _pUrlString             = urlString;
    _contentImageView.alpha = 0.f;
    
    NSURL *url = [NSURL URLWithString:urlString];
    [_contentImageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        if (image) {
            self->_contentImageView.image = image;
            if (cacheType == SDImageCacheTypeNone || cacheType == SDImageCacheTypeDisk) {
                
                [UIView animateWithDuration:0.5f animations:^{
                    
                    self->_contentImageView.alpha = 1.f;
                }];
                
            } else {
            
                self->_contentImageView.alpha = 1.f;
            }
        }
    }];
}

- (NSString *)urlString {

    return _pUrlString;
}

- (void)setPlaceholderImageContentMode:(UIViewContentMode)placeholderImageContentMode {

    _placeHoderImageView.contentMode = placeholderImageContentMode;
}

- (UIViewContentMode)placeholderImageContentMode {

    return _placeHoderImageView.contentMode;
}

- (void)setContentImageContentMode:(UIViewContentMode)contentImageContentMode {

    _contentImageView.contentMode = contentImageContentMode;
    
}

- (UIViewContentMode)contentImageContentMode {

    return _contentImageView.contentMode;
}

- (void)setRectCorner:(UIRectCorner)rectCorner {
    
    _rectCorner = rectCorner;
    
    [self updatePath];
}

- (void)setCornerRadii:(CGSize)cornerRadii {
    
    _cornerRadii = cornerRadii;
    
    [self updatePath];
}

@end

