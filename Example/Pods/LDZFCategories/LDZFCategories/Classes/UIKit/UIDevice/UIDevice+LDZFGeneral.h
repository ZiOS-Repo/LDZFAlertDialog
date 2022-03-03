//
//  UIDevice+LdzfGeneral.h
//  LDZFCategories
//
//  Created by zhuyuhui on 2021/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (LdzfGeneral)

#pragma mark - 设备信息
/// 获取 通用 - 关于本机 - 名称
+ (NSString *)ldzf_getDeviceUserName;

/// 获取设备类型 - iPhone/iTouch/iPad
+ (NSString *)ldzf_getDeviceModel;

/// 获取系统名称 - iOS
+ (NSString *)ldzf_getDeviceSystemName;

/// 获取设备系统版本 - 13.3/12.0
+ (NSString *)ldzf_getDeviceSystemVersion;

/// 获取设备电量 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown
+ (CGFloat)ldzf_getDeviceBattery;

/// 获取手机本地语言 zh-Hans-CN/en
+ (NSString *)ldzf_getCurrentLocalLanguage;

/// 获取设备名称，例：iPhone 11 Pro Max
+ (NSString *)ldzf_deviceName;
#pragma mark - 设备标识
/// 获取IDFA
+ (NSString *)ldzf_getIDFA;

/// 获取IDFV
+ (NSString *)ldzf_getIDFV;

/// 获取UUID
+ (NSString *)ldzf_getUUID;
#pragma mark - 磁盘空间

/// 获取当前设备磁盘总容量(单位：MB）
+ (double)ldzf_getDiskSpaceTotal;

/// 获取当前设备磁盘剩余容量(单位：MB）
+ (double)ldzf_getDiskSpaceFree;

/// 获取当前设备磁盘使用容量(单位：MB）
+ (double)ldzf_getDiskSpaceUsed;

#pragma mark - 内存信息
/// 获取当前设备全部系统内存(单位：MB）
+ (double)ldzf_memoryTotal;
/// 获取当前设备使用系统内存(单位：MB）
+ (double)ldzf_memoryUsed;
/// 获取当前设备剩余系统内存(单位：MB）
+ (double)ldzf_memoryFree;
/// 当前线程占用内存（字节为单位）,（发生错误时为-1）
+ (int64_t)ldzf_currentThreadMemoryUsage;

#pragma mark - CPU信息
/// cpu数量
+ (NSUInteger)ldzf_cpuCount;
/// 当前线程CPU使用率，1.0表示100％。 （发生错误时为-1）
+ (float)ldzf_currentThreadCpuUsage;
/// 当前每个处理器的CPU使用率（NSNumber数组），1.0表示100％。 （发生错误时为零）
+ (NSArray <NSNumber *> *)ldzf_cpuUsagePerProcessor;
/// cpu使用率
+ (float)ldzf_cpuUsage;

@end

NS_ASSUME_NONNULL_END
