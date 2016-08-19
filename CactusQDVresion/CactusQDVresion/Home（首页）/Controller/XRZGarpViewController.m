//
//  XRZGarpViewController.m
//  仙人掌抢单般
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZGarpViewController.h"
#import "UIView+SDAutoLayout.h"
#import "JPTimeTickManager+Util.h"
#import "XRZAlertView.h"

#define PI 3.14159265358979323846
@interface XRZGarpViewController ()

@property (strong, nonatomic)  UILabel *nameLabel;

@property (strong, nonatomic)  UILabel *distance;
@property (strong, nonatomic)  UIImageView *iconImage;

@property (strong, nonatomic)  UIButton *btn;

@property (strong, nonatomic)  UIImageView *stopWatchbg;

@property (strong, nonatomic)  UIImageView *stopWatch;

@property (strong, nonatomic)  UIImageView *watchProceas;
@property (strong, nonatomic) UILabel *timeLab;

@property (strong, nonatomic)  UILabel *countDown;
@property (strong, nonatomic)  UIView *topBG;
@property (strong, nonatomic)  UIView *iconBG;

@property (nonatomic, strong) CABasicAnimation *rotationAnimation;;

@end

@implementation XRZGarpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self setNavition];
    
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.cornerRadius = 20;
    
    [self setAutoutlaout];
    
    
    NSTimeInterval delayInterval = [[NSDate date] timeIntervalSince1970] + 60;
    [[JPTimeTickManager shareTickManager]addTimeTickLabel:self.timeLab withExpiresTime:delayInterval prefix:@"" withExpiresHandler:^(JPTimeTickObj *obj) {
//        XRZLog(@"我是 , obj:%@", obj);
    }];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [[JPTimeTickManager shareTickManager]removeTimeTickLabel:self.timeLab];
}

- (void)setAutoutlaout{
    
    float topView = 0.7 * (ScreenH - 64);
    float bteweenView = 0.2 * ScreenH;
//    float btoomView = 0.17 * ScreenH;
    
//    抢单上部分背景
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 0, 0);
    [self.view addSubview:view];
    view.backgroundColor = HWColor(63, 203, 125);
    self.topBG = view;
    self.topBG.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view,64).heightIs(topView - 64);
//
    //秒表最下边背景
    UIImage *watch = [UIImage imageNamed:@"秒表_bg"];
    UIImageView *image = [[UIImageView alloc]initWithImage:watch];
    [self.topBG addSubview:image];
    self.stopWatchbg = image;
    self.stopWatchbg.sd_layout.centerXEqualToView(self.topBG).topSpaceToView(self.topBG,20).widthIs(0.7 * (topView - 64)).heightIs(0.7 * (topView - 64));

    //秒表中间背景
    UIImage *watchBtween = [UIImage imageNamed:@"秒表_01"];
    UIImageView *btween = [[UIImageView alloc]initWithImage:watchBtween];
    [self.topBG addSubview:btween];
    self.stopWatch = btween;
    self.stopWatch.sd_layout.leftEqualToView(self.stopWatchbg).rightEqualToView(self.stopWatchbg).topEqualToView(self.stopWatchbg).heightRatioToView(self.stopWatchbg,1);

    //秒表进度条
    UIImage *progress = [UIImage imageNamed:@"秒表_进度条"];
    UIImageView *pro = [[UIImageView alloc]initWithImage:progress];
    [self.topBG addSubview:pro];
    self.watchProceas = pro;
    self.watchProceas.sd_layout.leftEqualToView(self.stopWatchbg).rightEqualToView(self.stopWatchbg).topEqualToView(self.stopWatchbg).heightRatioToView(self.stopWatchbg,1);
    _rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    _rotationAnimation.duration = 60;
    _rotationAnimation.cumulative = YES;
    _rotationAnimation.repeatCount = 1;
    [self.watchProceas.layer addAnimation:_rotationAnimation forKey:@"rotationAnimation"];
    
    
    //填充背景
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(drawFill) userInfo:nil repeats:YES];
    
    
    //中间计时label
    UILabel *label = [[UILabel alloc]init];
    [self.topBG addSubview:label];
    self.timeLab = label;
    self.timeLab.sd_layout.centerXEqualToView(self.watchProceas).centerYEqualToView(self.watchProceas).widthIs(self.watchProceas.height / 2).heightIs(40);
    label.font = [UIFont systemFontOfSize:30];
    label.textColor = HWColor(60, 185, 120);
    label.textAlignment = NSTextAlignmentCenter;
    
    //抢单倒计时

    UILabel *cutdown = [[UILabel alloc]init];
    [self.view addSubview:cutdown];
    cutdown.font = [UIFont systemFontOfSize:20];
    cutdown.textColor = [UIColor whiteColor];
    cutdown.textAlignment = NSTextAlignmentCenter;
    [self.topBG addSubview:cutdown];
    self.countDown = cutdown;
    self.countDown.text = @"抢单倒计时...";

    self.countDown.sd_layout.bottomSpaceToView(self.topBG,10).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(40);
    
    
    //中间的name背景
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    self.iconBG = view1;
    self.iconBG.backgroundColor = [UIColor grayColor];
    self.iconBG.sd_layout.leftEqualToView(self.topBG).rightEqualToView(self.topBG).topSpaceToView(self.topBG,0).heightIs(bteweenView);
