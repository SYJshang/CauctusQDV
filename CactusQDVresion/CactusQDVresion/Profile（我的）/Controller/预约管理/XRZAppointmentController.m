//
//  XRZAppointmentController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZAppointmentController.h"
#import "XRZAppointmentsCell.h"

@interface XRZAppointmentController ()

@end

@implementation XRZAppointmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZAppointmentsCell" bundle:nil] forCellReuseIdentifier:@"annointment"];
    
    [self setNavition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setNavition{
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"预约管理" font:20];

    
    
    
    //左边naVBar
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
}


- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRZAppointmentsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"annointment" forIndexPath:indexPath];

    cell.refuse.backgroundColor = [UIColor whiteColor];
    [cell.refuse setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
    
    
    [cell.refuse.layer setMasksToBounds:YES];
    [cell.refuse.layer setCornerRadius:15];
    [cell.refuse.layer setBorderColor:HWColor(63, 203, 125).CGColor];
    [cell.refuse.layer setBorderWidth:1];
    
    cell.accept.layer.masksToBounds =YES;
    cell.accept.layer.cornerRadius = 15;
    [cell.accept setBackgroundColor:HWColor(63, 203, 125)];
    
    cell.icon.layer.masksToBounds =YES;
    cell.icon.layer.cornerRadius = 45;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


@end
