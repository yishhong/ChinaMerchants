//
//  UIAlertController+Order.m
//  VillagePlay
//
//  Created by  易述宏 on 2016/12/13.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UIAlertController+Order.h"

@implementation UIAlertController (Order)

+(instancetype)selectMessage:(NSString *)message deleteString:(NSString *)deleteString block:(void (^)(NSInteger))block{

    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction  * alertCancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(0);
    }];
    UIAlertAction * deleteAction =[UIAlertAction actionWithTitle:deleteString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(1);
    }];
    [alertController addAction:alertCancelAction];
    [alertController addAction:deleteAction];
    return alertController;
}

+ (instancetype)selectOrderStateMessage:(NSString *)message deleteString:(NSString *)deleteString block:(void (^)(NSInteger))block{

    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction  * alertCancelAction =[UIAlertAction actionWithTitle:@"黑点" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(2);
    }];
    UIAlertAction * deleteAction =[UIAlertAction actionWithTitle:deleteString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(1);
    }];
    [alertController addAction:alertCancelAction];
    [alertController addAction:deleteAction];
    return alertController;
}

+ (instancetype)pointsSelectMessage:(NSString *)message block:(void (^)(NSInteger,NSString*))block{

    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"选择查询类型" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(0,@"取消");
    }];

    UIAlertAction  *peopleAction =[UIAlertAction actionWithTitle:@"人员查询" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(1,@"人员查询");
    }];

    UIAlertAction * siteAction =[UIAlertAction actionWithTitle:@"供应站查询" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(2,@"供应站查询");
    }];
    
    UIAlertAction * carAction =[UIAlertAction actionWithTitle:@"车辆查询" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(3,@"车辆查询");
    }];
    
    [alertController addAction:peopleAction];
    [alertController addAction:carAction];
    [alertController addAction:siteAction];
    [alertController addAction:cancelAction];

    return alertController;
}

+(instancetype)selectSearchMessage:(NSString *)message block:(void (^)(NSInteger, NSString *))block{

    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"选择查询类型" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(0,@"取消");
    }];
    
    UIAlertAction  *peopleAction =[UIAlertAction actionWithTitle:@"人员记分" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(1,@"人员记分");
    }];
    
    UIAlertAction * siteAction =[UIAlertAction actionWithTitle:@"供应站记分" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(2,@"供应站记分");
    }];
    
    UIAlertAction * carAction =[UIAlertAction actionWithTitle:@"车辆记分" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(3,@"车辆记分");
    }];
    
    [alertController addAction:peopleAction];
    [alertController addAction:carAction];
    [alertController addAction:siteAction];
    [alertController addAction:cancelAction];
    
    return alertController;
}

+(instancetype)selectJiFenMessage:(NSString *)message signString:(NSString *)signString fuyiString:(NSString *)fuyiString block:(void (^)(NSInteger))block{

    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction  * alertCancelAction =[UIAlertAction actionWithTitle:signString style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        block(0);
    }];
    UIAlertAction * deleteAction =[UIAlertAction actionWithTitle:fuyiString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(1);
    }];
    [alertController addAction:alertCancelAction];
    [alertController addAction:deleteAction];
    return alertController;
}

@end
