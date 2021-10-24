//
//  IUCommonlyDefine.h
//  IUCommon_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - 系统参数
/// Get main screen's scale.
CGFloat IUScreenScale(void);

/// Get main screen's size. Height is always larger than width.
CGSize IUScreenSize(void);

#define IU_SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define IU_SCREEN_HEIGHT    [[UIScreen mainScreen] bounds].size.height


#pragma mark - 颜色
#define IU_COLOR(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define IU_COLORA(r,g,b,a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define IU_COLORFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//随机色
#define IU_COLOR_RANDOM  [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

/**
 Synthsize a weak or strong reference.
 
 Example:
    @weakify(self)
    [self doSomething^{
        @strongify(self)
        if (!self) return;
        ...
    }];

 */
#ifndef iUweakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define iUweakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define iUweakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define iUweakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define iUweakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef iUstrongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define iUstrongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define iUstrongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define iUstrongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define iUstrongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif



#pragma mark - 非空判断
/// 字符串是否为空
static inline BOOL IUIsBlankString(NSString *aStr){
    if (!aStr) {return YES;}
    if ([aStr isKindOfClass:[NSNull class]]) {return YES;}
    if (![aStr isKindOfClass:[NSString class]]) {return YES;}
    if (!aStr.length) {return YES;}

    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {return YES;}
    return NO;
}
/// 数组是否为空
static inline BOOL IUIsBlankArr(NSArray *arr){
    if (!arr) {return YES;}
    if ([arr isKindOfClass:[NSNull class]]) {return YES;}
    if (![arr isKindOfClass:[NSArray class]]) {return YES;}
    if (!arr.count) {return YES;}
    return NO;
}
/// 字典是否为空
static inline BOOL IUIsBlankDictionary(NSDictionary *dic){
    if (!dic) {return YES;}
    if ([dic isKindOfClass:[NSNull class]]) {return YES;}
    if (![dic isKindOfClass:[NSDictionary class]]) {return YES;}
    if (!dic.count) {return YES;}
    return NO;

}
/// 安全字符串
static inline NSString* IUSafeStr(NSString *str){
    return IUIsBlankString(str) ? @"" : str;
}


#pragma mark - 常用Block定义
typedef void (^IUVoidBlock)(void);
typedef BOOL (^IUBoolBlock)(void);
typedef int  (^IUIntBlock) (void);
typedef id   (^IUIDBlock)  (void);

typedef void (^IUVoidBlock_int)(int);
typedef BOOL (^IUBoolBlock_int)(int);
typedef int  (^IUIntBlock_int) (int);
typedef id   (^IUIDBlock_int)  (int);

typedef void (^IUVoidBlock_string)(NSString *);
typedef BOOL (^IUBoolBlock_string)(NSString *);
typedef int  (^IUIntBlock_string) (NSString *);
typedef id   (^IUIDBlock_string)  (NSString *);

typedef void (^IUVoidBlock_id)(id);
typedef BOOL (^IUBoolBlock_id)(id);
typedef int  (^IUIntBlock_id) (id);
typedef id   (^IUIDBlock_id)  (id);


#pragma mark - 数值计算
/// 角度 转 弧度.
CG_INLINE CGFloat IUDegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

/// 弧度 转 角度.
CG_INLINE CGFloat IURadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}

///  像素对齐的圆点值(round 如果参数是小数，则求本身的四舍五入.)
CG_INLINE CGFloat IUCGFloatPixelRound(CGFloat value) {
    CGFloat scale = IUScreenScale();
    return round(value * scale) / scale;
}

///  像素对齐的地板点值 (floor 如果参数是小数，则求最大的整数但不大于本身.)
CG_INLINE CGFloat IUCGFloatPixelFloor(CGFloat value) {
    CGFloat scale = IUScreenScale();
    return floor(value * scale) / scale;
}

/// round point value for pixel-aligned
CG_INLINE CGSize IUCGSizePixelRound(CGSize size) {
    CGFloat scale = IUScreenScale();
    return CGSizeMake(round(size.width * scale) / scale,
                      round(size.height * scale) / scale);
}

