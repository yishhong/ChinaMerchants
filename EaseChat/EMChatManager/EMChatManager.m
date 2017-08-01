//
//  EMChatManager.m
//  IOS_JJD
//
//  Created by Apricot on 2017/4/28.
//  Copyright © 2017年 HNTH. All rights reserved.
//

#import "EMChatManager.h"
#import "UserManager.h"
//#import "EMCallController.h"
#import "StorageManager.h"
//#import "QMPointOutView.h"
#import <SDWebImage/SDImageCache.h>
//#import "LocationManger.h"
#import "NSError+Reason.h"

@interface EMChatManager ()
@property (strong, nonatomic) NSObject *callLock;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) EMCallSession *currentSession;

//@property (strong, nonatomic) EMCallController *currentController;

@property (assign, nonatomic) BOOL isShowLoginView;

@end

@implementation EMChatManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static id _shared;
    dispatch_once(&onceToken, ^{
        _shared = [[[self class] alloc] init];
    });
    return _shared;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isShowLoginView = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makeCall:) name:KNOTIFICATION_CALL object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(authorizationExceptionNotification) name:@"AuthorizationExceptionNotification" object:nil];
    }
    return self;
}


- (void)loginWithUserID:(NSString *)userID password:(NSString *)pwd completion:(Completion)completion{
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];

    //判断是否自动登录
    if(![EMClient sharedClient].options.isAutoLogin){
        NSLog(@"非自动登录");
        [[EMClient sharedClient] loginWithUsername:userID
                                          password:pwd
                                        completion:^(NSString *aUsername, EMError *aError) {
                                            NSError *error = nil;
                                            if (!aError) {
                                                NSLog(@"登陆成功\n\n\n\n\n\n\n\n\n");
                                                //设置自动登录
                                                [[EMClient sharedClient].options setIsAutoLogin:YES];
                                            } else {
                                                error = [NSError errorCode:aError.code message:aError.errorDescription];
                                                NSLog(@"登陆失败\n\n\n\n\n\n\n\n\n");
                                            }
                                            if(completion){
                                                completion(nil,error);
                                            }
                                        }];
    }else{
//        [[LocationManger shareIntance] updateLocationSuccess:^(CLLocation *location, NSError *error) {
//            if(error){
//                NSLog(@"上传最后位置失败:%@",error.errorMessage);
//            }else{
//                NSLog(@"上传最后位置成功");
//            }
//        }];
//        NSLog(@"自动登录\n\n\n\n\n\n\n\n\n");
    }
}

- (void)logOutWithCompletion:(Completion)completion{
    [[EMClient sharedClient] removeDelegate:self];
    [[EMClient sharedClient] logout:YES completion:^(EMError *aError) {
        NSError *error = nil;
        if (!aError) {
            [[UserManager sharedInstance] xx_deleteUserInfo];
            NSLog(@"退出成功\n\n\n\n\n\n\n\n\n");
        } else {
            NSLog(@"退出失败\n\n\n\n\n\n\n\n\n");
        }
        if(completion){
            completion(nil,error);
        }
    }];
}

#pragma mark - 环信聊天的代理
- (void)autoLoginDidCompleteWithError:(EMError *)error{
//#warning 自动登录需要在外部处理
    if(!error){
        NSLog(@"自动登录成功\n\n\n\n\n\n\n\n\n");
        [UserManager sharedInstance];
//        [[UserManager sharedInstance] xx_saveUserInfo:[UserManager sharedInstance].xx_userInfo];
    }else{
        NSLog(@"自动登录失败\n\n\n\n\n\n\n\n\n");
//        [[QMWarnView instantiation] layerUIwithWarnStr:@"账号异常\n请重新登录" leftButtonTitle:@"确定" rightButtonTitle:@"取消" block:^(BOOL status) {
//
//        }];
        [[UserManager sharedInstance] xx_deleteUserInfo];
//        [self abnormalExitWithWarnMessage:@"账号异常\n请重新登录"];
    }
}

- (void)connectionStateDidChange:(EMConnectionState)aConnectionState{
//#warning 需要提示用户登录的信息
    switch (aConnectionState) {
        case EMConnectionConnected:{
            NSLog(@"重新连接成功\n\n\n\n\n\n\n\n\n");
        }break;
        case EMConnectionDisconnected:{
//            [MBProgressHUD showTip:@"网络连接"];
            NSLog(@"重新连接失败\n\n\n\n\n\n\n\n\n");
        }break;
        default:
            break;
    }
}

