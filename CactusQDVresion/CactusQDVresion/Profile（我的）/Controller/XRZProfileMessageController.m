//
//  XRZProfileMessageController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/17.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZProfileMessageController.h"
#import "SaveNameFirstCell.h"
#import "XRZProfileIconCell.h"
#import "XRZTextFiledCell.h"
#import "SaveNameFiveCell.h"
#import "XRZTextView.h"
#import "BRPlaceholderTextView.h"

@interface XRZProfileMessageController ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) BRPlaceholderTextView *text;

@end

@implementation XRZProfileMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"个人编辑" font:20];

    
    [self setNavition];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZProfileIconCell" bundle:nil] forCellReuseIdentifier:@"revise"];
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
    [btn1 setTitle:@"保存" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(finfish) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.tableView endEditing:YES];
}

//- (void)touch


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        XRZProfileIconCell *cell = [tableView dequeueReusableCellWithIdentifier:@"revise"];
        
        cell.BgView.layer.masksToBounds = YES;
        cell.BgView.layer.cornerRadius = 55;
        
        cell.icon.layer.masksToBounds = YES;
        cell.icon.layer.cornerRadius = 105 / 2;
        cell.icon.image = [UIImage imageNamed:@"icon1"];
        self.iconView = cell.icon;
        
        [cell.btnClick addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else if (indexPath.row < 4 && indexPath.row > 0){
        
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first"];
        NSArray *array = @[@"昵称",@"职称",@"手机号"];
        NSArray *arr = @[@"请输入昵称",@"请输入职称",@"请输入手机号"];
        cell.titleText.text = array[indexPath.row - 1];
        cell.textField.placeholder = arr[indexPath.row - 1];
        
        return cell;
    }else if (indexPath.row == 4)
    {
        XRZTextFiledCell *cell = [tableView dequeueReusableCellWithIdentifier:@"text"];
        self.text = (BRPlaceholderTextView *)cell.textView;
        self.text.placeholder = @"请输入个人描述信息。。。";
        return cell;
    }else if (indexPath.row == 5){
        SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five"];
        [cell.btn setTitle:@"保存并提交" forState:UIControlStateNormal];
        [cell.btn addTarget:self action:@selector(finfish) forControlEvents:UIControlEventTouchUpInside];
        cell.btn.layer.masksToBounds = YES;
        cell.btn.layer.cornerRadius = 20;
        return cell;
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 180;
    }else if (indexPath.row == 4){
        return 90;
    }else if (indexPath.row == 5){
        return 90;
    }
    return 45;
}


#pragma mark - btn点击事件

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)click{
    
    self.iconView.image = [UIImage imageNamed:@"icon2"];
}

- (void)finfish{
    XRZLog(@"完成。。。保存。。。");
}


@end
