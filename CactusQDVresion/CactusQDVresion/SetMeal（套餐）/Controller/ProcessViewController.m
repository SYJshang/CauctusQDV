//
//  ProcessViewController.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/4/29.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "ProcessViewController.h"


@interface ProcessViewController ()<UIWebViewDelegate>

@end

@implementation ProcessViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"套餐流程";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5,20 ,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
     [self loadNetWorking];

}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

}
- (void)loadNetWorking{
    _web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"http://m.xrzmall.com/case/"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_web loadRequest:urlRequest];
    _web.delegate = self;
   
    [self.view addSubview:_web];
    
}
- (void)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
  
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
