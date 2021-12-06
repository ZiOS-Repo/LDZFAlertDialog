//
//  UIDevice+SoloGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (SoloGeneral)

#pragma mark - 设备信息
/// 获取 通用 - 关于本机 - 名称
+ (NSString *)solo_getDeviceUserName;

/// 获取设备类型 - iPhone/iTouch/iPad
+ (NSString *)solo_getDeviceModel;

/// 获取系统名称 - iOS
+ (NSString *)solo_getDeviceSystemName;

/// 获取设备系统版本 - 13.3/12.0
+ (NSString *)solo_getDeviceSystemVersion;

/// 获取设备电量 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown
+ (CGFloat)solo_getDeviceBattery;

/// 获取手机本地语言 zh-Hans-CN/en
+ (NSString *)solo_getCurrentLocalLanguage;

/// 获取设备名称，例：iPhone 11 Pro Max
+ (NSString *)solo_deviceName;
#pragma mark - 设备标识
/// 获取IDFA
+ (NSString *)solo_getIDFA;

/// 获取IDFV
+ (NSString *)solo_getIDFV;

/// 获取UUID
+ (NSString *)solo_getUUID;
#pragma mark - 磁盘空间

/// 获取当前设备磁盘总容量(单位：MB）
+ (double)solo_getDiskSpaceTotal;

/// 获取当前设备磁盘剩余容量(单位：MB）
+ (double)solo_getDiskSpaceFree;

/// 获取当前设备磁盘使用容量(单位：MB）
+ (double)solo_getDiskSpaceUsed;

#pragma mark - 内存信息
/// 获取当前设备全部系统内存(单位：MB）
+ (double)solo_memoryTotal;
/// 获取当前设备使用系统内存(单位：MB）
+ (double)solo_memoryUsed;
/// 获取当前设备剩余系统内存(单位：MB）
+ (double)solo_memoryFree;
/// 当前线程占用内存（字节为单位）,（发生错误时为-1）
+ (int64_t)solo_currentThreadMemoryUsage;

#pragma mark - CPU信息
/// cpu数量
+ (NSUInteger)solo_cpuCount;
/// 当前线程CPU使用率，1.0表示100％。 （发生错误时为-1）
+ (float)solo_currentThreadCpuUsage;
/// 当前每个处理器的CPU使用率（NSNumber数组），1.0表示100％。 （发生错误时为零）
+ (NSArray <NSNumber *> *)solo_cpuUsagePerProcessor;
/// cpu使用率
+ (float)solo_cpuUsage;

@end

NS_ASSUME_NONNULL_END
