//
//  AuthCodeController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "AuthCodeController.h"
#import "AuthCodeViewModel.h"
#import "Masonry.h"
#import "UIColor+HUE.h"

@interface AuthCodeController ()

@property (nonatomic, strong) AuthCodeViewModel *viewModel;

@property (strong, nonatomic) UITextField * authCodeTextField;

@property (strong, nonatomic) UIButton * nextButton;

@end

@implementation AuthCodeController

+ (instancetype)instantiation{

    return [[AuthCodeController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[AuthCodeViewModel alloc] init];
    [self setUI];
}

-(void)setUI{
    
    self.authCodeTextField =[[UITextField alloc]init];
    //    self.phoneTextField.delegate =self;
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
        make.top.equalTo(self.view).offset(35+64);
        make.width.mas_offset(self.view.bounds.size.width-180);
        make.height.mas_offset(40);
        make.left.mas_offset(90);
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
        make.top.mas_equalTo(self.authCodeTextField.mas_bottom).offset(30);
        make.left.mas_offset(25);
        make.width.mas_offset(self.view.bounds.size.width-50);
        make.height.mas_offset(45);
    }];
}

-(void)nextAction{

    
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
