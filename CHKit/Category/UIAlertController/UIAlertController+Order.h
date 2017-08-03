//
//  UIAlertController+Order.h
//  VillagePlay
//
//  Created by  易述宏 on 2016/12/13.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Order)


/**
 警告框
 
 @param message 提示信息
 @param deleteString 按钮状态
 @param block <#block description#>
 @return <#return value description#>
 */
+ (instancetype)selectMessage:(NSString *)message deleteString:(NSString *)deleteString block:(void(^)(NSInteger index))block;

/**
 警告框

 @param message 提示信息
 @param deleteString 按钮状态
 @param block <#block description#>
 @return <#return value description#>
 */
+ (instancetype)selectOrderStateMessage:(NSString *)message deleteString:(NSString *)deleteString block:(void(^)(NSInteger index))block;

/**
 扣分选项

 @param message 提示消息
 @param block <#block description#>
 @return <#return value description#>
 */
+ (instancetype)pointsSelectMessage:(NSString *)message block:(void(^)(NSInteger index,NSString *nameString))block;


/**
 计分选项

 @param message <#message description#>
 @param block <#block description#>
 @return <#return value description#>
 */
+(instancetype)selectSearchMessage:(NSString *)message block:(void(^)(NSInteger index,NSString *nameString))block;


/**
 计分项

 @param message 提示消息
 @param signString 签收
 @param fuyiString 复议
 @param block <#block description#>
 @return <#return value description#>
 */
+ (instancetype)selectJiFenMessage:(NSString *)message signString:(NSString *)signString    fuyiString:(NSString *)fuyiString block:(void(^)(NSInteger index))block;

@end
