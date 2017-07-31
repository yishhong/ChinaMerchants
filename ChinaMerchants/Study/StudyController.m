//
//  StudyController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "StudyController.h"
#import "StudyViewModel.h"

@interface StudyController ()

@property (nonatomic, strong) StudyViewModel *viewModel;

@end

@implementation StudyController

+ (instancetype)instantiation{
    return [[StudyController alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title =@"学习";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[StudyViewModel alloc] init];

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
