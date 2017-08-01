//
//  ClubController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubController.h"
#import "ClubViewModel.h"
#import "CAPSPageMenu.h"
#import "ClubSynopsisController.h"
#import "ClubInformationController.h"
#import "UIColor+HUE.h"


@interface ClubController ()<CAPSPageMenuDelegate>

@property (strong,nonatomic) CAPSPageMenu * pageMenu;

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

    NSMutableArray * viewControllerArray =[[NSMutableArray alloc]init];
    
    ClubSynopsisController * synopsisController =[ClubSynopsisController instantiation];
    synopsisController.title =@"简介";
    [viewControllerArray addObject:synopsisController];
    
    ClubInformationController * informationController =[ClubInformationController instantiation];
    informationController.title =@"资讯";
    [viewControllerArray addObject:informationController];
    
    NSDictionary *parameters =@{
                                CAPSPageMenuOptionMenuItemSeparatorWidth: @(1.0),
                                CAPSPageMenuOptionUseMenuLikeSegmentedControl: @(YES),
                                CAPSPageMenuOptionMenuItemSeparatorPercentageHeight: @(0.1),
                                CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor whiteColor],
                                CAPSPageMenuOptionMenuHeight: @40,
                                CAPSPageMenuOptionSelectedMenuItemLabelColor:[UIColor VPTitleColor],
                                CAPSPageMenuOptionSelectionIndicatorColor: [UIColor blackColor],
                                CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor whiteColor]
                                };
    _pageMenu =[[CAPSPageMenu alloc]initWithViewControllers:viewControllerArray frame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height) options:parameters];
    _pageMenu.delegate=self;
    [self.view addSubview:_pageMenu.view];
    [self addChildViewController:_pageMenu];
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
