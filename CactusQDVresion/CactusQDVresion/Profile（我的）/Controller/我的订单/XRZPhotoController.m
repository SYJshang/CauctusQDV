//
//  XRZPhotoController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZPhotoController.h"
#import "LQPhotoPickerViewController.h"

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height//获取设备高度
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width//获取设备宽度


@interface XRZPhotoController ()<LQPhotoPickerViewDelegate>

{
    
    //备注文本View高度
    float noteTextHeight;
    
    float pickerViewHeight;
    float allViewHeight;
    
}

@end

@implementation XRZPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //收起键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    
    
    /**
     *  依次设置
     */
    self.LQPhotoPicker_superView = _scroller;
    
    self.LQPhotoPicker_imgMaxCount = 20;
    
    [self LQPhotoPicker_initPickerView];
    
    self.LQPhotoPicker_delegate = self;
    
    
    
    [self initViews];
    
    [self setNavition];

    
    // Do any additional setup after loading the view from its nib.
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
    [btn1 setTitle:@"上传" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(finfish) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)finfish{
    
    XRZLog(@".....");
}



- (void)viewTapped{
    [self.view endEditing:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"caseLogNeedRef" object:nil];
}

- (void)initViews{
    
    
    _submitBtn = [[UIButton alloc]init];
    [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitBtn setBackgroundColor:HWColor(63, 203, 125)];
    _submitBtn.layer.masksToBounds = YES;
    _submitBtn.layer.cornerRadius = 20;
    [_submitBtn addTarget:self action:@selector(submitBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    


    [self.view addSubview:_submitBtn];
    
    
    [self updateViewsFrame];
}
- (void)updateViewsFrame{
    
    if (!allViewHeight) {
        allViewHeight = 0;
    }
    if (!noteTextHeight) {
        noteTextHeight = 100;
    }
    
    
    //提交按钮
    _submitBtn.bounds = CGRectMake(10, ScreenH - 60, ScreenW -20, 40);
    _submitBtn.frame = CGRectMake(10, ScreenH - 60, ScreenW -20, 40);
    
    
    allViewHeight = [self LQPhotoPicker_getPickerViewFrame].size.height + 30 + 100;
    
    _scroller.contentSize = self.scroller.contentSize = CGSizeMake(0,allViewHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (void)submitBtnClicked{
    
    XRZLog(@"........");

//    [self submitToServer];
}



#pragma mark - 上传数据到服务器前将图片转data（上传服务器用form表单：未写）
//- (void)submitToServer{
//    NSMutableArray *bigImageArray = [self LQPhotoPicker_getBigImageArray];
//    //大图数据g
//    NSMutableArray *bigImageDataArray = [self LQPhotoPicker_getBigImageDataArray];
//    
//    //小图数组
//    NSMutableArray *smallImageArray = [self LQPhotoPicker_getSmallImageArray];
//    
//    //小图数据
//    NSMutableArray *smallImageDataArray = [self LQPhotoPicker_getSmallDataImageArray];
//    
//    
//    
//}

- (void)LQPhotoPicker_pickerViewFrameChanged{
    [self updateViewsFrame];
}


@end
