//
//  CCSStringUtility.m
//  QiMeiLady
//
//  Created by user on 11-7-8.
//  Copyright 2011 chichuang.com All rights reserved.
//

#import "CCSStringUtility.h"
#import <CommonCrypto/CommonDigest.h>
#import "RegexKitLite.h"
#import "GTMBase64.h"


const NSString* REG_POST = @"^[1-9][0-9]{5}$";
const NSString* REG_EMAIL = @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
const NSString* REG_MOBILE = @"^(13[0-9]|15[0-9]|18[0-9])\\d{8}$";
const NSString* REG_PHONE = @"^(([0\\+]\\d{2,3}-?)?(0\\d{2,3})-?)?(\\d{7,8})";//(-(\\d{3,}))?$";
//const NSString* REG_PHONE = @"\\b(1)[358][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
const NSString* REG_NICKNAME = @"^[\u4e00-\u9fa5a-zA-Z0-9]{3,32}$";//昵称
const NSString* REG_PASSWORD = @"^([\\S]{6,255})$";

@implementation CCSStringUtility

/**
	安全获取字符串
	@param str 字符串
	@returns 若字符串为nil，则返回空字符串，否则直接返回字符串
 */
+(NSString*)strOrEmpty:(NSString*)str{
	return (str==nil?@"":str);
}

/**
	去掉首尾空格
	@param str 字符串
	@returns 去掉首尾空格的字符串
 */
