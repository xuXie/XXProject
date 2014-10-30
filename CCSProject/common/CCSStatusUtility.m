//
//  CCSStatusUtility.m
//  CCSProject
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import "CCSStatusUtility.h"
#import <netinet/in.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/sysctl.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import <AdSupport/ASIdentifierManager.h>

@interface CCSStatusUtility ()

+ (NSString *)macAddress;
+(BOOL)checkDevice:(NSString*)name;
@end

static UIAlertView *_alertView = nil;

@implementation CCSStatusUtility
+ (void)showAlert:(NSString *)aTitle message:(NSString *)aMessage delegate:(id<UIAlertViewDelegate>)aDelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    if (_alertView.isVisible) {
        return;
    }
    if (_alertView != nil) {
        _alertView = nil;
    }
    _alertView = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:aDelegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (otherButtonTitles != nil) {
        va_list args;
        va_start(args, otherButtonTitles);
        NSString* arg = nil;
        [_alertView addButtonWithTitle:otherButtonTitles];
        while ( ( arg = va_arg( args, NSString*) ) != nil ) {
            [_alertView addButtonWithTitle:arg];
        }
        va_end(args);
    }
    [_alertView show];
}

+(NSString*)getAppVersionStr{
    NSString *l_version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    
    return l_version;
}

+(NSString *)getDeviceGUID{
    CGFloat l_version_sdk=[[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (l_version_sdk>=7.0) {
//        NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//        
//        adId=[adId stringByReplacingOccurrencesOfString:@"-" withString:@""];
//        
//        return adId;
        NSBundle *adSupportBundle = [NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"];
        [adSupportBundle load];
        
        if (adSupportBundle == nil) {
            return @"";
        }
        else{
            
            Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
            
            if(asIdentifierMClass == nil){
                return @"";
            }
            else{
                ASIdentifierManager *asIM = [[asIdentifierMClass alloc] init];
                
                if (asIM == nil) {
                    return @"";
                }
                else{
                    
                    if(asIM.advertisingTrackingEnabled){
                        return [asIM.advertisingIdentifier UUIDString];
                    }
                    else{
                        return [asIM.advertisingIdentifier UUIDString];
                    }
                }
            }
        }
    }else{
        return [CCSStatusUtility macAddress];
    }
    
}

/**
 *	@brief	获取app名称
 *
 *	获取app名称
 *
 *	@return	app名称
 */
+(NSString *)getAppDisplayName{
    NSString *l_displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    
    return l_displayName;
}

/**
 *	@brief	获取设备型号
 *
 *	获取设备型号
 *
 *	@return	设备型号
 */
+(NSString *)getDevicePlatform{
    // Gets a string with the device model
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (UK+Europe+Asis+China)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (UK+Europe+Asis+China)";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (GSM+CDMA)";
    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

/**
 *	@brief	获取设备系统类型
 *
 *	获取设备系统类型
 *
 *	@return	获取设备系统类型
 */
+(NSString *)getDeviceSystemVersion{
    return [[UIDevice currentDevice] systemVersion];
}

/**
 *	@brief	获取设备系统时间
 *
 *	获取设备系统时间
 *
 *	@return	获取设备系统时间
 */
+(NSString *)getCustomDeviceTime{
    
    NSDateFormatter *l_dataFormatter=[[NSDateFormatter alloc] init];
    [l_dataFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *l_str_date=[l_dataFormatter stringFromDate:[NSDate date]];
    
    return l_str_date;
}

/**
 *	@brief	判断是否有网络
 *	@return
 */
+(BOOL)isNetworkReachable{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestJSONSuccess:(NSDictionary*)jsonDict{
    
    BOOL isSuccess = YES;
	if (jsonDict==nil) { // 网络错误
        
        if (![[self class] isNetworkReachable]){
            [CCSStatusUtility showAlert:CCS_DEFAULTTITLE
                                message:CCS_NETWORK_NOCONNECT
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil];
        }else{
            [CCSStatusUtility showAlert:CCS_DEFAULTTITLE
                                message:CCS_NETWORK_TIMEOUT
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil];
        }
        isSuccess = NO;
	}else{
        
    }
	return isSuccess;
}

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestNoAlertJSONSuccess:(NSDictionary*)jsonDict{
    
    BOOL isSuccess = YES;
	if (jsonDict==nil) { // 网络错误
        
        isSuccess = NO;
	}else{
            }
	return isSuccess;
}

+ (NSString *) macAddress{
    
    //    return kTESTMacAddress;
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (NSString *)makeValidPhoneNumber:(NSString *)number {
    number = [number stringByReplacingOccurrencesOfString:@"-" withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@" " withString:@""];
    return number;
}

+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex==1){
        NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",CCS_DEFAULT_TELEPHONE]; //number为号码字符串
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
    }
    
}

+(BOOL)checkDevice:(NSString*)name
{
    NSString* deviceType = [UIDevice currentDevice].model;
    NSLog(@"deviceType = %@", deviceType);
	
    NSRange range = [deviceType rangeOfString:name];
    return range.location != NSNotFound;
}

+(void)makeCall:(NSString*)telnum
{
	if ([[self class] checkDevice:DEVICETYPE_DESC_IPHONE] && [telnum length])
	{
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"是否拨打电话？" message:telnum
													   delegate:self cancelButtonTitle:@"取消" otherButtonTitles: @"拨打",nil];
		[alert show];
		
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"本设备不支持拨号功能" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
		[alert show];
	}
}


@end
