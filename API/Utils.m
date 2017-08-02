//
//  Utils.m
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/7.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import "Utils.h"

@implementation Utils

/**
 *  MD5加密
 */
+ (NSString *)MD5:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), r);
    
    NSString * md5String=[NSString stringWithFormat:
                       @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",r[0], r[1], r[2], r[3],r[4], r[5], r[6], r[7],r[8], r[9], r[10], r[11],r[12], r[13], r[14], r[15]
                       ];

    return [md5String uppercaseString];
}

//+ (NSString *)md5EncryptWithString:(NSString *)string{
//    return [self md5:[NSString stringWithFormat:@"%@%@", encryptionKey, string]];
//}


/**
 *  url 加密
 *
 *  @param params 参数拼接字符串
 *  @param timeSp 时间戳
 *
 *  @return 加密后的token
 */
+ (NSString *)url_base64_Md5:(NSString *)params timeSp:(NSString *)timeSp {
    
    //    NSString *string1 = [[NSString alloc] init];
    
    //1.参数键值进行base64编码
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
    
    //2.编码KEY+string1+timeSp 进行base64编码
    NSString *string2 = [NSString stringWithFormat:@"WEIYUQWERAS%@%@",timeSp,base64Encoded];
    data = [string2 dataUsingEncoding:NSUTF8StringEncoding];
    base64Encoded = [data base64EncodedStringWithOptions:0];
    
    //3.MD5加密
    NSString *token = [self MD5:base64Encoded];
    
    return token;
}

@end
