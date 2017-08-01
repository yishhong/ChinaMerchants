//
//  ClubInformationController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubInformationController.h"
#import "ClubInformationViewModel.h"
#import "UIColor+HUE.h"

@interface ClubInformationController ()

@property (nonatomic, strong) ClubInformationViewModel *viewModel;

@end

@implementation ClubInformationController

+ (instancetype)instantiation{

    return [[ClubInformationController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ClubInformationViewModel alloc] init];
    
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
