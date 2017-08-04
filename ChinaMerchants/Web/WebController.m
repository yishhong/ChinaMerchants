//
//  WebController.mController
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/4.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "WebController.h"
#import "WebViewModel.h"

@interface WebController ()<UIWebViewDelegate>

@property (nonatomic, strong) WebViewModel *viewModel;

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation WebController

+ (instancetype)instantiation{
    return [[WebController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    self.webView.delegate =self;
        NSString * path =[[NSBundle mainBundle] bundlePath];
        NSURL *baseURL =[NSURL fileURLWithPath:path];
        NSString * htmlPath =[[NSBundle mainBundle]pathForResource:@"xieyi" ofType:@"html"];
        NSString * htmlCont =[NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
        [self.webView loadHTMLString:htmlCont baseURL:baseURL];
    [self.view addSubview:self.webView];
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