/// floor UIEdgeInset for pixel-aligned
CG_INLINE UIEdgeInsets IUUIEdgeInsetPixelFloor(UIEdgeInsets insets) {
    insets.top = IUCGFloatPixelFloor(insets.top);
    insets.left = IUCGFloatPixelFloor(insets.left);
    insets.bottom = IUCGFloatPixelFloor(insets.bottom);
    insets.right = IUCGFloatPixelFloor(insets.right);
    return insets;
}

/// Get the transform rotation.
/// @return the rotation in radians [-PI,PI] ([-180°,180°])
CG_INLINE CGFloat IUCGAffineTransformGetRotation(CGAffineTransform transform) {
    return atan2(transform.b, transform.a);
}

/// Get the transform's scale.x
CG_INLINE CGFloat IUCGAffineTransformGetScaleX(CGAffineTransform transform) {
    return  sqrt(transform.a * transform.a + transform.c * transform.c);
}

/// Get the transform's scale.y
CG_INLINE CGFloat IUCGAffineTransformGetScaleY(CGAffineTransform transform) {
    return sqrt(transform.b * transform.b + transform.d * transform.d);
}

/// Get the transform's translate.x
CG_INLINE CGFloat IUCGAffineTransformGetTranslateX(CGAffineTransform transform) {
    return transform.tx;
}

/// Get the transform's translate.y
CG_INLINE CGFloat IUCGAffineTransformGetTranslateY(CGAffineTransform transform) {
    return transform.ty;
}


