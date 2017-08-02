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
#import "QMCalendarView.h"
#import "QMClassCalendarView.h"

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
    //学习日历
//    QMCalendarView * calendarView =[[QMCalendarView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    [self.view addSubview:calendarView];
//    [calendarView reloadData];
//    [calendarView dayWithYear:2017 withMonth:8 dataArray:nil];
    
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
