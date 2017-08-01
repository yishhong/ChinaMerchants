//
//  VPStorageManager.m
//  VillagePlay
//
//  Created by Apricot on 16/10/18.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "StorageManager.h"
#import "QMStorageManage.h"
#import <YYModel.h>

/**
 *  登录信息的KEY
 */
static NSString * const KLoginInfo = @"K_LoginInfo";

/**
 *  用户信息的KEY
 */
static NSString * const KUserInfo = @"K_UserInfo";

/**
 *  授权Token的KEY
 */
static NSString * const KAuthorization = @"K_Authorization";

/**
 *  收藏记录的KEY
 */
static NSString * const KCollectionRecord = @"K_CollectionRecord";

/**
 *  广告启动页记录的KEY
 */
static NSString * const KStartPage = @"K_StartPage";

/**
 *  选择城市记录的KEY
 */
static NSString * const KSelectCity = @"K_SelectCity";
/**
 *  搜索记录的KEY
 */
static NSString * const KSearchRecord = @"K_SearchRecord";
/**
 *  存储环信相关的KEY
 */
static NSString * const KEaseNickAndPhoto = @"K_EaseNickAndPhoto";
/**
 *  存储邀约消息
 */
static NSString * const KInvitationMessage = @"K_InvitationMessage";

static NSString * const KCommentBadge = @"K_CommentBadge";



@interface VPStorageManager ()

@end


@implementation VPStorageManager

+ (void)saveLoginInfo:(NSDictionary *)loginInfo{
    [[QMStorageManage sharedManager].commonDB setObject:loginInfo forKey:KLoginInfo];
}

+ (NSDictionary *)loadLoginInfo{
    return [[QMStorageManage sharedManager].commonDB objectForKey:KLoginInfo];
}

+ (void)deleteLoginInfo{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KLoginInfo];
}

+ (void)saveUserInfo:(UserInfoModel *)userInfoModel{
    /*
     "sysUserId": 1,
     "sysUserName": "admin"
     */
    [[QMStorageManage sharedManager].commonDB setObject:[userInfoModel yy_modelToJSONObject] forKey:KUserInfo];
    [[QMStorageManage sharedManager] loadUserDB:userInfoModel.userName];
    NSLog(@"%@",[QMStorageManage sharedManager].userDB);
}

+ (UserInfoModel *)loadUserInfo{
    id userDict = [[QMStorageManage sharedManager].commonDB objectForKey:KUserInfo];
    if(userDict){
        UserInfoModel * userInfoModel = [UserInfoModel yy_modelWithDictionary:userDict];
        [[QMStorageManage sharedManager] loadUserDB:userInfoModel.userName];
        return userInfoModel;
    }
    return nil;
}

+ (void)deleteUserInfo{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KUserInfo];
    //清理用户的数据库
    [[QMStorageManage sharedManager] cleanUserDB];
}

+ (void)saveAuthorization:(NSDictionary *)authorization{
    [[QMStorageManage sharedManager].commonDB setObject:authorization forKey:KAuthorization];
}

+ (NSDictionary *)loadAuthorization{
    return [[QMStorageManage sharedManager].commonDB objectForKey:KAuthorization];
}

+ (void)deleteAuthorization{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KAuthorization];
}

+ (void)saveCollectionRecord:(NSDictionary *)collectionRecord type:(NSString *)type{
    [[QMStorageManage sharedManager].userDB setObject:collectionRecord forKey:[NSString stringWithFormat:@"%@%@",KCollectionRecord,type]];
}

+ (NSDictionary *)loadCollectionRecordWithType:(NSString *)type{
    return [[QMStorageManage sharedManager].userDB objectForKey:[NSString stringWithFormat:@"%@%@",KCollectionRecord,type]];
}

