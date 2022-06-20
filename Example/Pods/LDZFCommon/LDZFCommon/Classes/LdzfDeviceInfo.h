//
//  LdzfDeviceInfo.h
//  LDZFCommon
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LdzfDeviceInfo : NSObject

+ (BOOL)isIPad;
+ (BOOL)isIPod;
+ (BOOL)isIPhone;
+ (BOOL)isSimulator;

/// 带物理凹槽的刘海屏或者使用 Home Indicator 类型的设备
+ (BOOL)isNotchedScreen;

/// 将屏幕分为普通和紧凑两种，这个方法用于判断普通屏幕
+ (BOOL)isRegularScreen;

/// iPhone XS Max / 11 Pro Max
+ (BOOL)is65InchScreen;

/// iPhone XR / 11
+ (BOOL)is61InchScreen;

/// iPhone X / XS / 11Pro
+ (BOOL)is58InchScreen;

/// iPhone 8 Plus
+ (BOOL)is55InchScreen;

/// iPhone 8
+ (BOOL)is47InchScreen;

/// iPhone 5
+ (BOOL)is40InchScreen;

/// iPhone 4
+ (BOOL)is35InchScreen;

+ (CGSize)screenSizeFor65Inch;
+ (CGSize)screenSizeFor61Inch;
+ (CGSize)screenSizeFor58Inch;
+ (CGSize)screenSizeFor55Inch;
+ (CGSize)screenSizeFor47Inch;
+ (CGSize)screenSizeFor40Inch;
+ (CGSize)screenSizeFor35Inch;

// 用于获取 isNotchedScreen 设备的 insets，注意对于 iPad Pro 11-inch 这种无刘海凹槽但却有使用 Home Indicator 的设备，它的 top 返回0，bottom 返回 safeAreaInsets.bottom 的值
+ (UIEdgeInsets)safeAreaInsetsForDeviceWithNotch;

/// 判断当前设备是否高性能设备，只会判断一次，以后都直接读取结果，所以没有性能问题
+ (BOOL)isHighPerformanceDevice;

/// 系统设置里是否开启了“放大显示-试图-放大”，支持放大模式的 iPhone 设备可在官方文档中查询 https://support.apple.com/zh-cn/guide/iphone/iphd6804774e/ios
+ (BOOL)isZoomedMode;



#pragma mark - 系统信息
+ (NSInteger)numbericOSVersion;
+ (NSComparisonResult)compareSystemVersion:(nonnull NSString *)currentVersion toVersion:(nonnull NSString *)targetVersion;
+ (BOOL)isCurrentSystemAtLeastVersion:(nonnull NSString *)targetVersion;
+ (BOOL)isCurrentSystemLowerThanVersion:(nonnull NSString *)targetVersion;


#pragma mark - 设备信息
/// 如 iPhone12,5、iPad6,8
+ (NSString *)deviceModel;

/// 如 iPhone 11 Pro Max、iPad Pro (12.9 inch)
+ (NSString *)deviceName;

/// 获取 通用 - 关于本机 - 名称
+ (NSString *)getDeviceUserName;

/// 获取系统名称 - iOS
+ (NSString *)getDeviceSystemName;

/// 获取设备系统版本 - 13.3/12.0
+ (NSString *)getDeviceSystemVersion;

/// 获取设备电量 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown
+ (CGFloat)getDeviceBattery;

/// 获取手机本地语言 zh-Hans-CN/en
+ (NSString *)getCurrentLocalLanguage;

#pragma mark - 设备标识
/// 获取IDFA
+ (NSString *)getIDFA;

/// 获取IDFV
+ (NSString *)getIDFV;

/// 获取UUID
+ (NSString *)getUUID;
#pragma mark - 磁盘空间

/// 获取当前设备磁盘总容量(单位：MB）
+ (double)getDiskSpaceTotal;

/// 获取当前设备磁盘剩余容量(单位：MB）
+ (double)getDiskSpaceFree;

/// 获取当前设备磁盘使用容量(单位：MB）
+ (double)getDiskSpaceUsed;

#pragma mark - 内存信息
/// 获取当前设备全部系统内存(单位：MB）
+ (double)memoryTotal;
/// 获取当前设备使用系统内存(单位：MB）
+ (double)memoryUsed;
/// 获取当前设备剩余系统内存(单位：MB）
+ (double)memoryFree;
/// 当前线程占用内存（字节为单位）,（发生错误时为-1）
+ (int64_t)currentThreadMemoryUsage;

#pragma mark - CPU信息
/// cpu数量
+ (NSUInteger)cpuCount;
/// 当前线程CPU使用率，1.0表示100％。 （发生错误时为-1）
+ (float)currentThreadCpuUsage;
/// 当前每个处理器的CPU使用率（NSNumber数组），1.0表示100％。 （发生错误时为零）
+ (NSArray <NSNumber *> *)cpuUsagePerProcessor;
/// cpu使用率
+ (float)cpuUsage;
@end






#pragma mark - 其他分类
@interface NSObject (QMUI)
/**
 *  调用一个无参数、返回值类型为非对象的 selector。如果返回值类型为对象，请直接使用系统的 performSelector: 方法。
 *  @param selector 要被调用的方法名
 *  @param returnValue selector 的返回值的指针地址，请先定义一个变量再将其指针地址传进来，例如 &result
 *
 *  @code
 *  CGFloat alpha;
 *  [view qmui_performSelector:@selector(alpha) withPrimitiveReturnValue:&alpha];
 *  @endcode
 */
- (void)qmui_performSelector:(SEL)selector withPrimitiveReturnValue:(nullable void *)returnValue;

@end


@interface NSString (QMUI)

/**
 用正则表达式匹配字符串，将匹配到的第一个结果返回，大小写不敏感

 @param pattern 正则表达式
 @return 匹配到的第一个结果，如果没有匹配成功则返回 nil
 */
- (NSString *)qmui_stringMatchedByPattern:(NSString *)pattern;

@end


NS_ASSUME_NONNULL_END
