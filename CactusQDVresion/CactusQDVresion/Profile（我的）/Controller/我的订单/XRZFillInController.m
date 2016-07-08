//
//  XRZFillInController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZFillInController.h"
#import "SaveNameFirstCell.h"
#import "XRZTextFiledCell.h"
#import "SaveNameFiveCell.h"

@interface XRZFillInController ()

@end

@implementation XRZFillInController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"订单详情填写" font:20];

    
    [self setNavition];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFirstCell" bundle:nil] forCellReuseIdentifier:@"first"];
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZTextFiledCell" bundle:nil] forCellReuseIdentifier:@"text"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFiveCell" bundle:nil] forCellReuseIdentifier:@"five"];
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
    //    [btn1 setTitle:@"保存" forState:UIControlStateNormal];
    [btn1 setTitle:@"保存" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(finfish) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)finfish{
    
    XRZLog(@"保存信息");
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row >= 0 && indexPath.row < 5) {
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first"];
        cell.titleText.text = @"风格";
        cell.textField.placeholder = @"请输入装修风格";
        return cell;
    }else if (indexPath.row == 5){
        
        XRZTextFiledCell *cell = [tableView dequeueReusableCellWithIdentifier:@"text"];
        
        cell.textView.textColor = [UIColor grayColor];
        cell.textView.text = @"输入个人信息。。。";
        return cell;
        
    }else if (indexPath.row == 6){
        
        SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five"];
        [cell.btn setTitle:@"提交" forState:UIControlStateNormal];
        cell.btn.layer.masksToBounds = YES;
        cell.btn.layer.cornerRadius = 20;
        
        [cell.btn addTarget:self action:@selector(finfish) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 5) {
        return 80;
    }else if (indexPath.row == 6){
        
        return 90;
    }
    return 50;
}



@end
