//
//  XRZSecondController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZSecondController.h"
#import "SliderButtonView.h"
#import "SliderScrollView.h"
#import "XRZFillInController.h"
#import "XRZWrittenCell.h"
#import "XRZMyOrderController.h"



@interface XRZSecondController ()<WatchSkip>

@property (nonatomic, strong) UILabel *numBG;
@property (nonatomic, strong) XRZWrittenCell *cell;

@end

@implementation XRZSecondController

//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        self.hidesBottomBarWhenPushed = YES;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setNavition];
    [self setUpView];
    
    
}


- (void)setNavition{
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"我的消息" font:20];

    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
}


- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - delegate


- (void)setUpView
{
    
    
    // 建三个view
    XRZStarvTV *view3 = [[XRZStarvTV alloc] initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
    view3.backgroundColor = HWColor(247, 247, 247);
    
    XRZPalletTV *view1 = [[XRZPalletTV alloc] initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
    view1.backgroundColor = HWColor(247, 247, 247);;
    
    XRZWrittenTV *view2 = [[XRZWrittenTV alloc] initWithFrame:CGRectMake(0, 104, ScreenW, ScreenH - 104)];
    view2.tiaozhuan = self;
    view2.backgroundColor = HWColor(247, 247, 247);;
    NSArray *viewArray = @[view1, view2, view3];
    
    // 建三个按钮
    
    SliderScrollView *slis = [[SliderScrollView alloc] initWithFrame:CGRectMake(0, 64 + 44, ScreenW, ScreenH - 44) withViewArray:viewArray];
    [self.view addSubview:slis];
    
    
    
    SliderButtonView *sli = [[SliderButtonView alloc] initWithFrame:CGRectMake(0, 64,ScreenW, 44) withButtonNames:@[@"抢单提醒", @"签单提醒", @"平台消息"]];
    [self.view addSubview:sli];

    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 3 ; i++) {
        UILabel *cutdown = [[UILabel alloc]init];
        cutdown.frame = CGRectMake( (i + 1) * (ScreenW / 3) - 25,5, 15,15);
        cutdown.font = [UIFont systemFontOfSize:15];
        cutdown.textColor = [UIColor whiteColor];
        cutdown.textAlignment = NSTextAlignmentCenter;
        cutdown.text = @"9";
        cutdown.backgroundColor = HWColor(251, 108, 112);
        [sli addSubview:cutdown];
        cutdown.tag = i + 1;
        [cutdown.layer setMasksToBounds:YES];
        [cutdown.layer setCornerRadius:15 / 2];
        self.numBG = cutdown;
        [array addObject:cutdown];
    }
    
    UILabel *label = array[0];
    label.hidden = YES;

    slis.get_Index_Block = ^(NSInteger index){
        sli.index = index;
    };
    sli.button_selected_block = ^(NSInteger tag) {
        slis.scr.contentOffset = CGPointMake(tag * ScreenW, 0);
        UILabel *label = array[tag];
        label.hidden = YES;
    };
}


- (void)btnClick{
    XRZLog(@"点击了btn");
}


- (void)SkipController{
    
    [self.navigationController pushViewController:[XRZMyOrderController new] animated:YES];
}


@end
