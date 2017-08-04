//
//  MineController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "MineController.h"
#import "MineViewModel.h"
#import "LoginController.h"
#import "WYWLineTableViewCell.h"
#import "MineLoginTableCell.h"
#import "WYWIntegralTableCell.h"
#import "MineTableCell.h"
#import "UIColor+HUE.h"

@interface MineController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MineViewModel *viewModel;

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation MineController

+ (instancetype)instantiation{
    
    return [[MineController alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title =@"我的";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[MineViewModel alloc] init];
    
    [self.tableView registerClass:[WYWLineTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WYWLineTableViewCell class])];
    
    [self.tableView registerClass:[WYWIntegralTableCell class] forCellReuseIdentifier:NSStringFromClass([WYWIntegralTableCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineLoginTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MineLoginTableCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineTableCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MineTableCell class])];
    
    [self.viewModel layerUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.hidden =YES;
    [self.navigationController.navigationBar setTranslucent:YES];
}

//- (void)viewWillDisappear:(BOOL)animated{
//    
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden =NO;
//    [self.navigationController.navigationBar setTranslucent:NO];
//}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =NO;
    [self.navigationController.navigationBar setTranslucent:NO];
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

- (void)tableView:(UITableView *)tableView clickCell:(UITableViewCell *)clickCell indexPath:(NSIndexPath *)indexPath atView:(UIView *)view{
    XXCellModel * cellModel =[self.viewModel cellModelForRowAtIndexPath:indexPath];
    if ([cellModel.identifier isEqualToString:@"MineLoginTableCell"]) {
        UIViewController * loginController =[LoginController instantiation];
        [self presentViewController:loginController animated:YES completion:nil];
    }
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
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-49) style:UITableViewStylePlain];
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
