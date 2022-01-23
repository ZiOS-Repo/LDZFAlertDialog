//
//  UIView+LDZF.m
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import "UIView+LDZF.h"

@implementation UIView (LDZF)

#pragma mark - General
- (UIImage *)ldzf_snapshot
{
    /*
    renderInContext:方式实际上是通过遍历UIView的layer tree进行渲染，但是它不支持动画的渲染，它的的性能会和layer tree的复杂度直接关联
    drawViewHierarchyInRect:afterScreenUpdates:的api是苹果基于UIView的扩展，与第一种方式不同，这种方式是直接获取当前屏幕的“快照”，此种方式的性能与UIView的frame大小直接关联。
    在UIView内容不是很“长”的情况下，第二种方式有内存优势的；但是随着UIView的内容增加，第二种方式会有较大增加；
             第一种(内存)           第二种(内存)       第一种(耗时)        第二种(耗时)
    1~2屏    28.4323M             8.1431M           195.765972ms      271.728992ms
    2~3屏    36.0012M             8.5782M           221.408010ms      280.839980ms
    5屏以上   38.511718M           23.1875M          448.800981ms      565.396011ms
    */
    if ([self isKindOfClass:[UIScrollView class]]) {
        CGRect rect = self.frame;
        rect.size = ((UIScrollView *)self).contentSize;
        
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.layer renderInContext:context];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    } else {
        /*
         * 参数一: 指定将来创建出来的bitmap的大小
         * 参数二: 设置透明YES代表透明，NO代表不透明
         * 参数三: 代表缩放,0代表不缩放
         */
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, [UIScreen mainScreen].scale);
        
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        return image;
    }
}

- (NSData *)ldzf_snapshotPDF
{
    CGRect bounds = self.bounds;
    NSMutableData* data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

- (UIImage *)ldzf_cutoutInViewWithRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.layer.contents = nil;
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(img.CGImage, rect);
    img = [UIImage imageWithCGImage:imageRef];
    return img;
}

- (void)ldzf_addBlurEffectWith:(UIBlurEffectStyle)blurStyle
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:blurStyle];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:effectView];
}

#pragma mark - Draw
/**
 使用CAShapeLayer和UIBezierPath设置圆角，对内存的消耗最少，而且渲染快速
 注意：view的frame必须已知，自动布局调入另一个传入frame方法
 */
- (void)ldzf_addRectCornerWithViewBounds:(CGRect)rect corner:(UIRectCorner)corner radius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = rect;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}
- (void)ldzf_addRectCornerWith:(UIRectCorner)corner radius:(CGFloat)radius
{
    [self ldzf_addRectCornerWithViewBounds:self.bounds corner:corner radius:radius];
}

- (void)ldzf_addAllCornerWith:(CGFloat)radius
{
    [self ldzf_addRectCornerWith:UIRectCornerAllCorners radius:radius];
}
- (void)ldzf_addAllCornerWithViewBounds:(CGRect)rect radius:(CGFloat)radius
{
    [self ldzf_addRectCornerWithViewBounds:rect corner:UIRectCornerAllCorners radius:radius];
}

- (void)ldzf_drawDashLineWithpointArray:(NSArray *)pointArr lineWidth:(float)lineWidth lineLength:(float)lineLength lineSpacing:(float)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为lineColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:lineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线长度，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint point = CGPointFromString(pointArr[0]);
    CGPathMoveToPoint(path, NULL, point.x, point.y);
    
    for (NSInteger i=1; i<pointArr.count; i++) {
        CGPoint point = CGPointFromString(pointArr[i]);
        CGPathAddLineToPoint(path, NULL, point.x, point.y);
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
}
@end
