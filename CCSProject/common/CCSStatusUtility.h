//
//  CCSStatusUtility.h
//  CCSProject
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//
/*
 1、导入如下FrameWork，
    Adsupport.framework -optional SDK6.0以上才能用
 */

#import <Foundation/Foundation.h>

@interface CCSStatusUtility : NSObject
/**
 *	@brief	显示alert
 *
 *	可防止多次弹出alertview
 *
 *	@param 	aTitle 	标题
 *	@param 	aMessage 	内容
 *	@param 	aDelegate 	代理，执行者
 *	@param 	cancelButtonTitle 	取消按钮名称
 *	@param 	otherButtonTitles 	其他按钮名称
 */
+(void)showAlert:(NSString *)aTitle message:(NSString *)aMessage delegate:(id<UIAlertViewDelegate>)aDelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
/**
 *	@brief	获取GUID
 *
 *	获取GUID
 *
 *	@return	GUID
 */
+(NSString *)getDeviceGUID;

/**
 *	@brief	获取app版本号
 *
 *	获取app版本号
 *
 *	@return	app版本号
 */
+(NSString*)getAppVersionStr;

/**
 *	@brief	获取app名称
 *
 *	获取app名称
 *
 *	@return	app名称
 */
+(NSString *)getAppDisplayName;

/**
 *	@brief	获取设备型号
 *
 *	获取设备型号
 *
 *	@return	设备型号
 */
+(NSString *)getDevicePlatform;

/**
 *	@brief	获取设备系统类型
 *
 *	获取设备系统类型
 *
 *	@return	获取设备系统类型
 */
+(NSString *)getDeviceSystemVersion;

/**
 *	@brief	获取设备系统时间
 *
 *	获取设备系统时间
 *
 *	@return	获取设备系统时间
 */
+(NSString *)getCustomDeviceTime;

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestJSONSuccess:(NSDictionary*)jsonDict;
/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestNoAlertJSONSuccess:(NSDictionary*)jsonDict;

/**
 * 返回一个设备可以直接拨打的电话号码（去掉连接符号和空格）
 */
+ (NSString *)makeValidPhoneNumber:(NSString *)number;

/**
 * @brief 打电话
 */
+(void)makeCall:(NSString*)telnum;


@end
