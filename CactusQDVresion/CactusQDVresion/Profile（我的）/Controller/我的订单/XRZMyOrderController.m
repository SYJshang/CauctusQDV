//
//  XRZMyOrderController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZMyOrderController.h"
#import "XRZDetailedController.h"
#import "UIBarButtonItem+XRZNavitionBar.h"

#import "XRZProcessCell.h"
#import "XRZFinishCell.h"
#import "XRZFillInController.h"

#import "SliderButtonView.h"
#import "SliderScrollView.h"

@interface XRZMyOrderController ()


@property (nonatomic, strong) XRZFinish *finshView;
@property (nonatomic, strong) XRZProcess *processView;

@end

@implementation XRZMyOrderController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"我的订单" font:20];
    
    self.view.backgroundColor = HWColor(242, 242, 242);
    
    [self setUpView];

    
    
    //左边naVBar
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
}

- (void)actionBack:(UIBarButtonItem *)item{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUpView
{
    
    
    // 建三个view
    XRZProcess *view1 = [[XRZProcess alloc] initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
    view1.tiaozhuanDelegate = self;
    view1.backgroundColor = HWColor(247, 247, 247);
    
    XRZFinish *view2 = [[XRZFinish alloc] initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
    view2.tiaozhuanDelegate = self;
    view2.backgroundColor = HWColor(247, 247, 247);;
    
    NSArray *viewArray = @[view1, view2];
    
    // 建两个按钮
    
    SliderScrollView *slis = [[SliderScrollView alloc] initWithFrame:CGRectMake(0, 64 + 44, ScreenW, ScreenH - 108) withViewArray:viewArray];
    [self.view addSubview:slis];
    
    
    
    SliderButtonView *sli = [[SliderButtonView alloc] initWithFrame:CGRectMake(0, 64,ScreenW, 44) withButtonNames:@[@"进行中", @"已完成"]];
    [self.view addSubview:sli];

    
    slis.get_Index_Block = ^(NSInteger index){
        sli.index = index;
    };
    sli.button_selected_block = ^(NSInteger tag) {
        slis.scr.contentOffset = CGPointMake(tag * ScreenW, 0);

    };
}




- (void)skipInterface:(NSString *)title{
    
    XRZLog(@">>>>>>>>>>>>>%@",title);
    
    XRZDetailedController *fillIn = [[XRZDetailedController alloc]init];
    [self.navigationController pushViewController:fillIn animated:YES];
}

#if 0
- (void)addView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenW, 44)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, ScreenW / 2, view.height);
    [leftBtn setTitle:@"进行中" forState:UIControlStateNormal];
    [leftBtn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 1;
    [view addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(ScreenW / 2, 0, ScreenW / 2, view.height);
    [rightBtn setTitle:@"已完成" forState:UIControlStateNormal];
    [rightBtn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 2;
    [view addSubview:rightBtn];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(ScreenW / 2,10,1, 24)];
    line.backgroundColor = [UIColor grayColor];
    [view addSubview:line];
    
    
    
    XRZProcess *process = [[XRZProcess alloc]initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
    [self.view addSubview:process];

}

- (void)BtnClick:(UIButton *)btn{
    if (btn.tag == 1) {
        
        
        XRZProcess *process = [[XRZProcess alloc]initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
        [self.view addSubview:process];
    }else if (btn.tag == 2){
        XRZFinish *finish = [[XRZFinish alloc]initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
        [self.view addSubview:finish];
    }
}




#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([XRZFinish class]){
        return 1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if ([XRZProcess class]) {
//        return 10;
//    }
    if ([XRZFinish class]){
        return 10;
    }
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([XRZFinish class]) {
        XRZFinishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"finish"];
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 5)];
            view.backgroundColor = [UIColor colorWithRed:74.0/255 green:56.0/255 blue:58.0/255 alpha:1.0];
            [cell.contentView addSubview:view];
            return cell;
    }
        XRZProcessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"process"];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 5)];
        view.backgroundColor = [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1.0];
        [cell.contentView addSubview:view];
        return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([XRZFinish class]){
        
        return 162;
    }
    return 120;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self.navigationController pushViewController:[XRZDetailedController new] animated:YES];
    
}

#endif






@end
