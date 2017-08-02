//
//  XXAPI.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "XXAPI.h"
#import "Utils.h"

@implementation XXAPI

-(void)POST:(NSString *)URLString encryption:(NSString *)encryption parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{

    
}


/**
 参数加密

 @param paramenters 参数
 @return <#return value description#>
 */
-(NSString *)paramenters:(NSDictionary *)paramenters{

    NSMutableArray * parameterArr =[NSMutableArray array];
    NSString * parameterString =@"";
    NSArray *keysArray = [paramenters allKeys];
    //遍历字典所有key 拼接成字符串
    for (int i=0; i<keysArray.count; i++) {
        NSString * key =keysArray[i];
        NSString * value =paramenters[key];
        parameterString =[NSString stringWithFormat:@"%@=%@&",key,value];
        [parameterArr addObject:parameterString];
    }
    //排序(升序)
    NSArray * sortResult =[parameterArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2]; //升序
    }];
    
    //排序后的参数拼接
    NSString * md5String=@"";
    for (NSString * sortString in sortResult) {
        md5String =[NSString stringWithFormat:@"%@%@",md5String,sortString];
    }
    NSString * stringMd5 =[NSString stringWithFormat:@"%@key=%@",md5String,@"E183D686D9BF85C78AA6AA644CDB34C8"];
    //参数md5加密
    NSString * string =[Utils MD5:stringMd5];
    return string;
}

@end
