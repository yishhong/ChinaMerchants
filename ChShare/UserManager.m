//
//  VPUserManager.m
//  VillagePlay
//
//  Created by Apricot on 16/10/18.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UserManager.h"
#import "UserInfoModel.h"
#import "StorageManager.h"
#import "JPUSHService.h"
//#import "SDImageCache.h"
#import <SDWebImageDownloader.h>
#import <SDImageCache.h>
#import <Hyphenate/Hyphenate.h>

@interface UserManager ()
/**
 *  授权Token
 */
@property (nonatomic, strong) NSDictionary * authorizationInfo;
/**
 *  用户Model
 */
@property (nonatomic, strong) UserInfoModel *userInfoModel;

/**
 获取通知
 */
@property (nonatomic, assign) BOOL isNotice;

@end

@implementation UserManager


+(instancetype)sharedInstance{
    
    static id sharedInstance =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance =[[self alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInfoModel = [VPStorageManager loadUserInfo];
        if(self.userInfoModel){
            [self xx_saveUserInfo:self.userInfoModel];
        }
    }
    return self;
}

- (void)xx_saveLoginInfo:(NSDictionary *)loginInfo{
    [VPStorageManager saveLoginInfo:loginInfo];
}

- (void)xx_saveLoginInfoWithUserName:(NSString *)userName pwd:(NSString *)pwd{
    NSMutableDictionary *loginInfo = [NSMutableDictionary dictionary];
    loginInfo[k_loginUserName] = userName;
    loginInfo[k_loginPwd] = pwd;

    [VPStorageManager saveLoginInfo:loginInfo];
}

- (NSDictionary *)xx_loginInfo{
    return [VPStorageManager loadLoginInfo];
}

- (void)xx_deleteLoginInfo{
    [VPStorageManager deleteLoginInfo];
}


- (void)xx_saveUserInfo:(UserInfoModel *)userInfo{

    self.userInfoModel = userInfo;
    [VPStorageManager saveUserInfo:self.userInfoModel];
    //注册极光
    NSMutableSet *set = [NSMutableSet set];
    //添加性别
//    [set addObject:userInfo.sex];
//    [set addObject:userInfo.address];
//    [JPUSHService setTags:set alias:[@(userInfo.u_id) stringValue] fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
//        NSLog(@"=---------极光推送\n\n\n\n\n\n\n\n\n\\n\n\n:%d %zd",iResCode,userInfo.u_id);
//    }];
//    
//    
//    [[EMClient sharedClient] updatePushNotifiationDisplayName:userInfo.nick completion:^(NSString *aDisplayName, EMError *aError) {
//        NSLog(@"=---------环信推送\n\n\n\n\n\n\n\n\n\\n\n\n:%@",aError.errorDescription);
//    }];
//    [self downloaderImageWithURL:userInfo.photoUrl];
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_NOTIFICATION object:@YES];
}

/**
 下载头像

 @param imageUrlStr 图片的URL
 */
- (void)downloaderImageWithURL:(NSString *)imageUrlStr{
    //下载头像
    [[SDImageCache sharedImageCache] diskImageExistsWithKey:imageUrlStr completion:^(BOOL isInCache) {
        if(!isInCache){
            [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imageUrlStr] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                
            } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                [[SDImageCache sharedImageCache] storeImageDataToDisk:data forKey:imageUrlStr];

            }];
//            [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imageUrlStr] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
//                
//            } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
//                [[SDImageCache sharedImageCache] storeImageDataToDisk:data forKey:imageUrlStr];
//            }];
        }
    }];
//    if([[SDImageCache sharedImageCache] diskImageExistsWithKey:imageUrlStr]){
//        return;
//    }
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imageUrlStr] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        // 下载进度block
//    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        // 下载完成block
//        [[SDImageCache sharedImageCache] storeImage:image forKey:imageUrlStr];
//    }];
}

- (UserInfoModel *)xx_userInfo{
    return self.userInfoModel;
}

- (void)xx_deleteUserInfo{
    
    //注销极光
    [JPUSHService setTags:nil alias:@"" fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
        
    }];
    //删除用户
    self.userInfoModel =nil;
    
    NSMutableDictionary * loginInfo = [[[UserManager sharedInstance] xx_loginInfo] mutableCopy];
    loginInfo[k_loginPwd] = @"";
    [[UserManager sharedInstance] xx_saveLoginInfo:loginInfo];
    
    //清理登录的账号信息
//    [VPStorageManager deleteLoginInfo];
    //清理用户的详情信息
    [VPStorageManager deleteUserInfo];
    //清理授权数据
    [self deleteAuthorizationToken];
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_NOTIFICATION object:@NO];
    //登出的时候需要清理Badge
    [[NSNotificationCenter defaultCenter] postNotificationName:UPDATE_BADGENOTIFICATION object:nil];
}

- (void)xx_updateUserInfo:(UserInfoModel *)userInfo{
    
    self.userInfoModel =(UserInfoModel *)userInfo;
    //修改极光的城市和性别
    NSMutableSet *set = [NSMutableSet set];
    //添加性别
//    [set addObject:userInfo.sex];
//    [set addObject:userInfo.address];
//    [JPUSHService setTags:set alias:[@(userInfo.u_id) stringValue] fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
//        NSLog(@"=---------极光推送\n\n\n\n\n\n\n\n\n\\n\n\n:%d %zd",iResCode,userInfo.u_id);
//    }];
    
    [VPStorageManager saveUserInfo:self.userInfoModel];
    //下载头像
//    [self downloaderImageWithURL:userInfo.photoUrl];
}

//-(NSInteger)xx_userinfoID{
//    return self.userInfoModel.u_id;
//}

- (void)saveAuthorizationToken:(NSDictionary *)authorization{
    self.authorizationInfo = authorization;
    [VPStorageManager saveAuthorization:authorization];
}

- (NSDictionary *)loadAuthorizationToken{
    return self.authorizationInfo;
}

- (void)deleteAuthorizationToken{
    self.authorizationInfo = nil;
    //删除用户Token
    [VPStorageManager deleteAuthorization];
}

@end
