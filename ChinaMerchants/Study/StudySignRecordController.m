//
//  StudySignRecordController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "StudySignRecordController.h"
#import "StudySignRecordViewModel.h"
#import "QMCalendarView.h"

@interface StudySignRecordController ()<QMCalendarViewDelegate>

@property (nonatomic, strong) StudySignRecordViewModel *viewModel;

@end

@implementation StudySignRecordController

+ (instancetype)instantiation{
    return [[StudySignRecordController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"签到记录";
    self.viewModel = [[StudySignRecordViewModel alloc] init];
    //学习日历
    QMCalendarView * calendarView =[[QMCalendarView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:calendarView];
    [calendarView reloadData];
    [calendarView dayWithYear:2017 withMonth:8 dataArray:nil];
}

#pragma mark -QMCalendarViewDelegate
- (void)calendarSelectDay:(NSInteger)day withMonth:(NSInteger)month withyear:(NSInteger)year{

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
