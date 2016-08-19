//
//  XRZTableController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZTableController.h"
#import "XRZSecondController.h"
#import "SDCycleScrollView.h"
#import "UIView+SDAutoLayout.h"
#import "XRZTestController.h"
#import "XRZLoginIDController.h"
#import "XRZGarpViewController.h"
#import "LSPaoMaView.h"
#import "UINavigationItem+XRZItemTitle.h"
#import "FJAdView.h"
#import "JSONModelLib.h"
#import "MBProgressHUD.h"
#import "XRZCommonModel.h"
#import "DataManager.h"
#import "AFNetworking.h"
#import "WBHttpTool.h"
#import "XRZDeatilController.h"


#define URL @"http://api.xrzmall.com/api2/member_info.php"
#define PicUrl @"http://api.xrzmall.com/api/home_info.php?pwdstr=b107d5130286d3322d64d9f417ce5e2c"

#define NSLocalizedString(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

@interface XRZTableController (){
    
    double benchStart;
    double benchObj;
    double benchEnd;
}

//抢单图片
@property (nonatomic, strong) UIImageView *grapImage;
//开始/关闭按钮
@property (nonatomic, strong) UIButton *grapBtn;

@property (nonatomic, strong) FJAdView *adView;

@property (nonatomic, strong) XRZCommonModel *commonModel;

@property (nonatomic, strong) NSMutableArray *picArray;
@property (nonatomic, strong) NSString *gonggao;

@property (nonatomic, strong) MBProgressHUD *hud;


@end

@implementation XRZTableController


//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        self.hidesBottomBarWhenPushed = YES;
//    }
//    return self;
//}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.adView beginScroll];
//    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.adView closeScroll];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // Set the annular determinate mode to show task progress.
//    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.labelText = NSLocalizedString(@"正在加载...", @"正在加载");
    
    
    self.view.backgroundColor = HWColor(240, 240, 240);
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"首页" font:20];
    
    self.navigationController.navigationBar.hidden = NO;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW - 10, 5, 40,20)];
    [btn setImage:[UIImage imageNamed:@"用户规则"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn addTarget:self action:@selector(friendSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;

    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"主页_消息" highImage:@"主页_消息"];
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW - 10, 5, 40,20)];
    [btn1 setImage:[UIImage imageNamed:@"主页_消息"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
    NSDictionary *dataDict = [[DataManager shareManager] loadUsernameAndPassword];
    NSNumber *password = (NSNumber *)[dataDict objectForKey:[DataManager shareManager].password];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setObject:AppKey forKey:@"pwdstr"];
    [params setObject:password forKey:@"id"];
    XRZLog(@"%@",params);
    
    [WBHttpTool GET:URL parameters:params success:^(id responseObject) {
        
        NSDictionary *dicts = (NSDictionary *)responseObject;
        
        NSArray *arr = dicts[@"datas"];
        NSDictionary *dict = arr[0];
        self.commonModel = [[XRZCommonModel alloc]initWithDictionary:dict error:NULL];
        
        //轮播视图
        [self addSubViewsForTableView];
        
        [self.hud hide:YES];
        
    } failure:^(NSError *error) {
        
        XRZLog(@"%@",error);
        
    }];


}


- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}


- (void)friendSearch
{
    XRZLog(@"用户规则");
    [self.navigationController pushViewController:[XRZLoginIDController new] animated:YES];
}

- (void)pop
{
    //跳转到第二级页面（我的消息）
    UIViewController *vc = [[XRZSecondController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


//添加轮播图，添加到表视图上
-(void)addSubViewsForTableView
{
    [WBHttpTool GET:PicUrl parameters:nil success:^(id responseObject) {
        
        NSDictionary *dicts = responseObject;
        NSArray *arr = dicts[@"datas"];
        NSDictionary *array = arr[0];
        NSArray *adv = array[@"advlist"];
        NSString *gonggao = array[@"notice"];
        self.gonggao = gonggao;
        
        
        self.picArray = [[NSMutableArray alloc]init];
        for (NSDictionary *dict in adv) {
            NSString *str = dict[@"pic"];
        [self.picArray addObject:str];
     }
    
        NSArray *imagesURLStrings = self.picArray;
        
        // 图片配文字
        SDCycleScrollView *banner2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, ScreenW, 0.15 * (ScreenH - 64 - 49)) delegate:nil placeholderImage:nil];
        banner2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        banner2.currentPageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        banner2.imageURLStringsGroup = imagesURLStrings;
        banner2.placeholderImage = [UIImage imageNamed:@"0导航页"];
        //banner2.titlesGroup = titles;
        [self.view addSubview:banner2];
        
        //设置公告
        [self setAnnouncement:banner2];
        
    } failure:^(NSError *error) {
        
    }];
    
}


//设置公告
- (void)setAnnouncement:(SDCycleScrollView *)sender{
    
    //公告图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sender.frame) + 5, 20, 20)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"主页_活动公告"];
    //公告内容
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(sender.frame) + 5, ScreenW - 25, 0.075 * (ScreenH - 64 - 49) - 10)];
//    [self.view addSubview:label];
    
    NSString *text = [NSString stringWithFormat:@"%@",self.gonggao];
    
    LSPaoMaView *paoma = [[LSPaoMaView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sender.frame) + 5, ScreenW - 25, 20) title:text];
    [self.view addSubview:paoma];
    paoma.sd_layout.centerXEqualToView(imageView).leftSpaceToView(imageView,5).rightSpaceToView(self.view,20).heightIs(20);

  

