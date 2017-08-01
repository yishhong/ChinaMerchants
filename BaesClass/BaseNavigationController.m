//
//  BaseNavigationController.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIColor+HUE.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController


+ (instancetype)instantiationWithRootViewController:(UIViewController *)rootViewController{
    
    BaseNavigationController *navigationController = [[BaseNavigationController alloc] initWithRootViewController:rootViewController];
    return navigationController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationBar.translucent =NO;
    [self.navigationBar setTintColor:[UIColor VPTitleColor]];
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    
//    [self.navigationBar xx_titleStyleWithColor:[UIColor VPTitleColor]];
    
    //    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    //    dic[NSFontAttributeName]=[UIFont systemFontOfSize:17];
    //    dic[NSForegroundColorAttributeName]=[UIColor VPTitleColor];
    //    [self.navigationBar setTitleTextAttributes:dic];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //设置返回按钮额文字为@“”
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    UIViewController *oldVC = [self.viewControllers lastObject];
    oldVC.navigationItem.backBarButtonItem = backItem;
    
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
