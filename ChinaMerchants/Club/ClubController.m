//
//  ClubController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubController.h"
#import "ClubViewModel.h"

@interface ClubController ()

@property (nonatomic, strong) ClubViewModel *viewModel;

@end

@implementation ClubController

+ (instancetype)instantiation{
    
    return [[ClubController alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title =@"武道馆";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ClubViewModel alloc] init];

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
