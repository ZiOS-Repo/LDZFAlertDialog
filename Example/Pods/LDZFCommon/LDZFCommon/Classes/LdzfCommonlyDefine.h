//
//  LdzfCommonlyDefine.h
//  IUCommon_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 弱引用
#ifndef kWeakSelf
#define kWeakSelf __weak typeof(self) weakSelf = self;
#endif


/// 强引用, 需要与 kWeakSelf 配合使用
#ifndef kStrongSelf
#define kStrongSelf __strong __typeof(&*weakSelf) strongSelf = weakSelf;
#endif

#pragma mark - 系统判断
/**
 *  ios 7判断
 */
#ifndef kIUsIOS7Later
#define kIUsIOS7Later  !([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending)
#endif

/**
 *  ios 8判断
 */
#ifndef kIUsIOS8Later
#define kIUsIOS8Later  !([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending)
#endif

/**
 *  ios 9判断
 */
#ifndef kIUsIOS9Later
#define kIUsIOS9Later  !([[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] == NSOrderedAscending)


#endif

/**
 *  ios 10判断
 */
#ifndef kIUsIOS10Later
#define kIUsIOS10Later  !([[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] == NSOrderedAscending)

#endif
/**
 *  ios 11判断
 */
#ifndef kIUsIOS11Later
//#define kIUsIOS11Later  !([[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] == NSOrderedAscending)
#define kIUsIOS11Later  (([[[UIDevice currentDevice] systemVersion] floatValue] >=11.0)? (YES):(NO))
#endif

/**
 *  ios 11.2判断
 */
#ifndef kIUsIOS11_2Later
//#define kIUsIOS11Later  !([[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] == NSOrderedAscending)
#define kIUsIOS11_2Later  (([[[UIDevice currentDevice] systemVersion] floatValue] >=11.2)? (YES):(NO))
#endif




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
