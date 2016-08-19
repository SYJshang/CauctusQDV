//
//  XRZOrdeFomeController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZOrdeFomeController.h"
#import "XRZTableVC.h"
#import "XRZPlateformCell.h"
#import "XRZFormController.h"
#import "XRZBtn.h"


#define FILTERCONTENTHIGHT 266


@interface XRZOrdeFomeController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *table;

//项目经理
@property (nonatomic, strong) UIButton    *manger;
//装修公司
@property (nonatomic, strong) UIButton    *company;
//设计师
@property (nonatomic, strong) UIButton    *stylist;
//工人
@property (nonatomic, strong) UIButton    *workers;

//点击工人选择背景
@property (nonatomic, strong) UIView      *workerBG;
@property (nonatomic, strong) UIView      *btnBG;


@end

@implementation XRZOrdeFomeController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpView];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"平台总订单" font:20];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104 - 48) style:UITableViewStylePlain];
    self.table = tableView;
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorStyle = NO;
    [self.view addSubview:self.table];
    
    [self.table registerClass:[XRZPlateformCell class] forCellReuseIdentifier:@"cell"];
}


- (void)setUpView
{
    //创建btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"项目经理" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 60, ScreenW / 4, 44);
    [self.view addSubview:btn];
    btn.tag = 1;
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.manger = btn;
    [self.manger setBackgroundColor:HWColor(245, 245, 245)];
    [_manger setTitleColor:HWColor(63, 203, 125)forState:UIControlStateNormal];
    _manger.titleLabel.font = [UIFont systemFontOfSize:14];
    _manger.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"装修公司" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(ScreenW / 4, 60, ScreenW / 4, 44);
    [self.view addSubview:btn1];
    btn1.backgroundColor = [UIColor whiteColor];
    btn1.tag = 2;
    [btn1 addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.company = btn1;
    [self.company setBackgroundColor:HWColor(245, 245, 245)];
    [self.company setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.company setTitleColor: HWColor(63, 203, 125) forState:UIControlStateSelected];
    self.company.titleLabel.font = [UIFont systemFontOfSize:14];
    self.company.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
   
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"设计师" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(2 * ScreenW / 4, 60, ScreenW / 4, 44);
    [self.view addSubview:btn2];
    btn2.backgroundColor = [UIColor whiteColor];
    btn2.tag = 3;
    [btn2 addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.stylist = btn2;
    [self.stylist setBackgroundColor:HWColor(245, 245, 245)];
    [self.stylist setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.stylist setTitleColor: HWColor(63, 203, 125) forState:UIControlStateSelected];
    self.stylist.titleLabel.font = [UIFont systemFontOfSize:14];
    self.stylist.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    XRZBtn *btn3 = [XRZBtn buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"工人" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.frame = CGRectMake(3 * ScreenW / 4, 60, ScreenW / 4, 44);
    btn3.backgroundColor = [UIColor whiteColor];
    [btn3 setImage:[UIImage imageNamed:@"下拉箭头"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"形状-4"] forState:UIControlStateSelected];
    [btn3 setImageEdgeInsets:UIEdgeInsetsMake(11, 75, 11, 0)];
    [btn3 setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:btn3];
    btn3.tag = 4;
    [btn3 addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.workers = btn3;
    [self.workers setBackgroundColor:HWColor(245, 245, 245)];
    [self.workers setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.workers setTitleColor: HWColor(63, 203, 125) forState:UIControlStateSelected];
    self.workers.titleLabel.font = [UIFont systemFontOfSize:14];
    self.workers.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    //添加中间view
    for (int i = 0; i < 4; i ++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake((i + 1) * (ScreenW / 4), 70, 1, 20)];
        [view setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:view];
    }
}

- (void)action:(UIButton *)btn{
    
    XRZLog(@"..........");
    
}


- (void)onClickButtonAction:(UIButton *)button
{
    XRZLog(@"1111111111");

    switch (button.tag) {
        case 1:
        {
            if (button.selected == NO) {
                button.selected = YES;
                [button setTitleColor:HWColor(63, 203, 125) forState:UIControlStateSelected];
                self.company.selected = NO;
                self.stylist.selected = NO;
                self.workers.selected = NO;
                [self.table reloadData];
            }
        
        }
            break;
        case 2:
        {
            if (button.selected == NO) {
                button.selected = YES;
                self.manger.selected = NO;
                [self.manger setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                self.stylist.selected = NO;
                self.workers.selected = NO;
            }
        }
            break;
        case 3:
        {
            if (button.selected == NO) {
                button.selected = YES;
                self.manger.selected = NO;
                [self.manger setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                self.company.selected = NO;
                self.workers.selected = NO;
            }
        }
            break;
        case 4:
        {
                button.selected = YES;
                self.manger.selected = NO;
                [self.manger setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                self.company.selected = NO;
                self.stylist.selected = NO;
                
                UIView *bg = [[UIView alloc]init];
                bg.frame = CGRectMake(0, 0, ScreenW, ScreenH);
                [self.view addSubview:bg];
                bg.backgroundColor = HWColor(193, 193, 193);
                bg.alpha = 0.6;
                self.workerBG = bg;
                
                UIView *view = [[UIView alloc]init];
                view.frame = CGRectMake(0, 104, ScreenW, 200);
                [self.view addSubview:view];
                view.backgroundColor = HWColor(240, 240, 240);
                self.btnBG = view;
            
                NSArray *arr = @[@"水电工",@"泥工",@"木工",@"油漆工"];
                for (int i = 0; i < 4; i ++) {
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                    btn.frame = CGRectMake(10, i * 50, ScreenW, 50);
                    [btn setTitle:arr[i] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                    [btn setTitleColor: HWColor(63, 203, 125) forState:UIControlStateSelected];
                    [btn setBackgroundColor:HWColor(240, 240, 240)];
                    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                    btn.titleLabel.font = [UIFont systemFontOfSize:14];
                    btn.tag = 100 + i;
                    [btn addTarget:self action:@selector(workerBtn:) forControlEvents:UIControlEventTouchUpInside];
                    [view addSubview:btn];
                    
                    UIView *line = [[UIView alloc]init];
                    line.frame = CGRectMake(0,i * 50, ScreenW, 1);
                    line.backgroundColor = HWColor(63, 203, 125);
                    [view addSubview:line];
                
            }
        }
            break;
        default:
            break;
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    
    self.workerBG.hidden = YES;
    self.btnBG.hidden = YES;
}


- (void)workerBtn:(UIButton *)btn{
    
    [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateSelected];
    self.workers.titleLabel.text = btn.titleLabel.text;
    self.workerBG.hidden = YES;
    self.btnBG.hidden = YES;
    
    switch (btn.tag) {
        case 100:
            [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateSelected];
            self.workers.titleLabel.text = btn.titleLabel.text;
            self.workerBG.hidden = YES;
            self.btnBG.hidden = YES;
            break;
        case 101:
            self.workers.titleLabel.text = btn.titleLabel.text;
            break;
        case 102:
            self.workers.titleLabel.text = btn.titleLabel.text;
            break;
        case 103:
            self.workers.titleLabel.text = btn.titleLabel.text;
            break;
    
}
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, ScreenW, 10);
    view.backgroundColor = HWColor(235, 235, 235);
//    self.table.tableHeaderView = view;
    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    XRZPlateformCell *cell           = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.bigView.image               = [UIImage imageNamed:@"95G58PIC4qb_1024"];
    cell.bigView.layer.masksToBounds = YES;
    cell.bigView.layer.cornerRadius  = cell.bigView.height / 2;
    cell.name.text                   = @"呆呆先生";
    cell.position.text               = @"项目经理";
    cell.adress.text                 = @"浙江鄞州区孵化";
    cell.area.text                   = @"四室二厅 160㎡";
    cell.time.text                   = @"2016/4/11 19:00";
    cell.state.text                  = @"完工";
    cell.state.backgroundColor       = HWColor(63, 202 ,125);
    cell.state.layer.masksToBounds   = YES;
    cell.state.layer.cornerRadius    = 12;
    cell.selectionStyle = NO;
//  cell.backgroundColor = HWColor(245, 245, 245);
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[XRZFormController new] animated:YES];
}


@end