- (void)userAccountDidLoginFromOtherDevice{
    NSLog(@"当前登录账号在其它设备登录时会接收到该回调\n\n\n\n\n\n\n\n\n");

//#warning 被动退出的时候需要处理登出的逻辑
//    [MBProgressHUD showTip:@"当前账号在已在其他设备登录\n请重新登录!"];
////    [[QMWarnView instantiation] layerUIwithWarnStr:@"当前账号在已在其他设备登录\n请重新登录!" leftButtonTitle:@"确定" rightButtonTitle:@"取消" block:^(BOOL status) {
////        
////    }];
//    [[QMPointOutView instantiation] layerUIwithWarnStr:@"" buttonTitle:@"确定" block:^(BOOL status) {
//        UITabBarController *tabBarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//        [tabBarVC.navigationController popToRootViewControllerAnimated:YES];
//        [tabBarVC setSelectedIndex:0];
//    }];
    [[UserManager sharedInstance] xx_deleteUserInfo];
//    [self abnormalExitWithWarnMessage:@"当前账号在已在其他设备登录\n请重新登录!"];
}

- (void)userAccountDidRemoveFromServer{
    NSLog(@"当前登录账号已经被从服务器端删除时会收到该回调\n\n\n\n\n\n\n\n\n");
//#warning 被动退出的时候需要处理登出的逻辑
//    [MBProgressHUD showTip:];
//    [[QMWarnView instantiation] layerUIwithWarnStr:@"当前账号存在异常\n请与客服联系!" leftButtonTitle:@"确定" rightButtonTitle:@"取消" block:^(BOOL status) {
//        
//    }];
    [[UserManager sharedInstance] xx_deleteUserInfo];
//    [self abnormalExitWithWarnMessage:@"当前账号存在异常\n请与客服联系!"];
}

- (void)authorizationExceptionNotification{
//    [self abnormalExitWithWarnMessage:@"账号异常，请重新登录"];
}

//- (void)abnormalExitWithWarnMessage:(NSString *)warnMessage{
//    if(self.isShowLoginView){
//        return ;
//    }
//    self.isShowLoginView = YES;
//    __weak typeof(EMChatManager *) weakSelf = self;
//    [[QMPointOutView instantiation] layerUIwithWarnStr:warnMessage buttonTitle:@"确定" block:^(BOOL status) {
//        weakSelf.isShowLoginView = NO;
//        UITabBarController *tabBarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//        UINavigationController *navigationVC = tabBarVC.selectedViewController;
//        [tabBarVC setSelectedIndex:0];
//
//        [navigationVC popToRootViewControllerAnimated:YES];
//        
//    }];
//}

#pragma mark - Call
- (void)makeCall:(NSNotification*)notify{
    if (notify.object) {
        EMCallType type = (EMCallType)[[notify.object objectForKey:@"type"] integerValue];
        [self makeCallWithUsername:[notify.object valueForKey:@"chatter"] type:type];
    }
}
- (void)makeCallWithUsername:(NSString *)aUsername
                        type:(EMCallType)aType
{
    return;
//    if ([aUsername length] == 0) {
//        return;
//    }
//    
//    __weak typeof(self) weakSelf = self;
//    
//    [[EMClient sharedClient].callManager startCall:aType remoteName:aUsername ext:@"123" completion:^(EMCallSession *aCallSession, EMError *aError) {
//        EMChatManager *strongSelf = weakSelf;
//        if(!strongSelf){
//            [[EMClient sharedClient].callManager endCall:aCallSession.callId reason:EMCallEndReasonNoResponse];
//        }else{
//            if(aError || aCallSession == nil){
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"call.initFailed", @"Establish call failure") message:aError.errorDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//                [alertView show];
//                return;
//            }
//            @synchronized (self.callLock) {
//                strongSelf.currentSession = aCallSession;
//                strongSelf.currentController = [[EMCallController alloc] initWithCallSession:strongSelf.currentSession];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    if (strongSelf.currentController) {
//                        
//                        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self.currentController animated:NO completion:nil];
//                    }
//                });
//                
//                
//                [self _startCallTimer];
//            }
//        }
//    }];
}
#pragma mark - private timer

