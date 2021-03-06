//
//  APPGlobalVariable.h
//  FlashRider
//
//  Created by gaoyafeng on 2018/11/26.
//  Copyright © 2018 ishansong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APPEnum.h"//宏文件
#import "APPSystemDefine.h"//重写系统宏
#import "APPCustomDefine.h"//自定义宏

#ifdef __cplusplus
#define GFKIT_EXTERN        extern "C" __attribute__((visibility ("default")))
#else
#define GFKIT_EXTERN        extern __attribute__((visibility ("default")))
#endif



#pragma mark - ******************* 全局常量 *******************

///通知网络变化：name值
GFKIT_EXTERN NSString * const _kGlobal_NetworkingReachabilityChangeNotification;

///登录变化通知
GFKIT_EXTERN NSString * const _kGlobal_LoginStateChange;

///订单列表上的按钮通知
GFKIT_EXTERN NSString * const _kGlobal_OrderDetailBtnEvent;

///是否第一次打开
GFKIT_EXTERN NSString * const _kGlobal_IsFirstOpen;

///版本信息存储字段
GFKIT_EXTERN NSString * const _kGlobal_versionInfo;

///本地保存订单信息
GFKIT_EXTERN NSString * const _kGlobal_localOrderInfo;



#pragma mark - 接口宏变量

///版本检测
GFKIT_EXTERN NSString * const _kNet_version_check;
