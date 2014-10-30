//
//  CCSDataInterface.h
//  CCSProject
//
//  服务器接口相关URL、常用数据字典初始化(设备类型\分辨率\版本号\DeviceToken)
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 公共Key
 */
extern const NSString* CCS_KEY_OS_VER;					// 客户端系统版本
extern const NSString* CCS_VALUE_OS_VER;				// 客户端系统版本
extern const NSString* CCS_KEY_UD_ID;					// 设备号
extern const NSString* CCS_VALUE_UD_ID;					// 设备号
extern const NSString* CCS_KEY_IOS_APNSTOKEN;			// 用于IOS系统的Push机制，其他平台可为空
extern const NSString* CCS_VALUE_IOS_APNSTOKEN;         // 用于IOS系统的Push机制，其他平台可为空
extern const NSString* CCS_KEY_CLIENT_PLATFORM;         // APP客户端平台iOS
extern const NSString* CCS_KEY_CLIENT_VER;				// APP客户端版本号
extern const NSString* CCS_VALUE_CLIENT_VER;			// APP客户端版本号
extern const NSString* CCS_KEY_CONTENT_TYPE;			// 返回的数据格式
extern const NSString* CCS_VALUE_CONTENT_TYPE;			// 返回的数据格式
extern const NSString* CCS_KEY_DEVICE_NAME;				// 手机设备型号
extern const NSString* CCS_VALUE_DEVICE_NAME;			// 手机设备型号
extern const NSString* CCS_KEY_IMSI;					// 手机sim卡标示
extern const NSString* CCS_VALUE_IMSI;                  // 手机sim卡标示
extern const NSString* CCS_KEY_SOURCE_ID;				// 客户端推广渠道来源标识
extern const NSString* CCS_VALUE_SOURCE_ID;				// 客户端推广渠道来源标识
extern const NSString* CCS_KEY_LANGUAGE;				// APP语言版本
extern const NSString* CCS_VALUE_LANGUAGE;				// APP语言版本
extern const NSString* CCS_KEY_CARRIER;					// 运营商信息
extern const NSString* CCS_VALUE_CARRIER;				// 运营商信息
extern const NSString* CCS_KEY_SMS_CENTER_NUMBER;		// 短信中心号码
extern const NSString* CCS_VALUE_SMS_CENTER_NUMBER;		// 短信中心号码
extern const NSString* CCS_KEY_WANTYPE;                 // 网络连接类型：Wifi、3G，等
extern const NSString* CCS_VALUE_WANTYPE;				// 网络连接类型：Wifi、3G，等
extern const NSString* CCS_KEY_SCREENSIZE;              //屏幕分辨率
extern const NSString* CCS_VALUE_SCREENSIZE;            //屏幕分辨率
extern const NSString* CCS_KEY_APPDOWNLOAD;             //app下载地址

@interface CCSDataInterface : NSObject

+(void)initialize;

+(void)initializeCommonParams;

+(void)setCommonParam:(id)key value:(id)value;

+(id)commonParam:(id) key;

+(NSMutableDictionary *)commonParams;

+(void)walkDataInterface;
@end
