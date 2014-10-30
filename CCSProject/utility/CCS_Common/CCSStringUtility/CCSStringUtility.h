//
//  CCSStringUtility.h
//  QiMeiLady
//
//  Created by user on 11-7-8.
//  Copyright 2011 chichuang.com All rights reserved.
//
/*
 1、使用ARC，要在Build Phases中Compile Sources相应.m文件加-fno-objc-arc标签
 2、导入如下FrameWork，
    libicucore.dylib
 */


#import <Foundation/Foundation.h>

@interface CCSStringUtility : NSObject {

}
/**
 安全获取字符串
 @param str 字符串
 @returns 若字符串为nil，则返回空字符串，否则直接返回字符串
 */
+(NSString*)strOrEmpty:(NSString*)str;
/**
 去掉首尾空格
 @param str 字符串
 @returns 去掉首尾空格的字符串
 */
+(NSString*)stripWhiteSpace:(NSString*)str;
/**
 去掉首尾空格和换行符
 @param str 字符串
 @returns 去掉首尾空格和换行符的字符串
 */
+(NSString*)stripWhiteSpaceAndNewLineCharacter:(NSString*)str;
/**
 将字符串转换为MD5码
 @param str 字符串
 @returns 已转码为MD5的字符串
 */
+(NSString*)CCSMD5:(NSString*)str;

/**
 *	@brief	sha1Hash加密方式
 *	
 *
 *	@param 	string 	要加密的字符串
 *
 *	@return	加密后的字符串
 */
+(NSString*)sha1Hash:(NSString *)string;

/**
	判断字符串是否符合Email格式。
	@param input 字符串
	@returns 布尔值 YES: 符合 NO: 不符合
 */
+(BOOL)isEmail:(NSString *)input;

/**
	判断字符串是否符合手机号格式。
	@param input 字符串
	@returns 布尔值 YES: 符合 NO: 不符合
 */
+(BOOL)isPhoneNum:(NSString *)input;

/**
	判断字符串是否符合电话格式。
	@param input 字符串
	@returns 布尔值 YES: 符合 NO: 不符合
 */
+(BOOL)isMobileNum:(NSString *)input;

/**
 判断字符串是否符合邮政编码。
 @param input 字符串
 @returns 布尔值 YES: 符合 NO: 不符合
 */
+(BOOL)isPostNum:(NSString *)input;

/**
 判断字符串是否符合昵称。
 @param input 字符串
 @returns 布尔值 YES: 符合 NO: 不符合
 */
+(BOOL)isNickName:(NSString *)input;

+(BOOL)isPassword:(NSString *)input;

/**
 根据指定的字体，和宽度计算字符串的高度
 @param l_str_input 字符串
 @param l_font  使用的字体
 @param l_width 宽度
 */
+(CGFloat)getStringHight:(NSString*)l_str_input font:(UIFont*)l_font width:(CGFloat)l_width;

/**
 根据指定字符串进行base64编码
 @param input 字符串
 */
+(NSString*)encodeBase64:(NSString*)input;

@end

/*
 如果字符串==nil 返回 @"" 否则返回 str
 */
extern BOOL stringIsEmpty(NSString* str);
extern NSString* strOrEmpty(NSString *str);
/*
 返回当前时间
 */
extern NSString* nowTimestamp(void);
extern NSString* CCSMD5( NSString *str );
extern NSString* stripWhiteSpace(NSString *str);
extern NSString* CCSSHA1( NSString *str );
