//
//  LdzfGetPermission.h
//  IU_GeneralTools
//
//  Created by zhuyuhui on 2021/6/29.
//

#import <Foundation/Foundation.h>

@interface LdzfGetPermission : NSObject
/**
 获取系统相册权限
 @param callBack callback
 */
+(void)getPhotosPermission:(void(^)(BOOL has))callBack;

/**
 获取相机权限
 @param callBack callback(是否有权限)
 */
+(void)getCaptureDevicePermission:(void(^)(BOOL has))callBack;

/**
 获取麦克风权限
 @param callBack callback(是否有权限)
 */
+(void)getAudioRecordPermission:(void(^)(BOOL has))callBack;

/**
 同时获取相机+录音权限
 @param callBack callback
 */
+(void)getCaptureAndRecodPermission:(void(^)(BOOL hasCapturePermiss,BOOL hasRecodPermiss))callBack;

/**
 获取通讯录权限
 @param callBack callback
 */
+(void)getAddressBookPermission:(void(^)(BOOL has))callBack;

@end
