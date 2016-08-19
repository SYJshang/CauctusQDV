//
//  ApplyViewController.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "ApplyViewController.h"
#import "AFNetworking.h"

@interface ApplyViewController ()
{
    NSString *_string;
    NSMutableDictionary *_p;
}
@end

@implementation ApplyViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"套餐申请";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,20 ,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.cornerRadius = self.btn.frame.size.height/2.0;



}
//**********************套餐申请按钮*******************
- (IBAction)applyAction:(id)sender {
    NSLog(@"688套餐申请");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
