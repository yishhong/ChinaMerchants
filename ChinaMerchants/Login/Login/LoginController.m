//
//  LoginController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "LoginController.h"
#import "LoginViewModel.h"
#import "Masonry.h"
#import "UIColor+HUE.h"
#import "RegisterController.h"
#import "BaseNavigationController.h"
#import "UINavigationBar+Custom.h"
#import "UINavigationBar+Awesome.h"
#import "CHTypeEnum.h"

@interface LoginController ()<UITextFieldDelegate>

@property (nonatomic, strong) LoginViewModel *viewModel;

@property (strong, nonatomic) UIBarButtonItem * closeBarButton;

@property (strong, nonatomic) UIImageView * loginImageView;

@property (strong, nonatomic) UITextField * phoneTextField;

@property (strong, nonatomic) UITextField * passWordTextField;

@property (strong, nonatomic) UIButton * forgetPasswordButton;

@property (strong, nonatomic) UIButton * registerButton;

@property (strong, nonatomic) UIButton * loginButton;

@end

@implementation LoginController

+ (UIViewController *)instantiation{
    LoginController * loginController = [[LoginController alloc]init];
    BaseNavigationController * nagationController =[[BaseNavigationController alloc]initWithRootViewController:loginController];
    return nagationController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor] lineView:[UIColor clearColor]];
    self.navigationItem.leftBarButtonItem =self.closeBarButton;
    self.viewModel = [[LoginViewModel alloc] init];
    [self setUI];
}

-(void)setUI{
    
    self.loginImageView =[[UIImageView alloc]init];
    self.loginImageView.image =[UIImage imageNamed:@"login_icon"];
    [self.view addSubview:self.loginImageView];
    [self.loginImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(45);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_offset(90);
        make.height.mas_offset(90);
    }];
    
    self.phoneTextField =[[UITextField alloc]init];
    self.phoneTextField.delegate =self;
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
        make.top.equalTo(self.loginImageView.mas_bottom).offset(50);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(40);
        make.left.mas_offset(25);
    }];
    
    self.passWordTextField =[[UITextField alloc]init];
    self.passWordTextField.delegate =self;
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
    
    self.registerButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
    [self.registerButton setBackgroundColor:[UIColor clearColor]];
    [self.registerButton setTitleColor:[UIColor VPDetailColor] forState:UIControlStateNormal];
    self.registerButton.titleLabel.font =[UIFont systemFontOfSize:12];
    [self.registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTextField.mas_bottom).offset(30);
        make.left.mas_offset(20);
        make.width.mas_offset(60);
        make.height.mas_offset(25);
    }];
    
    self.forgetPasswordButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgetPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [self.forgetPasswordButton setBackgroundColor:[UIColor clearColor]];
    [self.forgetPasswordButton setTitleColor:[UIColor VPDetailColor] forState:UIControlStateNormal];
    [self.forgetPasswordButton addTarget:self action:@selector(forgetPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    self.forgetPasswordButton.titleLabel.font =[UIFont systemFontOfSize:12];
    [self.view addSubview:self.forgetPasswordButton];
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTextField.mas_bottom).offset(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-25);
        make.width.mas_offset(60);
        make.height.mas_offset(20);
    }];
    
    self.loginButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:[UIColor blackColor]];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font =[UIFont systemFontOfSize:15];
    [self.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.layer.cornerRadius =5.0f;
    self.loginButton.layer.masksToBounds =YES;
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registerButton.mas_bottom).offset(30);
        make.left.mas_offset(25);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(45);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor] lineView:[UIColor clearColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar lt_reset];
}

//立即注册
-(void)registerAction{

    RegisterController * registerController = [RegisterController instantiation];
    registerController.title =@"注册";
    registerController.userType =loginRegisterType;
    [self.navigationController pushViewController:registerController animated:YES];
}

//忘记密码
-(void)forgetPasswordAction{

    RegisterController * registerController = [RegisterController instantiation];
    registerController.title =@"忘记密码";
    registerController.userType =loginForgotPasswordType;
    [self.navigationController pushViewController:registerController animated:YES];
}

//登录
-(void)loginAction{

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)closeAction{

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIBarButtonItem *)closeBarButton{

    if (!_closeBarButton) {
        _closeBarButton =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"login_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(closeAction)];
    }
    return _closeBarButton;
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
