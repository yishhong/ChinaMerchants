//
//  RootController.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "RootController.h"
#import "ClubController.h"
#import "WorkController.h"
#import "StudyController.h"
#import "DynamicController.h"
#import "MineController.h"

#import "BaseNavigationController.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BaseNavigationController *clubNavigation =[BaseNavigationController instantiationWithRootViewController:[ClubController instantiation]];
    clubNavigation.tabBarItem.image =[UIImage imageNamed:@"tab_shouye_nor"];
    clubNavigation.tabBarItem.selectedImage =[UIImage imageNamed:@"tab_shouye_sel"];
    
    BaseNavigationController *dynamicNavigation = [BaseNavigationController instantiationWithRootViewController:[DynamicController instantiation]];
    dynamicNavigation.tabBarItem.image =[UIImage imageNamed:@"tab_xinchanpin_nor"];
    dynamicNavigation.tabBarItem.selectedImage =[UIImage imageNamed:@"tab_xinchanpin_sel"];
    
    BaseNavigationController *studyNavigation = [BaseNavigationController instantiationWithRootViewController:[StudyController instantiation]];
    studyNavigation.tabBarItem.image =[UIImage imageNamed:@"tab_chuangyezhejiaoliu_nor"];
    studyNavigation.tabBarItem.selectedImage =[UIImage imageNamed:@"tab_chuangyezhejiaoliu_sel"];
    
    BaseNavigationController *workNavigation = [BaseNavigationController instantiationWithRootViewController:[WorkController instantiation]];
    workNavigation.tabBarItem.image =[UIImage imageNamed:@"tab_gouwuche_nor"];
    workNavigation.tabBarItem.selectedImage =[UIImage imageNamed:@"tab_gouwuche_sel"];
    
    BaseNavigationController *mineNavigation = [BaseNavigationController instantiationWithRootViewController:[MineController instantiation]];
    mineNavigation.tabBarItem.image =[UIImage imageNamed:@"tab_wode_nor"];
    mineNavigation.tabBarItem.selectedImage =[UIImage imageNamed:@"tab_wode_sel"];
    
    self.viewControllers = @[clubNavigation,dynamicNavigation,studyNavigation,workNavigation,mineNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
