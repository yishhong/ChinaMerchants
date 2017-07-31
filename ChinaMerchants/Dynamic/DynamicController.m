//
//  DynamicController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "DynamicController.h"
#import "DynamicViewModel.h"

@interface DynamicController ()

@property (nonatomic, strong) DynamicViewModel *viewModel;

@end

@implementation DynamicController

+ (instancetype)instantiation{
    return [[DynamicController alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title =@"动态";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[DynamicViewModel alloc] init];

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
