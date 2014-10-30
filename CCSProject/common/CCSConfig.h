//
//  CCSConfig.h
//  CCSProject
//
//  常用宏信息：比如标题、navBar高度
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

//服务器地址
#ifndef CCS_SERVER_ADDRESS
#define CCS_SERVER_ADDRESS  @"192.168.1.1"
#endif

//MARK: - 图片相关
#ifndef CCS_COMMONIMG_NAVI
#define CCS_COMMONIMG_NAVI @"navBar_bg"
#endif

#ifndef DEVICETYPE_DESC_IPHONE
#define DEVICETYPE_DESC_IPHONE @"iPhone"
#endif

#ifndef CCS_DEFAULT_TELEPHONE
#define CCS_DEFAULT_TELEPHONE @"021123456"
#endif

//@"温馨提示"
#ifndef CCS_DEFAULTTITLE
#define CCS_DEFAULTTITLE  @"温馨提示"
#endif

#ifndef CCS_ERROR_TITLE
#define CCS_ERROR_TITLE @"服务器错误"
#endif

//无网络
#ifndef CCS_NETWORK_NOCONNECT
#define CCS_NETWORK_NOCONNECT @"网络连接失败，请确保设备已经连网"
#endif

//网络请求超时
#ifndef CCS_NETWORK_TIMEOUT
#define CCS_NETWORK_TIMEOUT @"网络连接失败，请稍后再试"
#endif

//网络请求超时
#ifndef CCS_CONNECTSEVER_ERROR
#define CCS_CONNECTSEVER_ERROR @"网络连接异常，请稍后再试"
#endif

#ifndef isRetina
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? [[UIScreen mainScreen] currentMode].size.width==640 : NO)
#endif

#ifndef isiPhone5
#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? [[UIScreen mainScreen] currentMode].size.height>1000 : NO)
#endif

#ifndef isiOS7
#define isiOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#endif

@interface CCSConfig : NSObject

@end
