//
//  XRZAddCaseController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZAddCaseController.h"
#import "SaveNameFirstCell.h"
#import "SaveNameFiveCell.h"
#import "UINavigationItem+XRZItemTitle.h"

@interface XRZAddCaseController ()

@end

@implementation XRZAddCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"添加案例" font:20];

    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFirstCell" bundle:nil] forCellReuseIdentifier:@"first"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFiveCell" bundle:nil] forCellReuseIdentifier:@"five"];
    
    [self setNavition];
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
    [btn1 setTitle:@"提交" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)action{
    XRZLog(@"提交");
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (section == 0) {
        return 2;
    }else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first"];
        cell.textField.placeholder = @"请输入案例名称";
        cell.titleText.text = @"案例名称";
        return cell;
    }else if (indexPath.section == 0 && indexPath.row == 1){
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first"];
        cell.textField.placeholder = @"如:浙江省宁波市鄞州区金星小区";
        cell.titleText.text = @"小区";
        return cell;
    }
    SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five"];
    cell.btn.titleLabel.text = @"上传图片";
    cell.btn.backgroundColor = HWColor(63, 202, 125);
    cell.btn.layer.masksToBounds = YES;
    cell.btn.layer.cornerRadius = 15;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44;
    }else{
        return 88;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }else{
        return ScreenW;
    }

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
