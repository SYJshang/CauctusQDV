//
//  XRZCaseMangerController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZCaseMangerController.h"
#import "XRZCaseMangerCell.h"
#import "XRZEditPhotoController.h"

@interface XRZCaseMangerController ()

@end

@implementation XRZCaseMangerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"案例管理" font:20];

    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZCaseMangerCell" bundle:nil] forCellReuseIdentifier:@"case"];
    
    [self setNavition];
}


- (void)setNavition{
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
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    XRZCaseMangerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"case"];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 5)];
    view.backgroundColor = HWColor(242, 242, 242);
    [cell.contentView addSubview:view];
    
    [cell.edit addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.edit.layer setMasksToBounds:YES];
    [cell.edit.layer setCornerRadius:12];
    [cell.edit setBackgroundColor:HWColor(63, 203, 125)];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[XRZEditPhotoController new] animated:YES];
}

- (void)btnClick{
    
    [self.navigationController pushViewController:[XRZEditPhotoController new] animated:YES];

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
