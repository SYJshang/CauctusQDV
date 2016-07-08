//
//  XRZProfileController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZProfileController.h"
#import "XRZTableViewCell.h"
#import "XRZTextCell.h"
#import "XRZSecondController.h"
#import "XRZMyOrderController.h"
#import "XRZPriceController.h"
#import "XRZAppointmentController.h"
#import "XRZCaseController.h"
#import "XRZCaseMangerController.h"
#import "XRZProfileMessageController.h"
#import "XRZPhotoController.h"
#import "SaveNameFiveCell.h"
#import "XRZLoginIDController.h"
#import "XRZDetailedController.h"
#import "XRZWeAreController.h"
#import "XRZTestController.h"
#import "XRZSetUpController.h"
#import "DataManager.h"


@interface XRZProfileController ()
//第二个row的个数
@property (nonatomic, strong) NSArray *section1;
//第三组的row的个数
@property (nonatomic, strong) NSArray *section2;

@property (nonatomic, strong) NSArray *photo1;

@property (nonatomic, strong) NSArray *photo2;

@property (nonatomic, strong) NSString *number;


@end

@implementation XRZProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"个人界面" font:20];

    
    self.section1 = @[@"通知消息",@"我的订单",@"我的报价",@"预约管理",@"案例管理"];
    self.section2 = @[@"实名认证",@"关于我们",@"我的设置"];
    self.photo1 = @[@"我的_通知消息",@"我的_我的订单",@"我的_我的报价",@"我的_预约管理",@"我的_案例管理"];
    self.photo2 = @[@"我的_实名认证",@"我的_关于我们",@"我的_设置"];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFiveCell" bundle:nil] forCellReuseIdentifier:@"five"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return self.section1.count;
    }else if (section == 2){
        return self.section2.count;
    }else{
    return 1;
  }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        XRZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
        cell = [[XRZTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        cell.headerPhoto.layer.masksToBounds = YES;
        cell.headerPhoto.layer.cornerRadius = 90 / 2;
        
        cell.testPhoto.layer.masksToBounds = YES;
        cell.testPhoto.layer.cornerRadius = 25 / 2;
        
        cell.headerPhoto.image = [UIImage imageNamed:@"0导航页"];
        cell.testPhoto.image = [UIImage imageNamed:@"我的_未认证"];
        cell.nameLabel.text = @"阿斯蒂芬";
        cell.position.text = @"[设计师]";
        
        cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的_进入箭头"]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
            cell.textLabel.text = self.section1[indexPath.row];
            cell.imageView.image = [UIImage imageNamed:self.photo1[indexPath.row]];
            
            UIView *view = [[UIView alloc]init];
            view.frame = CGRectMake(5, 10, 8, 8);
            view.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:view];
            [view.layer setMasksToBounds:YES];
            [view.layer setCornerRadius:4];

            
            
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的_进入箭头"]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        return cell;
    }
    
    if (indexPath.section == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdenti"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdenti"];
                cell.textLabel.text = self.section2[indexPath.row];
                cell.imageView.image = [UIImage imageNamed:self.photo2[indexPath.row]];
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            UIView *view = [[UIView alloc]init];
            view.frame = CGRectMake(5, 10, 8, 8);
            view.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:view];
            [view.layer setMasksToBounds:YES];
            [view.layer setCornerRadius:4];
            
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的_进入箭头"]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        return cell;
    }
    
    if (indexPath.section == 3) {
        XRZTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"phone"];
        if (cell == nil) {
            cell = [[XRZTextCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"phone"];
        }
        cell.icon.image = [UIImage imageNamed:@"我的_加盟热线"];
        cell.numLabel.text = @"0574-88138352";
        self.number = cell.numLabel.text;
        cell.descLabel.text = @"加盟热线";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
//    if (indexPath.section == 4) {
//        SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five"];
//        [cell.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [cell.btn setTitle:@"退出登录" forState:UIControlStateNormal];
//        cell.btn.layer.masksToBounds = YES;
//        cell.btn.layer.cornerRadius = 20;
//        cell.btn.frame = cell.frame;
//        cell.btn.backgroundColor = [UIColor redColor];
//        cell.btn.titleLabel.font = [UIFont systemFontOfSize:18];
//        
//        [cell.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//        return cell;
//    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablecell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}


- (void)btnClick
{
    [[DataManager shareManager] deleteUsernameAndPassword];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:[XRZLoginIDController new] animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 137;
    }else if (indexPath.section == 4 && indexPath.row == 0){
        return 80;
    }
    return 50;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 4) {
        return 40;
    }
    return 10;
}
//选中方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3 && indexPath.row == 0) {
        
    XRZLog(@"拨打电话");
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否拨打 0574-88138352" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.number]]];
        }];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:action1];
        [alert addAction:action];
     

        
        [self presentViewController:alert animated:YES completion:^{
            
        }];


    }else if (indexPath.section == 1 && indexPath.row == 0){
        
        [self.navigationController pushViewController:[XRZSecondController new] animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 1){
        [self.navigationController pushViewController:[XRZMyOrderController new] animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 2){
        [self.navigationController pushViewController:[XRZPriceController new] animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 3){
        [self.navigationController pushViewController:[XRZAppointmentController new] animated:YES];
    
    }else if (indexPath.section == 1 && indexPath.row == 4){
        [self.navigationController pushViewController:[XRZCaseMangerController new] animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 0){
        
        [self.navigationController pushViewController:[XRZProfileMessageController new] animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 1){
        
        [self.navigationController pushViewController:[XRZWeAreController new] animated:YES];
    }else if (indexPath.section == 2 && indexPath.row ==0){
        
        [self.navigationController pushViewController:[XRZTestController new] animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 2){
        [self.navigationController pushViewController:[XRZSetUpController new] animated:YES];
    }
    
}



@end
