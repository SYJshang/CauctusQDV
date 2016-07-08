//
//  XRZEditPhotoController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZEditPhotoController.h"
#import "UIView+SDAutoLayout.h"
#import "XRZAddEditController.h"

@interface XRZEditPhotoController ()

@end

@implementation XRZEditPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"编辑" font:20];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"添加编辑" forState:UIControlStateNormal];
    [btn setBackgroundColor:HWColor(63, 203, 125)];
    [self.view addSubview:btn];
    btn.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).heightIs(50).widthIs(150);
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    [self setNavition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setNavition{
    
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
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)action{
    
    [self.navigationController pushViewController:[XRZAddEditController new] animated:YES];
}
@end
