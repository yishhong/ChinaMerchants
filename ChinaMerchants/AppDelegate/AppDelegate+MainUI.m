//
//  AppDelegate+MainUI.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "AppDelegate+MainUI.h"
#import "RootController.h"

@implementation AppDelegate (MainUI)

-(void)configMainUI{

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RootController *rootVC = [[RootController alloc] init];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
}

@end
