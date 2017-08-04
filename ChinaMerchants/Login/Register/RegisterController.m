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
#import "WebController.h"

@interface RegisterController ()

@property (nonatomic, strong) RegisterViewModel *viewModel;

@property (strong, nonatomic) UITextField * phoneTextField;

@property (strong, nonatomic) UITextField * passWordTextField;

@property (strong, nonatomic) UITextField * confirmPasswordTextField;

@property (strong, nonatomic) UITextField * authCodeTextField;

@property (strong, nonatomic) UIButton * authCodeButton;

@property (strong, nonatomic) UIButton * nextButton;

@property (strong, nonatomic) UIButton * agreementButton;

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
    
    self.authCodeButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.authCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.authCodeButton setBackgroundColor:[UIColor VPMainColor]];
    [self.authCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.authCodeButton.titleLabel.font =[UIFont systemFontOfSize:12];
    [self.authCodeButton addTarget:self action:@selector(authCodeAction) forControlEvents:UIControlEventTouchUpInside];
    self.authCodeButton.layer.cornerRadius =5.0f;
    self.authCodeButton.layer.masksToBounds =YES;
    [self.view addSubview:self.authCodeButton];
    [self.authCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(15);
        make.right.mas_equalTo(self.view.mas_right).offset(-25);
        make.width.mas_offset(90);
        make.height.mas_offset(40);
    }];
    
    self.authCodeTextField =[[UITextField alloc]init];
    //    self.authCodeTextField.delegate =self;
    self.authCodeTextField.borderStyle =UITextBorderStyleNone;
    self.authCodeTextField.placeholder =@"验证码";
    self.authCodeTextField.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 25)];
    self.authCodeTextField.leftViewMode =UITextFieldViewModeAlways;
    self.authCodeTextField.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.authCodeTextField.layer.masksToBounds =YES;
    self.authCodeTextField.font =[UIFont systemFontOfSize:15];
    self.authCodeTextField.layer.cornerRadius =5.0f;
    self.authCodeTextField.layer.borderWidth =1.0f;
    self.authCodeTextField.keyboardType=UIKeyboardTypePhonePad;
    self.authCodeTextField.layer.borderColor =[UIColor controllerBackgroundColor].CGColor;
    [self.view addSubview:self.authCodeTextField];
    [self.authCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(15);
        make.height.mas_offset(40);
        make.left.mas_offset(25);
        make.right.mas_equalTo(self.authCodeButton.mas_left).offset(-15);
    }];
    
    self.passWordTextField =[[UITextField alloc]init];
//    self.passWordTextField.delegate =self;
    self.passWordTextField.borderStyle =UITextBorderStyleNone;
    self.passWordTextField.placeholder =@"请设置登录密码";
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
        make.top.mas_equalTo(self.authCodeTextField.mas_bottom).offset(15);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(40);
        make.left.mas_offset(25);
    }];

    self.confirmPasswordTextField =[[UITextField alloc]init];
    //    self.confirmPasswordTextField.delegate =self;
    self.confirmPasswordTextField.borderStyle =UITextBorderStyleNone;
    self.confirmPasswordTextField.placeholder =@"请确认登录密码";
    self.confirmPasswordTextField.secureTextEntry =YES;
    self.confirmPasswordTextField.font =[UIFont systemFontOfSize:15];
    self.confirmPasswordTextField.clearButtonMode =UITextFieldViewModeWhileEditing;
    self.confirmPasswordTextField.layer.masksToBounds =YES;
    self.confirmPasswordTextField.layer.cornerRadius =5.0f;
    self.confirmPasswordTextField.layer.borderWidth =1.0f;
    self.confirmPasswordTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    self.confirmPasswordTextField.leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 25)];
    self.confirmPasswordTextField.leftViewMode =UITextFieldViewModeAlways;
    self.confirmPasswordTextField.layer.borderColor =[UIColor controllerBackgroundColor].CGColor;
    [self.view addSubview:self.confirmPasswordTextField];
    [self.confirmPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTextField.mas_bottom).offset(15);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(40);
        make.left.mas_offset(25);
    }];
    
    self.nextButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextButton setBackgroundColor:[UIColor VPMainColor]];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextButton.titleLabel.font =[UIFont systemFontOfSize:15];
    [self.nextButton addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    self.nextButton.layer.cornerRadius =5.0f;
    self.nextButton.layer.masksToBounds =YES;
    [self.view addSubview:self.nextButton];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.confirmPasswordTextField.mas_bottom).offset(30);
        make.left.mas_offset(25);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(45);
    }];
    
    self.agreementButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.agreementButton setTitle:@"注册即代表你一同意《用户协议》" forState:UIControlStateNormal];
    [self.agreementButton setBackgroundColor:[UIColor clearColor]];
    [self.agreementButton setTitleColor:[UIColor VPDetailColor] forState:UIControlStateNormal];
    self.agreementButton.titleLabel.font =[UIFont systemFontOfSize:12];
    [self.agreementButton addTarget:self action:@selector(agreementAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.agreementButton];
    [self.agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-30);
        make.centerX.equalTo(self.view);
        make.height.mas_offset(12);
    }];
    
    if (self.userType ==loginRegisterType) {
        self.agreementButton.hidden =YES;
    }else{
        self.agreementButton.hidden =NO;

    }
}


/**
 获取验证码
 */
- (void)authCodeAction{

}


/**
 下一步
 */
- (void)nextAction{

    [self.navigationController popToRootViewControllerAnimated:YES];

}

/**
 用户协议
 */
-(void)agreementAction{

    WebController * webController =[WebController instantiation];
    webController.title =@"用户协议";
    [self.navigationController pushViewController:webController animated:YES];
    
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
