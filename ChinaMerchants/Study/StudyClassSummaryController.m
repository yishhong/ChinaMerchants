//
//  StudyClassSummaryController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "StudyClassSummaryController.h"
#import "StudyClassSummaryViewModel.h"
#import "QMClassCalendarView.h"

@interface StudyClassSummaryController ()

@property (nonatomic, strong) StudyClassSummaryViewModel *viewModel;

@end

@implementation StudyClassSummaryController

+ (instancetype)instantiation{
    return [[StudyClassSummaryController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[StudyClassSummaryViewModel alloc] init];
    self.title =@"课程总结";
    
    QMClassCalendarView *classCalendarView =[[QMClassCalendarView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    [self.view addSubview:classCalendarView];
    [classCalendarView reloadData];
    [classCalendarView dayWithYear:2017 withMonth:8 dataArray:nil];

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
