//
//  PublishDynamicController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "PublishDynamicController.h"
#import "PublishDynamicViewModel.h"
#import "UIColor+HUE.h"

#import "WYWLineTableViewCell.h"
#import "PublishConentTableCell.h"
#import "PublishImageTableCell.h"

@interface PublishDynamicController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) PublishDynamicViewModel *viewModel;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation PublishDynamicController

+ (instancetype)instantiation{
    
    return [[PublishDynamicController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[PublishDynamicViewModel alloc] init];
    
    [self.tableView registerClass:[WYWLineTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WYWLineTableViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PublishConentTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([PublishConentTableCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PublishImageTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([PublishImageTableCell class])];

    [self.viewModel layerUI];
    
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
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
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
