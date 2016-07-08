//
//  XRZWeAreController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZWeAreController.h"
#import "MBProgressHUD.h"

#define WEBURL @"http://m.xrzmall.com/about/"

@interface XRZWeAreController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webview;

@property (nonatomic, strong) MBProgressHUD *hub;

@end

@implementation XRZWeAreController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"关于我们" font:20];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webview = [[UIWebView alloc]init];
    self.webview.frame = self.view.frame;
    [self.view addSubview:self.webview];
    self.webview.delegate = self;
    self.webview.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL URLWithString:WEBURL];
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    
    self.hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    self.hub.labelText = NSLocalizedString(@"正在加载...", @"正在加载");
}


- (void)actionBack:(UIBarButtonItem *)item{
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - webView delegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    XRZLog(@"webViewDidStartLoad");
    
}

- (void)webViewDidFinishLoad:(UIWebView *)web{
    
    XRZLog(@"webViewDidFinishLoad");
    
    [self.hub hide:YES];
}

-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    XRZLog(@"DidFailLoadWithError");
    
}






@end