//
    
    //头像
    
    UIImage *icon = [UIImage imageNamed:@"0导航页"];
    UIImageView *iconImage = [[UIImageView alloc]initWithImage:icon];

    [self.iconBG addSubview:iconImage];
    self.iconImage = iconImage;
    
    
    self.iconImage.sd_layout.leftSpaceToView(self.iconBG,20).centerYEqualToView(self.iconBG).widthIs(0.25 * ScreenW).heightIs(0.25 * ScreenW);
    iconImage.layer.masksToBounds = YES;
    iconImage.layer.cornerRadius = iconImage.height / 2;
    
   
    //名字
    UILabel *nameLab = [[UILabel alloc]init];
    [self.view addSubview:nameLab];
    nameLab.font = [UIFont systemFontOfSize:16];
    nameLab.textColor = [UIColor blackColor];
    nameLab.text = @"xxxx先生正在请求装修...";
    self.nameLabel = nameLab;
    [self.iconBG addSubview:nameLab];
    self.nameLabel.sd_layout.leftSpaceToView(self.iconImage,10).rightSpaceToView(self.iconBG,5).topSpaceToView(self.iconBG,self.iconBG.height / 2 - 30).heightIs(20);

    //描述信息
    UILabel *descLa = [[UILabel alloc]init];
    [self.view addSubview:descLa];
    descLa.font = [UIFont systemFontOfSize:16];
    descLa.textColor = [UIColor blackColor];
    descLa.text = @"该客户距离您当前位置5.2km";
    self.distance = descLa;
    [self.iconBG addSubview:descLa];

    self.distance.sd_layout.leftSpaceToView(self.iconImage,10).rightSpaceToView(self.iconBG,10).topSpaceToView(self.nameLabel,10).heightIs(20);

    
    //抢单btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"立即抢单" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor whiteColor];
    btn.backgroundColor = HWColor(72, 204, 122);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;

    self.btn.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).bottomSpaceToView(self.view,20).heightIs(50);
    [self.btn.layer setMasksToBounds:YES];
    [self.btn.layer setCornerRadius:25];

}


#pragma mark - 填充背景
//- (void)drawFill{
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors[] =
//    {
//        1,1,1, 1.00,
//        1,1,0, 1.00,
//        1,0,0, 1.00,
//        1,0,1, 1.00,
//        0,1,1, 1.00,
//        0,1,0, 1.00,
//        0,0,1, 1.00,
//        0,0,0, 1.00,
//    };
//
//    CGGradientRef gradient = CGGradientCreateWithColorComponents
//    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
//    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
//    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 100), 0.0, CGPointMake(300, 100), 10, kCGGradientDrawsBeforeStartLocation);
//    
//    /*画扇形和椭圆*/
//    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
//    aColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
//    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
//    //以10为半径围绕圆心画指定角度扇形
//    CGContextMoveToPoint(context, 160, 180);
//    CGContextAddArc(context, 160, 180, 30,  0 * PI / 180, -120 * PI / 180, 1);
//    CGContextClosePath(context);
//    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
//    
//
//    
//}


- (void)setNavition{
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"用户验证" font:20];
    
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
- (void)btnClick:(UIButton *)sender{
    
    XRZLog(@"...........");
    
    [[JPTimeTickManager shareTickManager]removeTimeTickLabel:self.timeLab];
//    [self.watchProceas.layer addAnimation:_rotationAnimation forKey:@"rotationAnimation"];
    [self.watchProceas.layer removeAllAnimations];

    XRZAlertView *alter = [XRZAlertView showInView:self.view withTitle:@"成功抢单" message:@"同样抢单成功的有三个" confirmButtonTitle:@"查看详细信息" cancelButtonTitle:@"我知道了"];
    [alter handleCancel:^{
        XRZLog(@"I Know");

    } handleConfirm:^{
        XRZLog(@"查看详细信息");
    }];
    
    [alter show];

}
@end
