//
//  XRZSetUpController.m
//  CactusQDVresion
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 尚勇杰. All rights reserved.
//

#import "XRZSetUpController.h"
#import "XRZSetUpCell.h"
#import "SaveNameFiveCell.h"
#import "DataManager.h"
#import "XRZLoginIDController.h"
#import "SDImageCache.h"

@interface XRZSetUpController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabelview;

@end

@implementation XRZSetUpController


#pragma mark - Life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.edgesForExtendedLayout=UIRectEdgeBottom;
    self.automaticallyAdjustsScrollViewInsets  = NO;

    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"个人界面" font:20];
    self.view.backgroundColor = [UIColor whiteColor];
    //左边naVBar
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
    // You should add subviews here, just add subviews
    
    // layout subviews
    [self layoutSubviews];
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)layoutSubviews {
    
    self.tabelview = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, ScreenW, ScreenH) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tabelview];
    self.tabelview.delegate = self;
    self.tabelview.dataSource = self;
    self.tabelview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //cell注册
    [self.tabelview registerClass:[XRZSetUpCell class] forCellReuseIdentifier:@"cell"];
    [self.tabelview registerNib:[UINib nibWithNibName:@"SaveNameFiveCell" bundle:nil] forCellReuseIdentifier:@"five"];

    
}

#pragma mark - SystemDelegate

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 1;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        XRZSetUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.title.text = @"当前版本";
        cell.vresion.text = @"1.0";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }else if (indexPath.section == 0 && indexPath.row == 1){
        XRZSetUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.title.text = @"最新版本";
        cell.vresion.text = @"1.0";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }else if (indexPath.section == 1 && indexPath.row ==0){
        
        XRZSetUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.title.text = @"清理内存";
        cell.vresion.text = [NSString stringWithFormat:@"%.2f M", [[SDImageCache sharedImageCache] getSize]/1024.f/1024.f];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        
        SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five"];
        [cell.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.btn setTitle:@"退出登录" forState:UIControlStateNormal];
        cell.btn.layer.masksToBounds = YES;
        cell.btn.layer.cornerRadius = 20;
        cell.btn.frame = cell.frame;
        cell.btn.backgroundColor = [UIColor redColor];
        cell.btn.titleLabel.font = [UIFont systemFontOfSize:18];

        [cell.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabel"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0) {
        return 80;
    }else{
        return 40;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 40;
    }else if (section == 0) {
      return 0;
        
    }else{
        return 20;
    }
}



- (void)btnClick
{
    [[DataManager shareManager] deleteUsernameAndPassword];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:[XRZLoginIDController new] animated:YES];
    
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if ( indexPath.section == 1 && indexPath.row == 0) {
        //清除缓存的工作
        [[SDImageCache sharedImageCache] clearDisk];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清理完成" message:@"清理数据完成" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        [self.tabelview reloadData];

    }
}




#pragma mark - CustomDelegate



#pragma mark - Event response
// button、gesture, etc


#pragma mark - Private methods



#pragma mark - Getters & Setters
// initialize views here, etc



#pragma mark - MemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
