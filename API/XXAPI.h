//
//  XXAPI.h
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)(NSDictionary *responseDict);
typedef void(^Failure)(NSError *error);

@interface XXAPI : NSObject

-(void)POST:(NSString *)URLString encryption:(NSString *)encryption parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *failure))failure;

@end