/// Create a skew transform.
CG_INLINE CGAffineTransform IUCGAffineTransformMakeSkew(CGFloat x, CGFloat y){
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

/// Negates/inverts a UIEdgeInsets.
CG_INLINE UIEdgeInsets IUUIEdgeInsetsInvert(UIEdgeInsets insets) {
    return UIEdgeInsetsMake(-insets.top, -insets.left, -insets.bottom, -insets.right);
}


#pragma mark - CGFloat
/// Convert point to pixel.
CG_INLINE CGFloat IUCGFloatToPixel(CGFloat value) {
    return value * IUScreenScale();
}

/// Convert pixel to point.
CG_INLINE CGFloat IUCGFloatFromPixel(CGFloat value) {
    return value / IUScreenScale();
}
/**
 *  某些地方可能会将 CGFLOAT_MIN 作为一个数值参与计算（但其实 CGFLOAT_MIN 更应该被视为一个标志位而不是数值），可能导致一些精度问题，所以提供这个方法快速将 CGFLOAT_MIN 转换为 0
 *  issue: https://github.com/Tencent/QMUI_iOS/issues/203
 */
CG_INLINE CGFloat IUremoveFloatMin(CGFloat floatValue) {
    return floatValue == CGFLOAT_MIN ? 0 : floatValue;
}

/**
 *  基于指定的倍数，对传进来的 floatValue 进行像素取整。若指定倍数为0，则表示以当前设备的屏幕倍数为准。
 *
 *  例如传进来 “2.1”，在 2x 倍数下会返回 2.5（0.5pt 对应 1px），在 3x 倍数下会返回 2.333（0.333pt 对应 1px）。
 */
CG_INLINE CGFloat IUflatSpecificScale(CGFloat floatValue, CGFloat scale) {
    floatValue = IUremoveFloatMin(floatValue);
    scale = scale ?: IUScreenScale();
    CGFloat flattedValue = ceil(floatValue * scale) / scale;
    return flattedValue;
}

/**
 *  基于当前设备的屏幕倍数，对传进来的 floatValue 进行像素取整。
 *
 *  注意如果在 Core Graphic 绘图里使用时，要注意当前画布的倍数是否和设备屏幕倍数一致，若不一致，不可使用 flat() 函数，而应该用 flatSpecificScale
 */
CG_INLINE CGFloat IUflat(CGFloat floatValue) {
    return IUflatSpecificScale(floatValue, 0);
}

/**
 *  类似flat()，只不过 flat 是向上取整，而 floorInPixel 是向下取整
 */
CG_INLINE CGFloat IUfloorInPixel(CGFloat floatValue) {
    floatValue = IUremoveFloatMin(floatValue);
    CGFloat resultValue = floor(floatValue * IUScreenScale()) / IUScreenScale();
    return resultValue;
}

CG_INLINE BOOL IUbetween(CGFloat minimumValue, CGFloat value, CGFloat maximumValue) {
    return minimumValue < value && value < maximumValue;
}

CG_INLINE BOOL IUbetweenOrEqual(CGFloat minimumValue, CGFloat value, CGFloat maximumValue) {
    return minimumValue <= value && value <= maximumValue;
}

/**
 *  调整给定的某个 CGFloat 值的小数点精度，超过精度的部分按四舍五入处理。
 *
 *  例如 CGFloatToFixed(0.3333, 2) 会返回 0.33，而 CGFloatToFixed(0.6666, 2) 会返回 0.67
 *
 *  @warning 参数类型为 CGFloat，也即意味着不管传进来的是 float 还是 double 最终都会被强制转换成 CGFloat 再做计算
 *  @warning 该方法无法解决浮点数精度运算的问题
 */
CG_INLINE CGFloat IUCGFloatToFixed(CGFloat value, NSUInteger precision) {
    NSString *formatString = [NSString stringWithFormat:@"%%.%@f", @(precision)];
    NSString *toString = [NSString stringWithFormat:formatString, value];
    #if CGFLOAT_IS_DOUBLE
    CGFloat result = [toString doubleValue];
    #else
    CGFloat result = [toString floatValue];
    #endif
    return result;
}

/// 用于居中运算
CG_INLINE CGFloat IUCGFloatGetCenter(CGFloat parent, CGFloat child) {
    return IUflat((parent - child) / 2.0);
}

/// 检测某个数值如果为 NaN 则将其转换为 0，避免布局中出现 crash
CG_INLINE CGFloat IUCGFloatSafeValue(CGFloat value) {
    return isnan(value) ? 0 : value;
}

#pragma mark - CGPoint

/// 两个point相加
CG_INLINE CGPoint IUCGPointUnion(CGPoint point1, CGPoint point2) {
    return CGPointMake(IUflat(point1.x + point2.x), IUflat(point1.y + point2.y));
}

/// 获取rect的center，包括rect本身的x/y偏移
CG_INLINE CGPoint IUCGPointGetCenterWithRect(CGRect rect) {
    return CGPointMake(IUflat(CGRectGetMidX(rect)), IUflat(CGRectGetMidY(rect)));
}

CG_INLINE CGPoint IUCGPointGetCenterWithSize(CGSize size) {
    return CGPointMake(IUflat(size.width / 2.0), IUflat(size.height / 2.0));
}

CG_INLINE CGPoint IUCGPointToFixed(CGPoint point, NSUInteger precision) {
    CGPoint result = CGPointMake(IUCGFloatToFixed(point.x, precision), IUCGFloatToFixed(point.y, precision));
    return result;
}

CG_INLINE CGPoint IUCGPointRemoveFloatMin(CGPoint point) {
    CGPoint result = CGPointMake(IUremoveFloatMin(point.x), IUremoveFloatMin(point.y));
    return result;
}

#pragma mark - UIEdgeInsets

/// 获取UIEdgeInsets在水平方向上的值
CG_INLINE CGFloat IUUIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

/// 获取UIEdgeInsets在垂直方向上的值
CG_INLINE CGFloat IUUIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

/// 将两个UIEdgeInsets合并为一个
CG_INLINE UIEdgeInsets IUUIEdgeInsetsConcat(UIEdgeInsets insets1, UIEdgeInsets insets2) {
    insets1.top += insets2.top;
    insets1.left += insets2.left;
    insets1.bottom += insets2.bottom;
    insets1.right += insets2.right;
    return insets1;
}

CG_INLINE UIEdgeInsets IUUIEdgeInsetsSetTop(UIEdgeInsets insets, CGFloat top) {
    insets.top = IUflat(top);
    return insets;
}

CG_INLINE UIEdgeInsets IUUIEdgeInsetsSetLeft(UIEdgeInsets insets, CGFloat left) {
    insets.left = IUflat(left);
    return insets;
}
CG_INLINE UIEdgeInsets IUUIEdgeInsetsSetBottom(UIEdgeInsets insets, CGFloat bottom) {
    insets.bottom = IUflat(bottom);
    return insets;
}

CG_INLINE UIEdgeInsets IUUIEdgeInsetsSetRight(UIEdgeInsets insets, CGFloat right) {
    insets.right = IUflat(right);
    return insets;
}

CG_INLINE UIEdgeInsets IUUIEdgeInsetsToFixed(UIEdgeInsets insets, NSUInteger precision) {
    UIEdgeInsets result = UIEdgeInsetsMake(IUCGFloatToFixed(insets.top, precision), IUCGFloatToFixed(insets.left, precision), IUCGFloatToFixed(insets.bottom, precision), IUCGFloatToFixed(insets.right, precision));
    return result;
}

CG_INLINE UIEdgeInsets IUUIEdgeInsetsRemoveFloatMin(UIEdgeInsets insets) {
    UIEdgeInsets result = UIEdgeInsetsMake(IUremoveFloatMin(insets.top), IUremoveFloatMin(insets.left), IUremoveFloatMin(insets.bottom), IUremoveFloatMin(insets.right));
    return result;
}

#pragma mark - CGSize

/// 判断一个 CGSize 是否存在 NaN
CG_INLINE BOOL IUCGSizeIsNaN(CGSize size) {
    return isnan(size.width) || isnan(size.height);
}

/// 判断一个 CGSize 是否存在 infinite
CG_INLINE BOOL IUCGSizeIsInf(CGSize size) {
    return isinf(size.width) || isinf(size.height);
}

/// 判断一个 CGSize 是否为空（宽或高为0）
CG_INLINE BOOL IUCGSizeIsEmpty(CGSize size) {
    return size.width <= 0 || size.height <= 0;
}

/// 判断一个 CGSize 是否合法（例如不带无穷大的值、不带非法数字）
CG_INLINE BOOL IUCGSizeIsValidated(CGSize size) {
    return !IUCGSizeIsEmpty(size) && !IUCGSizeIsInf(size) && !IUCGSizeIsNaN(size);
}

/// 将一个 CGSize 像素对齐
CG_INLINE CGSize IUCGSizeFlatted(CGSize size) {
    return CGSizeMake(IUflat(size.width), IUflat(size.height));
}

/// 将一个 CGSize 以 pt 为单位向上取整
CG_INLINE CGSize IUCGSizeCeil(CGSize size) {
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

/// 将一个 CGSize 以 pt 为单位向下取整
CG_INLINE CGSize IUCGSizeFloor(CGSize size) {
    return CGSizeMake(floor(size.width), floor(size.height));
}

CG_INLINE CGSize IUCGSizeToFixed(CGSize size, NSUInteger precision) {
    CGSize result = CGSizeMake(IUCGFloatToFixed(size.width, precision), IUCGFloatToFixed(size.height, precision));
    return result;
}

CG_INLINE CGSize IUCGSizeRemoveFloatMin(CGSize size) {
    CGSize result = CGSizeMake(IUremoveFloatMin(size.width), IUremoveFloatMin(size.height));
    return result;
}

CG_INLINE CGSize IUCGSizeScale(CGSize size, CGFloat scale) {
    return CGSizeMake(size.width * scale, size.height * scale);
}
#pragma mark - CGRect

/// 判断一个 CGRect 是否存在 NaN
CG_INLINE BOOL IUCGRectIsNaN(CGRect rect) {
    return isnan(rect.origin.x) || isnan(rect.origin.y) || isnan(rect.size.width) || isnan(rect.size.height);
}

/// 系统提供的 CGRectIsInfinite 接口只能判断 CGRectInfinite 的情况，而该接口可以用于判断 INFINITY 的值
CG_INLINE BOOL IUCGRectIsInf(CGRect rect) {
    return isinf(rect.origin.x) || isinf(rect.origin.y) || isinf(rect.size.width) || isinf(rect.size.height);
}

/// 判断一个 CGRect 是否合法（例如不带无穷大的值、不带非法数字）
CG_INLINE BOOL IUCGRectIsValidated(CGRect rect) {
    return !CGRectIsNull(rect) && !CGRectIsInfinite(rect) && !IUCGRectIsNaN(rect) && !IUCGRectIsInf(rect);
}

/// 检测某个 CGRect 如果存在数值为 NaN 的则将其转换为 0，避免布局中出现 crash
CG_INLINE CGRect IUCGRectSafeValue(CGRect rect) {
    return CGRectMake(IUCGFloatSafeValue(CGRectGetMinX(rect)), IUCGFloatSafeValue(CGRectGetMinY(rect)), IUCGFloatSafeValue(CGRectGetWidth(rect)), IUCGFloatSafeValue(CGRectGetHeight(rect)));
}

/// 创建一个像素对齐的CGRect
CG_INLINE CGRect IUCGRectFlatMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectMake(IUflat(x), IUflat(y), IUflat(width), IUflat(height));
}

/// 对CGRect的x/y、width/height都调用一次flat，以保证像素对齐
CG_INLINE CGRect IUCGRectFlatted(CGRect rect) {
    return CGRectMake(IUflat(rect.origin.x), IUflat(rect.origin.y), IUflat(rect.size.width), IUflat(rect.size.height));
}

/// 计算目标点 targetPoint 围绕坐标点 coordinatePoint 通过 transform 之后此点的坐标
CG_INLINE CGPoint IUCGPointApplyAffineTransformWithCoordinatePoint(CGPoint coordinatePoint, CGPoint targetPoint, CGAffineTransform t) {
    CGPoint p;
    p.x = (targetPoint.x - coordinatePoint.x) * t.a + (targetPoint.y - coordinatePoint.y) * t.c + coordinatePoint.x;
    p.y = (targetPoint.x - coordinatePoint.x) * t.b + (targetPoint.y - coordinatePoint.y) * t.d + coordinatePoint.y;
    p.x += t.tx;
    p.y += t.ty;
    return p;
}


/// 为一个CGRect叠加scale计算
CG_INLINE CGRect IUCGRectApplyScale(CGRect rect, CGFloat scale) {
    return IUCGRectFlatted(CGRectMake(CGRectGetMinX(rect) * scale, CGRectGetMinY(rect) * scale, CGRectGetWidth(rect) * scale, CGRectGetHeight(rect) * scale));
}

/// 计算view的水平居中，传入父view和子view的frame，返回子view在水平居中时的x值
CG_INLINE CGFloat IUCGRectGetMinXHorizontallyCenterInParentRect(CGRect parentRect, CGRect childRect) {
    return IUflat((CGRectGetWidth(parentRect) - CGRectGetWidth(childRect)) / 2.0);
}

/// 计算view的垂直居中，传入父view和子view的frame，返回子view在垂直居中时的y值
CG_INLINE CGFloat IUCGRectGetMinYVerticallyCenterInParentRect(CGRect parentRect, CGRect childRect) {
    return IUflat((CGRectGetHeight(parentRect) - CGRectGetHeight(childRect)) / 2.0);
}

/// 返回值：同一个坐标系内，想要layoutingRect和已布局完成的referenceRect保持垂直居中时，layoutingRect的originY
CG_INLINE CGFloat IUCGRectGetMinYVerticallyCenter(CGRect referenceRect, CGRect layoutingRect) {
    return CGRectGetMinY(referenceRect) + IUCGRectGetMinYVerticallyCenterInParentRect(referenceRect, layoutingRect);
}

/// 返回值：同一个坐标系内，想要layoutingRect和已布局完成的referenceRect保持水平居中时，layoutingRect的originX
CG_INLINE CGFloat IUCGRectGetMinXHorizontallyCenter(CGRect referenceRect, CGRect layoutingRect) {
    return CGRectGetMinX(referenceRect) + IUCGRectGetMinXHorizontallyCenterInParentRect(referenceRect, layoutingRect);
}

/// 为给定的rect往内部缩小insets的大小
CG_INLINE CGRect IUCGRectInsetEdges(CGRect rect, UIEdgeInsets insets) {
    rect.origin.x += insets.left;
    rect.origin.y += insets.top;
    rect.size.width -= IUUIEdgeInsetsGetHorizontalValue(insets);
    rect.size.height -= IUUIEdgeInsetsGetVerticalValue(insets);
    return rect;
}

/// 传入size，返回一个x/y为0的CGRect
CG_INLINE CGRect IUCGRectMakeWithSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

CG_INLINE CGRect IUCGRectFloatTop(CGRect rect, CGFloat top) {
    rect.origin.y = top;
    return rect;
}

CG_INLINE CGRect IUCGRectFloatBottom(CGRect rect, CGFloat bottom) {
    rect.origin.y = bottom - CGRectGetHeight(rect);
    return rect;
}

CG_INLINE CGRect IUCGRectFloatRight(CGRect rect, CGFloat right) {
    rect.origin.x = right - CGRectGetWidth(rect);
    return rect;
}

CG_INLINE CGRect IUCGRectFloatLeft(CGRect rect, CGFloat left) {
    rect.origin.x = left;
    return rect;
}

/// 保持rect的左边缘不变，改变其宽度，使右边缘靠在right上
CG_INLINE CGRect IUCGRectLimitRight(CGRect rect, CGFloat rightLimit) {
    rect.size.width = rightLimit - rect.origin.x;
    return rect;
}

/// 保持rect右边缘不变，改变其宽度和origin.x，使其左边缘靠在left上。只适合那种右边缘不动的view
/// 先改变origin.x，让其靠在offset上
/// 再改变size.width，减少同样的宽度，以抵消改变origin.x带来的view移动，从而保证view的右边缘是不动的
CG_INLINE CGRect IUCGRectLimitLeft(CGRect rect, CGFloat leftLimit) {
    CGFloat subOffset = leftLimit - rect.origin.x;
    rect.origin.x = leftLimit;
    rect.size.width = rect.size.width - subOffset;
    return rect;
}

/// 限制rect的宽度，超过最大宽度则截断，否则保持rect的宽度不变
CG_INLINE CGRect IUCGRectLimitMaxWidth(CGRect rect, CGFloat maxWidth) {
    CGFloat width = CGRectGetWidth(rect);
    rect.size.width = width > maxWidth ? maxWidth : width;
    return rect;
}

CG_INLINE CGRect IUCGRectSetX(CGRect rect, CGFloat x) {
    rect.origin.x = IUflat(x);
    return rect;
}

CG_INLINE CGRect IUCGRectSetY(CGRect rect, CGFloat y) {
    rect.origin.y = IUflat(y);
    return rect;
}

CG_INLINE CGRect IUCGRectSetXY(CGRect rect, CGFloat x, CGFloat y) {
    rect.origin.x = IUflat(x);
    rect.origin.y = IUflat(y);
    return rect;
}

CG_INLINE CGRect IUCGRectSetWidth(CGRect rect, CGFloat width) {
    if (width < 0) {
        return rect;
    }
    rect.size.width = IUflat(width);
    return rect;
}

CG_INLINE CGRect IUCGRectSetHeight(CGRect rect, CGFloat height) {
    if (height < 0) {
        return rect;
    }
    rect.size.height = IUflat(height);
    return rect;
}

CG_INLINE CGRect IUCGRectSetSize(CGRect rect, CGSize size) {
    rect.size = IUCGSizeFlatted(size);
    return rect;
}

CG_INLINE CGRect IUCGRectToFixed(CGRect rect, NSUInteger precision) {
    CGRect result = CGRectMake(IUCGFloatToFixed(CGRectGetMinX(rect), precision),
                               IUCGFloatToFixed(CGRectGetMinY(rect), precision),
                               IUCGFloatToFixed(CGRectGetWidth(rect), precision),
                               IUCGFloatToFixed(CGRectGetHeight(rect), precision));
    return result;
}

CG_INLINE CGRect IUCGRectRemoveFloatMin(CGRect rect) {
    CGRect result = CGRectMake(IUremoveFloatMin(CGRectGetMinX(rect)),
                               IUremoveFloatMin(CGRectGetMinY(rect)),
                               IUremoveFloatMin(CGRectGetWidth(rect)),
                               IUremoveFloatMin(CGRectGetHeight(rect)));
    return result;
}

/// outerRange 是否包含了 innerRange
CG_INLINE BOOL IUNSContainingRanges(NSRange outerRange, NSRange innerRange) {
    if (innerRange.location >= outerRange.location && outerRange.location + outerRange.length >= innerRange.location + innerRange.length) {
        return YES;
    }
    return NO;
}
