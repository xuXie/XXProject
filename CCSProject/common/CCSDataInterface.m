//
//  CCSDataInterface.m
//  CCSProject
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import "CCSDataInterface.h"
#import "CCSConfig.h"

/**
 公共Key
 */
const NSString* CCS_KEY_OS_VER = @"os_ver";						// 客户端系统版本
const NSString* CCS_VALUE_OS_VER = @"ios4.2";					// 客户端系统版本
const NSString* CCS_KEY_UD_ID = @"Udid";                        // 设备号
const NSString* CCS_VALUE_UD_ID = @"";                          // 设备号
const NSString* CCS_KEY_IOS_APNSTOKEN = @"deviceToken";			// 用于IOS系统的Push机制，其他平台可为空
const NSString* CCS_VALUE_IOS_APNSTOKEN = @"";					// 用于IOS系统的Push机制，其他平台可为空
const NSString* CCS_KEY_CLIENT_PLATFORM = @"platform";         // APP客户端平台iOS
const NSString* CCS_KEY_CLIENT_VER = @"currentVersion";				// APP客户端版本号
const NSString* CCS_VALUE_CLIENT_VER = @"1.0.0";					//APP客户端版本号
const NSString* CCS_KEY_CONTENT_TYPE = @"content_type";			// 返回的数据格式
const NSString* CCS_VALUE_CONTENT_TYPE = @"json";					// 返回的数据格式
const NSString* CCS_KEY_DEVICE_NAME = @"PhoneModel";			// 手机设备型号
const NSString* CCS_VALUE_DEVICE_NAME = @"";
const NSString* CCS_KEY_IMSI =@"Imsi";							// 手机sim卡标示
const NSString* CCS_VALUE_IMSI =@"";								// 手机sim卡标示
const NSString* CCS_KEY_SOURCE_ID =@"Source";					// 客户端推广渠道来源标识
const NSString* CCS_VALUE_SOURCE_ID =@"spAppstore";			// 客户端推广渠道来源标识
const NSString* CCS_KEY_LANGUAGE =@"Language";					// APP语言版本
const NSString* CCS_KEY_CARRIER =@"Operator";						// 运营商信息
const NSString* CCS_VALUE_CARRIER =@"";							// 运营商信息
const NSString* CCS_KEY_SMS_CENTER_NUMBER =@"SmsNumber"; // 短信中心号码
const NSString* CCS_VALUE_SMS_CENTER_NUMBER =@"";				// 短信中心号码
const NSString* CCS_KEY_WANTYPE =@"wantype";			// 网络连接类型：Wifi、3G，等
const NSString* CCS_VALUE_WANTYPE =@"";
const NSString* CCS_KEY_SCREENSIZE = @"ScreenSize";              //屏幕分辨率
const NSString* CCS_VALUE_SCREENSIZE = @"320x480";            //屏幕分辨率
const NSString* CCS_KEY_APPDOWNLOAD = @"AppDownloadURL";             //app下载地址

@implementation CCSDataInterface
static NSMutableDictionary* commonParams;

+(void) initialize{
	commonParams = [[NSMutableDictionary alloc] init];
	[[self class] initializeCommonParams];
}

+(void)initializeCommonParams{
	CGFloat screenWidth = 320.0f;
	CGFloat screenHeight = 480.0f;
	UIScreen* _screen = [UIScreen mainScreen];
	
	if (isRetina) {
		UIScreenMode* _mode = [_screen currentMode];
		screenWidth = _mode.size.width;
		screenHeight = _mode.size.height;
	}
	
	[commonParams setValuesForKeysWithDictionary:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [NSString stringWithFormat:@"%.0f*%.0f", screenWidth, screenHeight], CCS_KEY_SCREENSIZE,
      CCS_VALUE_CLIENT_VER,CCS_KEY_CLIENT_VER,
      [NSString stringWithFormat:@"%.0f",[[[UIDevice currentDevice] systemVersion] floatValue]],CCS_KEY_OS_VER,
      nil]];
}

// 获取数据字典
+(NSMutableDictionary *)commonParams{
	return commonParams;
}

+(void)setCommonParam:(id)key value:(id)value{
	[commonParams setValue:value forKey:key];
	[[self class] walkDataInterface];
}

+(id)commonParam:(id) key{
    return [commonParams objectForKey:key];
}

+(void)walkDataInterface{
    NSLog(@"= walkDataInterface =");
	for (id _k in [commonParams allKeys]) {
        NSLog(@"key:<%@>, value:<%@>",_k, [commonParams objectForKey:_k]);
	}
    NSLog(@"= end walkDataInterface =");
}
@end
