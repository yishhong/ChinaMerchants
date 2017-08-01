//
//  ClubSynopsisController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubSynopsisController.h"
#import "ClubSynopsisViewModel.h"
#import "UIColor+HUE.h"
#import "WYWLineTableViewCell.h"
#import "HomeBannerTableViewCell.h"
#import "ClubNameTableCell.h"
#import "ClubAddressTableCell.h"
#import "ClubCoachTableCell.h"
#import "RankingImageViewTableViewCell.h"
#import "ClubSectionTableCell.h"
#import "ClubClassImageTableCell.h"
#import "ClubVideoTableCell.h"

@interface ClubSynopsisController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ClubSynopsisViewModel *viewModel;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ClubSynopsisController

+ (instancetype)instantiation{
    
    return [[ClubSynopsisController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[ClubSynopsisViewModel alloc] init];
    [self.viewModel layerUI];
    
    [self.tableView registerClass:[WYWLineTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WYWLineTableViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeBannerTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([HomeBannerTableViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClubNameTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ClubNameTableCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClubAddressTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ClubAddressTableCell class])];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClubCoachTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ClubCoachTableCell class])];
    
    [self.tableView registerClass:[RankingImageViewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RankingImageViewTableViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClubSectionTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ClubSectionTableCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClubClassImageTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ClubClassImageTableCell class])];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClubVideoTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([ClubVideoTableCell class])];


}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XXCellModel * cellModel =[self.viewModel cellModelForRowAtIndexPath:indexPath];
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellModel.identifier];
    [cell xx_configCellWithEntity:cellModel];
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XXCellModel * cellModel =[self.viewModel cellModelForRowAtIndexPath:indexPath];
    return cellModel.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark -setter or getter
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-40) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource =self;
        _tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        _tableView.backgroundColor =[UIColor controllerBackgroundColor];
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
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