+ (void)deleteCollectionRecordWithType:(NSString *)type{
    [[QMStorageManage sharedManager].userDB removeObjectForKey:[NSString stringWithFormat:@"%@%@",KCollectionRecord,type]];
}
#warning 暂时屏蔽
+ (void)saveStartPageInfo:(id)startPageInfo{
    [[QMStorageManage sharedManager].commonDB setObject:[startPageInfo yy_modelToJSONObject] forKey:KStartPage];
}

+ (id)loadStartPageInfo{
    NSDictionary *startPageDict = [[QMStorageManage sharedManager].commonDB objectForKey:KStartPage];
    if(startPageDict){
        return [[startPageDict class] yy_modelWithDictionary:startPageDict];
//        id bannerInfoModel = [[startPageDict class] yy_modelWithDictionary:startPageDict];
//        return bannerInfoModel;
    }
    return nil;
}

+ (void)deleteStartPageInfo{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KStartPage];
}

+ (void)saveSelectCityDict:(NSDictionary *)cityDict{
    [[QMStorageManage sharedManager].commonDB setObject:cityDict forKey:KSelectCity];
}

+ (NSDictionary *)loadCityDict{
    return [[QMStorageManage sharedManager].commonDB objectForKey:KSelectCity];
}

+ (void)deleteCityDict{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KSelectCity];
}

+ (void)saveSearchRecord:(NSString *)searchRecord{
    NSMutableArray *array = [NSMutableArray arrayWithArray:[[QMStorageManage sharedManager].commonDB objectForKey:KSearchRecord]];
    [array addObject:searchRecord];
    [[QMStorageManage sharedManager].commonDB setObject:array forKey:KSearchRecord];
}

+ (NSArray *)loadSearchRecord{
    NSMutableArray *searchRecord = [[QMStorageManage sharedManager].commonDB objectForKey:KSearchRecord];
    return searchRecord;
}

+ (void)deleteSearchRecord{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KSearchRecord];
}

+ (void)saveEaseNickAndPhoto:(NSDictionary *)easeInfo{
    [[QMStorageManage sharedManager].commonDB setObject:easeInfo forKey:KEaseNickAndPhoto];
}

+ (NSDictionary *)loadEaseNickAndPhoto{
    NSDictionary *dict = [[QMStorageManage sharedManager].commonDB objectForKey:KEaseNickAndPhoto];
    return dict;
}

+ (void)deleteEaseNickAndPhoto{
    [[QMStorageManage sharedManager].commonDB removeObjectForKey:KEaseNickAndPhoto];
}


+ (void)saveInvitationMessage:(NSArray *)messageArray{

    if([messageArray count]>0){
        NSMutableArray * invitationMessages = [[[QMStorageManage sharedManager].userDB objectForKey:KInvitationMessage] mutableCopy];
        if(!invitationMessages){
            invitationMessages = [NSMutableArray array];
        }
        
        for (int i = messageArray.count-1; i >=0 ; i--) {
            [invitationMessages insertObject:messageArray[i] atIndex:0];
        }
        [[QMStorageManage sharedManager].userDB setObject:invitationMessages forKey:KInvitationMessage];
    }
}

+ (NSArray *)loadInvitationMessage{
    NSArray * invitationMessages = [[QMStorageManage sharedManager].userDB objectForKey:KInvitationMessage];
    return invitationMessages;
}

+ (void)deleteInvitationMessage{
    [[QMStorageManage sharedManager].userDB removeObjectForKey:KInvitationMessage];
}

+ (void)saveCommentBadgeCount:(NSInteger)count{
    NSInteger oldCount = [[[QMStorageManage sharedManager].userDB objectForKey:KCommentBadge] integerValue];
    count = count + oldCount;
    [[QMStorageManage sharedManager].userDB setObject:@(count) forKey:KCommentBadge];
}

+ (NSInteger)loadCommentBadgeCount{
    NSNumber *count = [[QMStorageManage sharedManager].userDB objectForKey:KCommentBadge];
    return [count integerValue];
}

+ (void)deleteCommentBadgeCount{
    [[QMStorageManage sharedManager].userDB removeObjectForKey:KCommentBadge];
}


@end