//    label.font = [UIFont boldSystemFontOfSize:10];
//    label.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(10.0)];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(paoma.frame) + 5, ScreenW, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    
    //添加个人认证
    [self addPofilePass:line];
    
}

//添加个人认证
- (void)addPofilePass:(UIView *)sender{
    UIView *profile = [[UIView alloc] init];
    [self.view addSubview:profile];

    profile.frame = CGRectMake(0, CGRectGetMaxY(sender.frame), ScreenW, 0.21 * (ScreenH - 64 - 49));
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action:)];
    [profile addGestureRecognizer:tapGesture];
    

    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"0导航页"];
    [profile addSubview:imageView];
    

    imageView.frame = CGRectMake(10, 10, profile.frame.size.height - 20, profile.frame.size.height - 20);
    imageView.sd_cornerRadiusFromHeightRatio = @(0.5);
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = imageView.width / 2;
    
    //创建label
    //名字
    UILabel *name = [[UILabel alloc]init];

    name.text = self.commonModel.nickname;
    name.font = [UIFont boldSystemFontOfSize:18];
    [profile addSubview:name];

    name.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 5, CGRectGetMinY(imageView.frame), ScreenW - 40 - CGRectGetMaxX(imageView.frame) - 5, imageView.frame.size.height / 3.0);
    
    //职位
    UILabel *profeession = [[UILabel alloc]init];
    [profile addSubview:profeession];
    
    if ([self.commonModel.memtype isEqualToString:@"memtype-2"]) {
        profeession.text = @"装修公司";
    }else if ([self.commonModel.memtype isEqualToString:@"memtype-3"]){
        profeession.text = @"设计师";
    }else if ([self.commonModel.memtype isEqualToString:@"memtype-4"]){
        profeession.text = @"项目经理";
    }else if ([self.commonModel.memtype isEqualToString:@"memtype-5"]){
        profeession.text = @"工人";
    }
    
    profeession.font = [UIFont systemFontOfSize:15];

    profeession.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 5, CGRectGetMaxY(name.frame), 50, imageView.frame.size.height / 3.0);
    
    //认证图片
    UIImageView *icon = [[UIImageView alloc]init];
    icon.image = [UIImage imageNamed:@"我的_已认证"];
    [profile addSubview:icon];
    icon.sd_layout.heightIs(15).widthIs(15).leftSpaceToView(profeession,0).centerYEqualToView(profeession);
