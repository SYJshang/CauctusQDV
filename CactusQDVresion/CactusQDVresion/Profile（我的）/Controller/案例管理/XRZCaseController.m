//
//  XRZCaseController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZCaseController.h"
#import "XRZAddCaseController.h"
#import "XRZCaseMangerController.h"

@interface XRZCaseController ()
@property (weak, nonatomic) IBOutlet UIButton *btnCase;

@end

@implementation XRZCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"添加案例" font:20];
    
    [self.btnCase addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self setNavition];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavition{
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"案例管理" font:20];
    
    //左边naVBar
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
    //右边NavBar
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW - 10, 5, 40,20)];
    [btn1 setTitle:@"添加" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
    
}



- (void)backBtn{
    
    XRZLog(@"...");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)action{
    
    XRZLog(@"界面跳转");
    [self.navigationController pushViewController:[XRZAddCaseController new] animated:YES];
}



@end
