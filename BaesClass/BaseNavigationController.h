//
//  BaseNavigationController.h
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

+ (instancetype)instantiationWithRootViewController:(UIViewController *)rootViewController;

@end