//    icon.layer.masksToBounds = YES;
//    icon.layer.cornerRadius  = icon.width / 2;
    //认证结果
    UILabel *messige = [[UILabel alloc]init];
    messige.font = [UIFont systemFontOfSize:13];
    messige.text = @"已完成认证，欢迎使用";

    [profile addSubview:messige];
    
    
    if (self.commonModel.appreal == 0) {
        icon.image = [UIImage imageNamed:@"我的_已认证"];
        messige.text = @"完成认证后方可抢单";
        messige.textColor = HWColor(63, 203, 125);
    }else if (self.commonModel.appreal == 1){
        icon.image = [UIImage imageNamed:@"我的_未认证"];
        messige.text = @"等待完成认证";
        messige.textColor = HWColor(63, 203, 125);
    }else if (self.commonModel.appreal == 2){
        icon.image = [UIImage imageNamed:@"我的_已认证"];
        messige.text = @"您已完成认证，欢迎使用";
        messige.textColor = [UIColor grayColor];
    }else if (self.commonModel.appreal == 3){
        icon.image = [UIImage imageNamed:@"我的_未认证"];
        messige.text = @"认证失败，请重新认证";
        messige.textColor = HWColor(250, 108, 112);
    }

    messige.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 5, CGRectGetMaxY(profeession.frame), ScreenW - 40 - CGRectGetMaxX(imageView.frame) - 5, imageView.frame.size.height / 3.0);
    //进入图片
    UIImageView *goin = [[UIImageView alloc]init];
    goin.image = [UIImage imageNamed:@"主页_进入"];
    [profile addSubview:goin];
    goin.sd_layout.rightSpaceToView(profile,10).centerYEqualToView(icon).heightIs(25).widthIs(15);
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];

    line.frame = CGRectMake(0, CGRectGetMaxY(profile.frame), ScreenW, 1);
    //订单数量

    //已抢到数量
    UILabel *num1 = [[UILabel alloc]init];
    num1.textAlignment = NSTextAlignmentCenter;
    num1.font = [UIFont systemFontOfSize:20];
    num1.text = @"666";
    [self.view addSubview:num1];

    num1.frame = CGRectMake(0, CGRectGetMaxY(line.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    //进行中的订单
    UILabel *num2 = [[UILabel alloc]init];
    num2.textAlignment = NSTextAlignmentCenter;
    num2.font = [UIFont systemFontOfSize:20];
    num2.text = @"666";
    [self.view addSubview:num2];

    num2.frame = CGRectMake(CGRectGetMaxX(num1.frame), CGRectGetMaxY(line.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    //已完成订单
    UILabel *num3 = [[UILabel alloc]init];
    num3.textAlignment = NSTextAlignmentCenter;
    num3.font = [UIFont systemFontOfSize:20];
    num3.text = @"666";
    [self.view addSubview:num3];

    num3.frame = CGRectMake(CGRectGetMaxX(num2.frame), CGRectGetMaxY(line.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    //客服评分值
    UILabel *num4 = [[UILabel alloc]init];
    num4.textAlignment = NSTextAlignmentCenter;
    num4.font = [UIFont systemFontOfSize:20];
    num4.text = @"9.6";
    [self.view addSubview:num4];

    num4.frame = CGRectMake(CGRectGetMaxX(num3.frame), CGRectGetMaxY(line.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    
    
    //已抢到数量
    UILabel *describe = [[UILabel alloc]init];
    describe.textAlignment = NSTextAlignmentCenter;
    describe.font = [UIFont systemFontOfSize:15];
    describe.text = @"已抢到订单";
    [describe setTextColor:[UIColor grayColor]];
    [self.view addSubview:describe];

    describe.frame = CGRectMake(0, CGRectGetMaxY(num1.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    //进行中的订单
    UILabel *describe1 = [[UILabel alloc]init];
    describe1.textAlignment = NSTextAlignmentCenter;
    describe1.font = [UIFont systemFontOfSize:15];
    describe1.text = @"进行的订单";
    [describe1 setTextColor:[UIColor grayColor]];
    [self.view addSubview:describe1];

    describe1.frame = CGRectMake(CGRectGetMaxX(describe.frame), CGRectGetMaxY(num2.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    //已完成订单
    UILabel *describe2 = [[UILabel alloc]init];
    describe2.textAlignment = NSTextAlignmentCenter;
    describe2.font = [UIFont systemFontOfSize:15];
    describe2.text = @"已完成订单";
    [describe2 setTextColor:[UIColor grayColor]];
    [self.view addSubview:describe2];

    describe2.frame = CGRectMake(CGRectGetMaxX(describe1.frame), CGRectGetMaxY(num3.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    //客服评分值
    UILabel *describe3 = [[UILabel alloc]init];
    describe3.textAlignment = NSTextAlignmentCenter;
    describe3.font = [UIFont systemFontOfSize:15];
    describe3.text = @"客服评分值";
    [describe3 setTextColor:[UIColor grayColor]];
    [self.view addSubview:describe3];

    describe3.frame = CGRectMake(CGRectGetMaxX(describe2.frame), CGRectGetMaxY(num4.frame), ScreenW / 4.0, 0.074 * (ScreenH - 64 - 49));
    
    for (int i = 0; i < 4; i++) {
        
        UIView *line = [[UIView alloc]init];
        line.frame = CGRectMake(i * (ScreenW / 4.0), num1.frame.origin.y + 10, 1, 0.148 * (ScreenH - 64 - 49) - 20);
        line.backgroundColor = HWColor(242, 242, 242);
        [self.view addSubview:line];
    }
    
    //横线
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line1];
    line1.frame = CGRectMake(0, CGRectGetMaxY(describe3.frame) + 5, ScreenW, 1);
    
    
    
    UIView *superImgAndBtn = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line1.frame), ScreenW, 0.4 * (ScreenH - 64))];
    superImgAndBtn.backgroundColor = HWColor(250, 250, 250);
    [self.view addSubview:superImgAndBtn];
    
    //添加抢单按钮
    UIImageView *onoff = [[UIImageView alloc]init];
    onoff.image = [UIImage imageNamed:@"普通开关_bg灰"];
    [superImgAndBtn addSubview:onoff];
    onoff.userInteractionEnabled = YES;
    onoff.frame = CGRectMake(ScreenW / 6.0, superImgAndBtn.frame.size.height / 3.0 - 20,  (2 *ScreenW) / 3.0, superImgAndBtn.frame.size.height / 3.0  - 10);
    self.grapImage = onoff;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"普通开关_停止"] forState:UIControlStateNormal];
    [onoff addSubview:btn];
//    btn.hidden = YES
    UISwipeGestureRecognizer *on = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tapGester:)];
    on.direction = (UISwipeGestureRecognizerDirectionRight )| (UISwipeGestureRecognizerDirectionLeft);
    [self.grapImage addGestureRecognizer:on];
    
    [btn addTarget:self action:@selector(clik) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(0, 0, onoff.width / 2, onoff.height);
    
    self.grapBtn = btn;
    
    NSArray *array = @[@"陈先生 抢到 李女士 的装修订单  \n平台累计成交量上升至6666单",@"张先生 抢到 李女士 的装修订单 \n平台累计成交量上升至7777单",@"李先生 抢到 李女士 的装修订单 \n平台累计成交量上升至7777单",@"马先生 抢到 李女士 的装修订单 \n平台累计成交量上升至7777单"];
    
    
    FJAdView *view = [[FJAdView alloc]initWithTitles:array];
    view.backgroundColor = [UIColor clearColor];
    view.textAlignment = NSTextAlignmentCenter;//默认
    //    view.isHaveHeadImg = YES;
    view.isHaveTouchEvent = YES;
    view.labelFont = [UIFont systemFontOfSize:13.0];
    view.color = [UIColor redColor];
    view.time = 2.0f;
    [superImgAndBtn addSubview:view];
    self.adView = view;
    view.sd_layout.leftEqualToView(onoff).rightEqualToView(onoff).topSpaceToView(onoff,30).heightIs(40);
    [self.adView beginScroll];
    
    
    UIView *bomttomLine = [[UIView alloc]init];
    bomttomLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bomttomLine];
    bomttomLine.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,50).heightIs(1);

}


- (void)action:(UITapGestureRecognizer *)sender{
    
    
    XRZDeatilController *vc = [[XRZDeatilController alloc]init];
    vc.commonModel = self.commonModel;
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - 手势
- (void)tapGester:(UISwipeGestureRecognizer *)gerster{
    
    XRZLog(@".........");
    
    static BOOL abc = YES;
    if (abc) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.grapBtn.frame = CGRectMake(self.grapImage.width / 2, 0, self.grapImage.width / 2, self.grapImage.height);
            
        } completion:^(BOOL finished) {
            
            [self.grapBtn setBackgroundImage:[UIImage imageNamed:@"普通开关_抢单按钮"] forState:UIControlStateNormal];
            self.grapImage.image = [UIImage imageNamed:@"普通开关_bg"];
            abc = NO;
            
            XRZGarpViewController *grap = [[XRZGarpViewController alloc]init];
            [self.navigationController pushViewController:grap animated:YES];
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.grapBtn.frame = CGRectMake(0, 0, self.grapImage.width / 2, self.grapImage.height);
            
        } completion:^(BOOL finished) {
            
            [self.grapBtn setBackgroundImage:[UIImage imageNamed:@"普通开关_停止"] forState:UIControlStateNormal];
            self.grapImage.image = [UIImage imageNamed:@"普通开关_bg灰"];
            abc = YES;
        }];
    }
}


- (void)clik{
    
    
    XRZLog(@"......122345");
    
    static BOOL abc = YES;
    if (abc) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.grapBtn.frame = CGRectMake(self.grapImage.width / 2, 0, self.grapImage.width / 2, self.grapImage.height);
            
        } completion:^(BOOL finished) {
            
            [self.grapBtn setBackgroundImage:[UIImage imageNamed:@"普通开关_抢单按钮"] forState:UIControlStateNormal];
            self.grapImage.image = [UIImage imageNamed:@"普通开关_bg"];
            abc = NO;
            
            XRZGarpViewController *grap = [[XRZGarpViewController alloc]init];
            [self.navigationController pushViewController:grap animated:YES];
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            self.grapBtn.frame = CGRectMake(0, 0, self.grapImage.width / 2, self.grapImage.height);
            
        } completion:^(BOOL finished) {
            
            [self.grapBtn setBackgroundImage:[UIImage imageNamed:@"普通开关_停止"] forState:UIControlStateNormal];
            self.grapImage.image = [UIImage imageNamed:@"普通开关_bg灰"];
            abc = YES;
        }];
    }

    
}


@end