- (void)_timeoutBeforeCallAnswered
{
    [self hangupCallWithReason:EMCallEndReasonNoResponse];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"call.autoHangup", @"No response and Hang up") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)_startCallTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:50 target:self selector:@selector(_timeoutBeforeCallAnswered) userInfo:nil repeats:NO];
}

- (void)_stopCallTimer
{
    if (self.timer == nil) {
        return;
    }
    
    [self.timer invalidate];
    self.timer = nil;
}


#pragma mark - EMCallManagerDelegate

- (void)callDidReceive:(EMCallSession *)aSession
{
//    if (!aSession || [aSession.callId length] == 0) {
//        return ;
//    }
//    
//    if ([EaseSDKHelper shareHelper].isShowingimagePicker) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideImagePicker" object:nil];
//    }
//    
//    if(self.currentSession && self.currentSession.status != EMCallSessionStatusDisconnected){
//        [[EMClient sharedClient].callManager endCall:aSession.callId reason:EMCallEndReasonBusy];
//        return;
//    }
//    
//    @synchronized (_callLock) {
//        [self _startCallTimer];
//        
//        self.currentSession = aSession;
//        self.currentController = [[EMCallController alloc] initWithCallSession:self.currentSession];
//        self.currentController.modalPresentationStyle = UIModalPresentationOverFullScreen;
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (self.currentController) {
//                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self.currentController animated:NO completion:nil];
//            }
//        });
//    }
}

- (void)callDidConnect:(EMCallSession *)aSession
{
//    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
//        [self.currentController stateToConnected];
//    }
}

- (void)callDidAccept:(EMCallSession *)aSession
{
//    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
//        [self _stopCallTimer];
//        [self.currentController stateToAnswered];
//    }
}

- (void)callDidEnd:(EMCallSession *)aSession
            reason:(EMCallEndReason)aReason
             error:(EMError *)aError
{
//    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
//        
//        [self _stopCallTimer];
//        
//        @synchronized (_callLock) {
//            self.currentSession = nil;
//            [self _clearCurrentCallViewAndData];
//        }
//        
//        if (aReason != EMCallEndReasonHangup) {
//            NSString *reasonStr = @"end";
//            switch (aReason) {
//                case EMCallEndReasonNoResponse:
//                {
//                    reasonStr = NSLocalizedString(@"call.noResponse", @"NO response");
//                }
//                    break;
//                case EMCallEndReasonDecline:
//                {
//                    reasonStr = NSLocalizedString(@"call.rejected", @"Reject the call");
//                }
//                    break;
//                case EMCallEndReasonBusy:
//                {
//                    reasonStr = NSLocalizedString(@"call.in", @"In the call...");
//                }
//                    break;
//                case EMCallEndReasonFailed:
//                {
//                    reasonStr = NSLocalizedString(@"call.connectFailed", @"Connect failed");
//                }
//                    break;
//                case EMCallEndReasonUnsupported:
//                {
//                    reasonStr = NSLocalizedString(@"call.connectUnsupported", @"Unsupported");
//                }
//                    break;
//                case EMCallEndReasonRemoteOffline:
//                {
//                    reasonStr = NSLocalizedString(@"call.offline", @"Remote offline");
//                }
//                    break;
//                default:
//                    break;
//            }
//            
//            if (aError) {
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:aError.errorDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//                [alertView show];
//            }
//            else{
//                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:reasonStr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//                [alertView show];
//            }
//        }
//    }
}

- (void)didReceiveCallNetworkChanged:(EMCallSession *)aSession status:(EMCallNetworkStatus)aStatus
{
    if ([aSession.callId isEqualToString:self.currentSession.callId]) {
        //        [self.callController setNetwork:aStatus];
    }
}

#pragma mark - EMCallBuilderDelegate

- (void)callRemoteOffline:(NSString *)aRemoteName
{
    NSString *text = [[EMClient sharedClient].callManager getCallOptions].offlineMessageText;
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:text];
    NSString *fromStr = [EMClient sharedClient].currentUsername;
    EMMessage *message = [[EMMessage alloc] initWithConversationID:aRemoteName from:fromStr to:aRemoteName body:body ext:@{@"em_apns_ext":@{@"em_push_title":text}}];
    message.chatType = EMChatTypeChat;
    
    [[EMClient sharedClient].chatManager sendMessage:message progress:nil completion:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)_clearCurrentCallViewAndData{
//    @synchronized (_callLock) {
//        self.currentSession = nil;
//        
//        self.currentController.isDismissing = YES;
//        [self.currentController clearData];
//        [self.currentController dismissViewControllerAnimated:NO completion:nil];
//        self.currentController = nil;
//    }
}

- (void)hangupCallWithReason:(EMCallEndReason)aReason{
    [self _stopCallTimer];
    
    if (self.currentSession) {
        [[EMClient sharedClient].callManager endCall:self.currentSession.callId reason:aReason];
    }
    [self _clearCurrentCallViewAndData];
}

- (void)saveEaseID:(NSString *)easeID photo:(NSString *)photoURL nickName:(NSString *)nickName{
    if([easeID isKindOfClass:[NSNull class]]||easeID.length<1){
        return;
    }
    NSMutableDictionary *dictInfo = [[VPStorageManager loadEaseNickAndPhoto] mutableCopy];
    if(!dictInfo){
        dictInfo = [NSMutableDictionary dictionary];
    }
    NSMutableDictionary *easeInfo = [dictInfo objectForKey:easeID];
    if(!easeInfo){
        easeInfo = [NSMutableDictionary dictionary];
        easeInfo[@"oldPhoto"] = @"";
        easeInfo[@"oldNick"] = @"";
        easeInfo[@"photo"] = photoURL;
        easeInfo[@"nick"] = nickName;
    }else{
        if(photoURL.length>0){
            NSString * oldPhoto = easeInfo[@"oldPhoto"];
            NSString * photo = easeInfo[@"photo"];
            if (![oldPhoto isEqualToString:photoURL]&&[photo isEqualToString:photoURL]){
                NSLog(@"头像无修改");
            }else if([oldPhoto isEqualToString:photoURL]){
                NSLog(@"原本的头像");
            }else if((![oldPhoto isEqualToString:photoURL]&&![photo isEqualToString:photoURL])||([oldPhoto isEqualToString:photoURL]&&![photo isEqualToString:photoURL])){
                oldPhoto = photo;
                photo = photoURL;
            }
            easeInfo[@"oldPhoto"] = oldPhoto;
            easeInfo[@"photo"] = photo;
        }
        
        if(nickName.length>0){
            NSString * oldNick = easeInfo[@"oldNick"];
            NSString * nick = easeInfo[@"nick"];
            if (![oldNick isEqualToString:nickName]&&[nick isEqualToString:nickName]){
                NSLog(@"昵称无修改");
            }else if([oldNick isEqualToString:nickName]){
                NSLog(@"原本的昵称");
            }else if((![oldNick isEqualToString:nickName]&&![nick isEqualToString:nickName])||([oldNick isEqualToString:nickName]&&![nick isEqualToString:nickName])){
                oldNick = nick;
                nick = nickName;
            }
            easeInfo[@"oldNick"] = oldNick;
            easeInfo[@"nick"] = nick;
        }
    }
    [dictInfo setObject:easeInfo forKey:easeID];
    [VPStorageManager saveEaseNickAndPhoto:dictInfo];
}

- (NSDictionary *)loadEaseID:(NSString *)easeID{
    NSMutableDictionary *dictInfo = [[VPStorageManager loadEaseNickAndPhoto] mutableCopy];
    NSDictionary *easeInfo = dictInfo[easeID];
    return easeInfo;
}

- (void)deleteEaseInfoWithEaseID:(NSString *)easeID{
    NSMutableDictionary *dictInfo = [[VPStorageManager loadEaseNickAndPhoto] mutableCopy];
    if([[dictInfo allKeys] containsObject:easeID]){
        [dictInfo removeObjectForKey:easeID];
    }
    [VPStorageManager saveEaseNickAndPhoto:dictInfo];
}

- (NSDictionary *)messageExtWithName:(NSString *)name pic:(NSString *)pic{
    NSMutableDictionary *ext = [NSMutableDictionary dictionary];
    ext[JJD_MessageExtToName] = name;
    ext[JJD_MessageExtToPic] = pic;
//    ext[JJD_MessageExtFromPic] = [UserManager sharedInstance].xx_userInfo.photoUrl;
//    ext[JJD_MessageExtFromName] = [UserManager sharedInstance].xx_userInfo.nick;
    return ext;
}

- (void)updateGroupPicWithPicUrl:(NSString *)picUrl{
    [[SDImageCache sharedImageCache] removeImageForKey:picUrl fromDisk:YES];
//    - (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk withCompletion:(SDWebImageNoParamsBlock)completion
}


@end
