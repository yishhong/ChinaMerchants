//
//  RegisterController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "RegisterController.h"
#import "RegisterViewModel.h"
#import "Masonry.h"
#import "UIColor+HUE.h"
#import "AuthCodeController.h"

@interface RegisterController ()

@property (nonatomic, strong) RegisterViewModel *viewModel;

@property (strong, nonatomic) UITextField * phoneTextField;

@property (strong, nonatomic) UITextField * passWordTextField;

@property (strong, nonatomic) UIButton * nextButton;

@end

@implementation RegisterController

+ (instancetype)instantiation{

    return [[RegisterController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[RegisterViewModel alloc] init];
    [self setUI];
}

-(void)setUI{

    self.phoneTextField =[[UITextField alloc]init];
//    self.phoneTextField.delegate =self;
    self.phoneTextField.borderStyle =UITextBorderStyleNone;
    self.phoneTextField.placeholder =@"手机号";
    self.phoneTextField.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 25)];
    self.phoneTextField.leftViewMode =UITextFieldViewModeAlways;
    self.phoneTextField.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.phoneTextField.layer.masksToBounds =YES;
    self.phoneTextField.font =[UIFont systemFontOfSize:15];
    self.phoneTextField.layer.cornerRadius =5.0f;
    self.phoneTextField.layer.borderWidth =1.0f;
    self.phoneTextField.keyboardType=UIKeyboardTypePhonePad;
    self.phoneTextField.layer.borderColor =[UIColor controllerBackgroundColor].CGColor;
    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(40);
        make.left.mas_offset(25);
    }];
    
    self.passWordTextField =[[UITextField alloc]init];
//    self.passWordTextField.delegate =self;
    self.passWordTextField.borderStyle =UITextBorderStyleNone;
    self.passWordTextField.placeholder =@"密码";
    self.passWordTextField.secureTextEntry =YES;
    self.passWordTextField.font =[UIFont systemFontOfSize:15];
    self.passWordTextField.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.passWordTextField.layer.masksToBounds =YES;
    self.passWordTextField.layer.cornerRadius =5.0f;
    self.passWordTextField.layer.borderWidth =1.0f;
    self.passWordTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    self.passWordTextField.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 25)];
    self.passWordTextField.leftViewMode =UITextFieldViewModeAlways;
    self.passWordTextField.layer.borderColor =[UIColor controllerBackgroundColor].CGColor;
    [self.view addSubview:self.passWordTextField];
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(15);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(40);
        make.left.mas_offset(25);
    }];

    
    self.nextButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextButton setBackgroundColor:[UIColor blackColor]];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextButton.titleLabel.font =[UIFont systemFontOfSize:15];
    [self.nextButton addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    self.nextButton.layer.cornerRadius =5.0f;
    self.nextButton.layer.masksToBounds =YES;
    [self.view addSubview:self.nextButton];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTextField.mas_bottom).offset(30);
        make.left.mas_offset(25);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(45);
    }];
}

- (void)nextAction{

    AuthCodeController * authCodeController =[AuthCodeController instantiation];
    authCodeController.title =@"短信验证码";
    [self.navigationController pushViewController:authCodeController animated:YES];
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
