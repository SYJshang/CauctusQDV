//
//  XRZFormController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZFormController.h"
#import "WyzAlbumViewController.h"
#import "UIView+SDAutoLayout.h"


@interface XRZFormController ()

@property(nonatomic,strong) NSMutableArray  *imageNames;
@property(nonatomic,strong) NSMutableArray  *urlArrays;


@end

@implementation XRZFormController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;

    //设置圆角
    [self setLaout];
    
    
    [self setNavition];
    
    self.urlArrays=[[NSMutableArray alloc] init];
    self.imageNames=[[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    //第一种方式
    [self.urlArrays addObject:@"http://images.hongfanginv.com/2015/11/1447318757.jpg"];
    [self.urlArrays addObject:@"http://pic2.ooopic.com/01/03/51/25b1OOOPIC19.jpg"];
    [self.urlArrays addObject:@"http://www.xxjxsj.cn/article/UploadPic/2009-10/200910321242159016.jpg"];
    
    [self.imageNames addObject:@"图片1"];
    [self.imageNames addObject:@"图片2"];
    [self.imageNames addObject:@"图片3"];
}


- (void)setNavition{
    
    
    self.view.backgroundColor     = [UIColor whiteColor];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"交易订单" font:20];
    
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

//设置图片的圆角
- (void)setLaout{
    
    
    float space = 1.0 / 19.0;
    float widthIocn = (175.0 / 750.0);
    //图片1
    UIImage *image = [UIImage imageNamed:@"95G58PIC4qb_1024"];
    self.icon1 = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:self.icon1];
    self.icon1.sd_layout.leftSpaceToView(self.view,(1.0 / 10.0) * ScreenW).topSpaceToView(self.view,space * ScreenH + 64).heightIs((175.0 / 750.0) * ScreenW).widthIs(widthIocn * ScreenW);
    [self.icon1.layer setMasksToBounds:YES];
    [self.icon1.layer setCornerRadius:self.icon1.bounds.size.height / 2.0];
    [self.icon1.layer setBorderColor:HWColor(152, 230, 188).CGColor];
    [self.icon1.layer setBorderWidth:3];
    
    //图片2
    UIImage *image1 = [UIImage imageNamed:@"95G58PIC4qb_1024"];
    self.icon2 = [[UIImageView alloc]initWithImage:image1];
    [self.view addSubview:self.icon2];
    self.icon2.sd_layout.centerYEqualToView(self.icon1).rightSpaceToView(self.view,(1.0 / 10.0) * ScreenW).heightIs(widthIocn * ScreenW).widthIs(widthIocn * ScreenW);
    [self.icon2.layer setMasksToBounds:YES];
    [self.icon2.layer setCornerRadius:self.icon2.bounds.size.height / 2.0];
    [self.icon2.layer setBorderColor:HWColor(152, 230, 188).CGColor];
    [self.icon2.layer setBorderWidth:3];
    
    //双箭头
    UIImage *jiantou = [UIImage imageNamed:@"双箭头"];
    UIImageView *jian = [[UIImageView alloc]initWithImage:jiantou];
    [self.view addSubview:jian];
    jian.layer.masksToBounds = YES;
    self.jiantou = jian;
    self.jiantou.sd_layout.centerYEqualToView(self.icon1).leftSpaceToView(self.icon1,(50.0 / 750.0) * ScreenW).heightRatioToView(self.icon1,1.0 / 3.0).rightSpaceToView(self.icon2,(50.0 / 750.0) * ScreenW);
    //交易双方
    UILabel *cutdown = [[UILabel alloc]init];
    [self.view addSubview:cutdown];
    cutdown.font = [UIFont systemFontOfSize:12];
    cutdown.textColor = [UIColor blackColor];
    cutdown.text = @"交易双方";
    cutdown.textAlignment = NSTextAlignmentCenter;
    [self.jiantou addSubview:cutdown];
    self.dealLab = cutdown;
    self.dealLab.sd_layout.centerYEqualToView(self.jiantou).centerXEqualToView(self.jiantou).heightRatioToView(self.jiantou,1.0 / 2.0).widthRatioToView(self.jiantou,1.0);

    //名称左边
    self.dealLeftLab = [[UILabel alloc]init];
    [self.view addSubview:self.dealLeftLab];
    self.dealLeftLab.font = [UIFont boldSystemFontOfSize:16];
    self.dealLeftLab.textColor = [UIColor blackColor];
//    self.dealLeftLab.textAlignment = NSTextAlignmentCenter;
    self.dealLeftLab.text = @"呆呆先生";
    
    float top = (40.0 / 1330.0);
    self.dealLeftLab.sd_layout.leftEqualToView(self.icon1).topSpaceToView(self.icon1,top * ScreenH).widthRatioToView(self.icon1,1).heightIs(25);
    
    self.daalPositionLab = [[UILabel alloc]init];
    [self.view addSubview:self.daalPositionLab];
    self.daalPositionLab.font = [UIFont systemFontOfSize:12];
    self.daalPositionLab.textColor = [UIColor grayColor];
//    self.daalPositionLab.textAlignment = NSTextAlignmentCenter;
    self.daalPositionLab.text = @"项目经理";
    self.daalPositionLab.sd_layout.leftEqualToView(self.dealLeftLab).topSpaceToView(self.dealLeftLab,5).heightIs(15).widthRatioToView(self.dealLeftLab,4.0 / 5.0);
    
    UIImage *icon = [UIImage imageNamed:@"工人"];
    self.leftIcon = [[UIImageView alloc]initWithImage:icon];
    [self.view addSubview:self.leftIcon];
    self.leftIcon.sd_layout.leftSpaceToView(self.daalPositionLab,0).topEqualToView(self.daalPositionLab).widthRatioToView(self.dealLeftLab,1.0 / 5.0).heightRatioToView(self.daalPositionLab,1);
    
    //名称右边
    self.dealRightLab = [[UILabel alloc]init];
    [self.view addSubview:self.dealRightLab];
    self.dealRightLab.font = [UIFont boldSystemFontOfSize:16];
    self.dealRightLab.textColor = [UIColor blackColor];
//    self.dealRightLab.textAlignment = NSTextAlignmentCenter;
    self.dealRightLab.text = @"呆呆先生";
    
    float top1 = (40.0 / 1330.0);
    self.dealRightLab.sd_layout.leftEqualToView(self.icon2).topSpaceToView(self.icon2,top1 * ScreenH).widthRatioToView(self.icon2,1).heightIs(25);
    
    self.dealPositionRightLab = [[UILabel alloc]init];
    [self.view addSubview:self.dealPositionRightLab];
    self.dealPositionRightLab.font = [UIFont systemFontOfSize:12];
    self.dealPositionRightLab.textColor = [UIColor grayColor];
//    self.dealPositionRightLab.textAlignment = NSTextAlignmentCenter;
    self.dealPositionRightLab.text = @"项目经理";
    self.dealPositionRightLab.sd_layout.leftEqualToView(self.dealRightLab).topSpaceToView(self.dealRightLab,5).heightIs(15).widthRatioToView(self.dealRightLab,4.0 / 5.0);
    
    UIImage *icon1 = [UIImage imageNamed:@"工人"];
    self.rightIcon = [[UIImageView alloc]initWithImage:icon1];
    [self.view addSubview:self.rightIcon];
    self.rightIcon.sd_layout.leftSpaceToView(self.dealPositionRightLab,0).topEqualToView(self.dealPositionRightLab).widthRatioToView(self.dealRightLab,1.0 / 5.0).heightRatioToView(self.dealPositionRightLab,1);

    //地址
    self.adressLab = [[UILabel alloc]init];
    [self.view addSubview:self.adressLab];
    self.adressLab.font = [UIFont systemFontOfSize:15];
    self.adressLab.textColor = [UIColor grayColor];
    self.adressLab.textAlignment = NSTextAlignmentCenter;
    self.adressLab.text = @"圣城天使一期四室两厅 150㎡";
    self.adressLab.sd_layout.leftSpaceToView(self.view,10).topSpaceToView(self.dealLeftLab,(100.0 / 1330.0) * ScreenH).rightSpaceToView(self.view,10).heightIs(25);
    
    //横线
    self.line = [[UIView alloc]init];
    [self.view addSubview:self.line];
    self.line.backgroundColor = [UIColor grayColor];
    self.line.sd_layout.leftEqualToView(self.adressLab).topSpaceToView(self.adressLab,5).widthRatioToView(self.adressLab,1).heightIs(1);
    
    //时间
    self.timeLab = [[UILabel alloc]init];
    [self.view addSubview:self.timeLab];
    self.timeLab.font = [UIFont systemFontOfSize:17];
    self.timeLab.textColor = [UIColor grayColor];
//    self.timeLab.textAlignment = NSTextAlignmentCenter;
    self.timeLab.text = @"2016/05/06 19:20";
    self.timeLab.sd_layout.leftSpaceToView(self.view,10).topSpaceToView(self.line,10).widthRatioToView(self.view,3.0/5.0).heightIs(25);
    
    //状态
    self.finsihLab = [[UILabel alloc]init];
    [self.view addSubview:self.finsihLab];
    self.finsihLab.font = [UIFont systemFontOfSize:13];
    self.finsihLab.textColor = [UIColor whiteColor];
    self.finsihLab.textAlignment = NSTextAlignmentCenter;
    self.finsihLab.backgroundColor = HWColor(63, 203, 125);
    self.finsihLab.layer.masksToBounds = YES;
    self.finsihLab.layer.cornerRadius = 13;
    self.finsihLab.text = @"水电验收";
    self.finsihLab.sd_layout.rightSpaceToView(self.view,10).topSpaceToView(self.line,10).widthRatioToView(self.view,160.0/750.0).heightIs(25);
    
    //背景view
    self.btnBG = [[UIView alloc]init];
    self.btnBG.backgroundColor = HWColor(247, 247, 247);
    [self.view addSubview:self.btnBG];
    self.btnBG.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.finsihLab,10).bottomSpaceToView(self.view,0);
    //title及线
    self.titleLab = [[UILabel alloc]init];
    [self.btnBG addSubview:self.titleLab];
    self.titleLab.font = [UIFont boldSystemFontOfSize:16];
    self.titleLab.textColor = [UIColor blackColor];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.text = @"实时阶段";
    self.titleLab.sd_layout.topSpaceToView(self.btnBG,(20.0 / 1330.0) * ScreenH).widthRatioToView(self.view,1.0 / 5.0).heightIs(25).centerYEqualToView(self.btnBG).centerXEqualToView(self.btnBG);
    
    self.leftLine = [[UILabel alloc]init];
    [self.btnBG addSubview:self.leftLine];
    self.leftLine.backgroundColor = [UIColor blackColor];
    self.leftLine.sd_layout.leftSpaceToView(self.btnBG,10).rightSpaceToView(self.titleLab,10).centerYEqualToView(self.titleLab).heightIs(1);
    
    self.rightLine = [[UILabel alloc]init];
    [self.btnBG addSubview:self.rightLine];
    self.rightLine.backgroundColor = [UIColor blackColor];
    self.rightLine.sd_layout.leftSpaceToView(self.titleLab,10).rightSpaceToView(self.btnBG,10).centerYEqualToView(self.titleLab).heightIs(1);
    
    //btn
    self.startWork = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startWork setBackgroundImage:[UIImage imageNamed:@"1_green"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.startWork];
    self.startWork.sd_layout.leftSpaceToView(self.btnBG,15).topSpaceToView(self.titleLab,(40.0 / 1330.0) * ScreenH).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    [self.startWork addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.startTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.startTime];
    self.startTime.textColor = [UIColor grayColor];
    self.startTime.font = [UIFont systemFontOfSize:12];
    self.startTime.textAlignment = NSTextAlignmentCenter;
    self.startTime.text = @"2016/5/6";
    self.startTime.sd_layout.widthRatioToView(self.startWork,1).leftEqualToView(self.startWork).topSpaceToView(self.startWork,10).heightIs(20);
    
    self.view1 = [[UIView alloc]init];
    self.view1.backgroundColor = [UIColor whiteColor];
    [self.btnBG addSubview:self.view1];
    self.view1.sd_layout.centerYEqualToView(self.startWork).leftSpaceToView(self.startWork,0).heightIs(5).widthRatioToView(self.btnBG,(40.0 / 750.0));
    
    
    
    self.water = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.water setBackgroundImage:[UIImage imageNamed:@"2_green"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.water];
    self.water.sd_layout.leftSpaceToView(self.view1,0).topSpaceToView(self.titleLab,(40.0 / 1330.0) * ScreenH).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.waterTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.waterTime];
    self.waterTime.textColor = [UIColor grayColor];
    self.waterTime.font = [UIFont systemFontOfSize:12];
    self.waterTime.textAlignment = NSTextAlignmentCenter;
    self.waterTime.text = @"2016/5/6";
    self.waterTime.sd_layout.widthRatioToView(self.startWork,1).leftEqualToView(self.water).topSpaceToView(self.water,10).heightIs(20);
    
    self.view2 = [[UIView alloc]init];
    self.view2.backgroundColor = [UIColor whiteColor];
    [self.btnBG addSubview:self.view2];
    self.view2.sd_layout.centerYEqualToView(self.startWork).leftSpaceToView(self.water,0).heightIs(5).widthRatioToView(self.btnBG,(40.0 / 750.0));
    
    
    
    self.mason = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.mason setBackgroundImage:[UIImage imageNamed:@"3_gray"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.mason];
    self.mason.sd_layout.leftSpaceToView(self.view2,0).topSpaceToView(self.titleLab,(40.0 / 1330.0) * ScreenH).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.masonTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.masonTime];
    self.masonTime.textColor = [UIColor grayColor];
    self.masonTime.font = [UIFont systemFontOfSize:12];
    self.masonTime.textAlignment = NSTextAlignmentCenter;
    self.masonTime.text = @"2016/5/6";
    self.masonTime.sd_layout.widthRatioToView(self.startWork,1).leftEqualToView(self.mason).topSpaceToView(self.mason,10).heightIs(20);
    
    self.View3 = [[UIView alloc]init];
    self.View3.backgroundColor = HWColor(214, 214, 214);
    [self.btnBG addSubview:self.View3];
    self.View3.sd_layout.centerYEqualToView(self.startWork).leftSpaceToView(self.mason,0).heightIs(5).widthRatioToView(self.btnBG,(40.0 / 750.0));
    
    
    self.woodWorking = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.woodWorking setBackgroundImage:[UIImage imageNamed:@"4_gray"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.woodWorking];
    self.woodWorking.sd_layout.leftSpaceToView(self.View3,0).topSpaceToView(self.titleLab,(40.0 / 1330.0) * ScreenH).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.woodTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.woodTime];
    self.woodTime.textColor = [UIColor grayColor];
    self.woodTime.font = [UIFont systemFontOfSize:12];
    self.woodTime.textAlignment = NSTextAlignmentCenter;
    self.woodTime.text = @"2016/5/6";
    self.woodTime.sd_layout.widthRatioToView(self.startWork,1).leftEqualToView(self.woodWorking).topSpaceToView(self.woodWorking,10).heightIs(20);
    
    
    
    /**
     *  下行
     *
     *  @return <#return value description#>
     */
    
    self.paint = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.paint setBackgroundImage:[UIImage imageNamed:@"5_green"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.paint];
    self.paint.sd_layout.leftSpaceToView(self.btnBG,15).topSpaceToView(self.startTime,10).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.paintTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.paintTime];
    self.paintTime.textColor = [UIColor grayColor];
    self.paintTime.font = [UIFont systemFontOfSize:12];
    self.paintTime.textAlignment = NSTextAlignmentCenter;
    self.paintTime.text = @"2016/5/6";
    self.paintTime.sd_layout.widthRatioToView(self.paint,1).leftEqualToView(self.startWork).topSpaceToView(self.paint,5).heightIs(20);
    
    self.view4 = [[UIView alloc]init];
    self.view4.backgroundColor = [UIColor whiteColor];
    [self.btnBG addSubview:self.view4];
    self.view4.sd_layout.centerYEqualToView(self.paint).leftSpaceToView(self.paint,0).heightIs(5).widthRatioToView(self.btnBG,(40.0 / 750.0));
    
    
    
    self.install = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.install setBackgroundImage:[UIImage imageNamed:@"6_green"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.install];
    self.install.sd_layout.leftSpaceToView(self.view4,0).topSpaceToView(self.waterTime,10).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.installTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.installTime];
    self.installTime.textColor = [UIColor grayColor];
    self.installTime.font = [UIFont systemFontOfSize:12];
    self.installTime.textAlignment = NSTextAlignmentCenter;
    self.installTime.text = @"2016/5/6";
    self.installTime.sd_layout.widthRatioToView(self.install,1).leftEqualToView(self.install).topSpaceToView(self.install,5).heightIs(20);
    
    self.view5 = [[UIView alloc]init];
    self.view5.backgroundColor = HWColor(214, 214, 214);
    [self.btnBG addSubview:self.view5];
    self.view5.sd_layout.centerYEqualToView(self.install).leftSpaceToView(self.install,0).heightIs(5).widthRatioToView(self.btnBG,(40.0 / 750.0));
    
    
    
    self.checkAndAccept = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.checkAndAccept setBackgroundImage:[UIImage imageNamed:@"7_gray"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.checkAndAccept];
    self.checkAndAccept.sd_layout.leftSpaceToView(self.view5,0).topSpaceToView(self.masonTime,10).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.checkTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.checkTime];
    self.checkTime.textColor = [UIColor grayColor];
    self.checkTime.font = [UIFont systemFontOfSize:12];
    self.checkTime.textAlignment = NSTextAlignmentCenter;
    self.checkTime.text = @"2016/5/6";
    self.checkTime.sd_layout.widthRatioToView(self.checkAndAccept,1).leftEqualToView(self.checkAndAccept).topSpaceToView(self.checkAndAccept,5).heightIs(20);
    
    self.view6 = [[UIView alloc]init];
    self.view6.backgroundColor = HWColor(214, 214, 214);
    [self.btnBG addSubview:self.view6];
    self.view6.sd_layout.centerYEqualToView(self.checkAndAccept).leftSpaceToView(self.checkAndAccept,0).heightIs(5).widthRatioToView(self.btnBG,(40.0 / 750.0));
    
    
    self.finsih = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.finsih setBackgroundImage:[UIImage imageNamed:@"8_gray"] forState:UIControlStateNormal];
    [self.btnBG addSubview:self.finsih];
    self.finsih.sd_layout.leftSpaceToView(self.view6,0).topSpaceToView(self.woodTime,10).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
    
    self.finishTime = [[UILabel alloc]init];
    [self.btnBG addSubview:self.finishTime];
    self.finishTime.textColor = [UIColor grayColor];
    self.finishTime.font = [UIFont systemFontOfSize:12];
    self.finishTime.textAlignment = NSTextAlignmentCenter;
    self.finishTime.text = @"2016/5/6";
    self.finishTime.sd_layout.widthRatioToView(self.finsih,1).leftEqualToView(self.woodWorking).topSpaceToView(self.finsih,5).heightIs(20);
    
    
    
    
}

//查看图片
- (void)btnAction:(UIButton *)sender {
    
    [self showPhotoBrowser:0];

}


-(void)showPhotoBrowser:(NSInteger)index{
    WyzAlbumViewController *wyzAlbumVC = [[WyzAlbumViewController alloc]init];
    
    wyzAlbumVC.currentIndex =index;//这个参数表示当前图片的index，默认是0
    
    //图片数组，可以是url，也可以是UIImage
    //第一种用url
    wyzAlbumVC.imgArr = self.urlArrays;
    wyzAlbumVC.imageNameArray=self.imageNames;//图片名字数组可以为空
    [self presentViewController:wyzAlbumVC animated:YES completion:^{
        
        
    }];
}





@end
