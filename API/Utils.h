//
//  Utils.h
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/7.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface Utils : NSObject

/**
 *  MD5加密
 */
+ (NSString *)MD5:(NSString *)str;
/**
 *  url 加密
 *
 *  @param params 参数拼接字符串
 *  @param timeSp 时间戳
 *
 *  @return 加密后的token
 */
+ (NSString *)url_base64_Md5:(NSString *)params timeSp:(NSString *)timeSp;

@end
