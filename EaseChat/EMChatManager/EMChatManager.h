//
//  EMChatManager.h
//  IOS_JJD
//
//  Created by Apricot on 2017/4/28.
//  Copyright © 2017年 HNTH. All rights reserved.
//  环信的管理类

#import <Foundation/Foundation.h>

#import <Hyphenate/Hyphenate.h>
#import <EaseUI.h>
////用于消息扩展的 头像
//#define JJD_ChatListPhoto @"jjd_photoURL"
////用于消息扩展的 昵称
//#define JJD_ChatListNick @"jjd_nikeName"
////用于消息的用户id
//#define JJD_ChatUserID @"jjd_userID"

#define JJD_LocationStatus @"jjd_locationStatus"

#define JJD_Latitude @"jjd_latitude"

#define JJD_Longitude @"jjd_longitude"


#define JJD_MessageExtToName @"jjd_messageExtToName"
#define JJD_MessageExtToID @"jjd_messageExtToID"
#define JJD_MessageExtToPic @"jjd_messageExtToPic"
#define JJD_MessageExtFromName @"jjd_messageExtFromName"
#define JJD_MessageExtFromID @"jjd_messageExtFromID"
#define JJD_MessageExtFromPic @"jjd_messageExtFromPic"
#define JJD_MessageExtIsSave @"jjd_messageExtIsSave"

typedef void(^Completion)(id object,NSError *error);

@interface EMChatManager : NSObject<EMClientDelegate>

+ (instancetype)sharedManager;

/**
 登录环信接口

 @param userID 用户id
 @param pwd 用户密码
 @param completion 回调
 */
- (void)loginWithUserID:(NSString *)userID password:(NSString *)pwd completion:(Completion)completion;

/**
 退出登录

 @param completion 回调
 */
- (void)logOutWithCompletion:(Completion)completion;


/**
 保存环信相关的信息

 @param easeID 环信ID
 @param photo 对应头像
 @param nickName 对应昵称
 */
- (void)saveEaseID:(NSString *)easeID photo:(NSString *)photo nickName:(NSString *)nickName;

/**
 环信ID

 @param easeID 环信ID
 @return 返回与该ID关联的数据
 */
- (NSDictionary *)loadEaseID:(NSString *)easeID;

/**
 通过环信ID删除环信的信息

 @param easeID 环信ID
 */
- (void)deleteEaseInfoWithEaseID:(NSString *)easeID;

/**
 获取消息扩赞

 @param name 昵称
 @param pic 头像
 @return 返回消息的扩展
 */
- (NSDictionary *)messageExtWithName:(NSString *)name pic:(NSString *)pic;

/**
 清理群聊的图片

 @param picUrl 群聊图片的URL
 */
- (void)updateGroupPicWithPicUrl:(NSString *)picUrl;

@end