+(NSString*)stripWhiteSpace:(NSString*)str{
	return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
	去掉首尾空格和换行符
	@param str 字符串
	@returns 去掉首尾空格和换行符的字符串
 */
+(NSString*)stripWhiteSpaceAndNewLineCharacter:(NSString*)str{
	return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
} 

/**
	将字符串转换为MD5码
	@param str 字符串
	@returns 已转码为MD5的字符串
 */
+(NSString*)CCSMD5:(NSString*)str
{
	const char *cStr = [str UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	
	CC_MD5( cStr, strlen(cStr), result );
	
	return [[NSString
			 stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			 result[0], result[1],
			 result[2], result[3],
			 result[4], result[5],
			 result[6], result[7],
			 result[8], result[9],
			 result[10], result[11],
			 result[12], result[13],
			 result[14], result[15]
			 ] lowercaseString];
}

/**
 *	@brief	sha1Hash加密方式
 *	
 *
 *	@param 	string 	要加密的字符串
 *
 *	@return	加密后的字符串
 */
+(NSString*)sha1Hash:(NSString *)string
{
    const char *cStr = [string cStringUsingEncoding:NSUTF8StringEncoding];
	NSData *data=[NSData dataWithBytes:cStr length:string.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
        
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString *output=[NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
    
    for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",digest[i]];
    }
    return output;
}

+ (NSString *)stringWithBase64ForData:(NSData *)data {
    // Cyrus Najmabadi elegent little encoder from
    // http://www.cocoadev.com/index.pl?BaseSixtyFour
    if (data == nil) return nil;
    
    const uint8_t* input = [data bytes];
    NSUInteger length = [data length];
    
    NSUInteger bufferSize = ((length + 2) / 3) * 4;
    NSMutableData* buffer = [NSMutableData dataWithLength:bufferSize];
    
    uint8_t* output = [buffer mutableBytes];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    for (NSInteger i = 0; i < length; i += 3) {
        NSInteger value = 0;
        for (NSInteger j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        NSInteger index = (i / 3) * 4;
        output[index + 0] =                    table[(value >> 18) & 0x3F];
        output[index + 1] =                    table[(value >> 12) & 0x3F];
        output[index + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[index + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    NSString *result = [[[NSString alloc] initWithData:buffer
                                              encoding:NSASCIIStringEncoding] autorelease];
    return result;
}

+(BOOL)isEmail:(NSString *)input{
	return [input isMatchedByRegex:[NSString stringWithFormat:@"%@",REG_EMAIL]];
}

+(BOOL)isPhoneNum:(NSString *)input{
	return [input isMatchedByRegex:[NSString stringWithFormat:@"%@",REG_PHONE]];
}

+(BOOL)isMobileNum:(NSString *)input{
	return [input isMatchedByRegex:[NSString stringWithFormat:@"%@",REG_MOBILE]];
}

+(BOOL)isPostNum:(NSString *)input{
    return [input isMatchedByRegex:[NSString stringWithFormat:@"%@",REG_POST]];
}

+(BOOL)isNickName:(NSString *)input{
    return [input isMatchedByRegex:[NSString stringWithFormat:@"%@",REG_NICKNAME]];
}

+(BOOL)isPassword:(NSString *)input{
    return [input isMatchedByRegex:[NSString stringWithFormat:@"%@",REG_PASSWORD]];
}

+(CGFloat)getStringHight:(NSString*)l_str_input font:(UIFont*)l_font width:(CGFloat)l_width
{
    if (l_str_input == nil || l_font == nil || l_width <= 0) {
        return 0.0f;
    }
    
    CGSize l_size = CGSizeMake(l_width, MAXFLOAT);
    
    if ( [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0 )
    {
        
        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                              l_font, NSFontAttributeName,
                                              nil];
        
        CGSize textSize = [l_str_input boundingRectWithSize:l_size//用于计算文本绘制时占据的矩形块
                                                options:NSStringDrawingUsesLineFragmentOrigin//文本绘制时的附加选项
                                             attributes:attributesDictionary// 文字的属性
                                                context:nil].size;
        return textSize.height;
    }else{
        
        CGSize textSize = [l_str_input sizeWithFont:l_font
                              constrainedToSize:l_size
                                  lineBreakMode:NSLineBreakByWordWrapping];
        
        return textSize.height;
    
    }
}

+(NSString*)encodeBase64:(NSString*)input
{
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    //转换到base64
    data = [GTMBase64 encodeData:data];
    NSString * base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [base64String autorelease];
}

@end

/*
 字符串是否没有内容
 */
inline BOOL stringIsEmpty(NSString* str){
	BOOL ret=NO;
	if(str==nil){
		ret=YES;
	}else{
		NSString * temp=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		if([temp length]<1){
			ret=YES;
		}
	}
	return ret;
}

inline NSString* strOrEmpty(NSString* str){
    if ([str isKindOfClass:[NSNull class]]) {
        return @"";
    }
	return (str==nil?@"":str);
}

inline NSString* stripWhiteSpace(NSString *str){
	/* 去掉首尾空格
	 */
	return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/*
 返回当前时间
 */
NSString* nowTimestamp(void){
	NSString* format=@"yyyyMMddHHmmss";
	assert(format!=nil);
	NSDate* nowDate=[NSDate date];
	NSDateFormatter* dateFormater=[[NSDateFormatter alloc] init];
	[dateFormater setDateFormat:format];
	[dateFormater stringFromDate:nowDate];
	NSString* timestamp=[[dateFormater stringFromDate:nowDate] copy];
	[dateFormater release];
	return [timestamp autorelease];
}

NSString* CCSMD5( NSString *str ) {
	const char *cStr = [str UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	
	CC_MD5( cStr, strlen(cStr), result );
	
	return [[NSString
			 stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			 result[0], result[1],
			 result[2], result[3],
			 result[4], result[5],
			 result[6], result[7],
			 result[8], result[9],
			 result[10], result[11],
			 result[12], result[13],
			 result[14], result[15]
			 ] lowercaseString];
}

NSString* CCSSHA1( NSString *str ){
    const char *cStr = [str cStringUsingEncoding:NSUTF8StringEncoding];
	NSData *data=[NSData dataWithBytes:cStr length:str.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString *output=[NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
    
    for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",digest[i]];
    }
    return output;
}
