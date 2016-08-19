//
//  PriceViewController.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/7/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "PriceViewController.h"
#import "AFNetworking.h"


#import "AppDelegate.h"

#import "ListCell.h"
#import "List2Cell.h"
#import "List3Cell.h"
#import "List4Cell.h"
#import "List5Cell.h"
#import "IncreaseCell.h"
#import "LeftSelectScroll.h"
#import "PriceModel.h"
#import "PriceModel1.h"


#define Color [UIColor colorWithRed:155 / 255.0 green:210 / 255.0 blue:105 / 255.0 alpha:1.0]
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface PriceViewController ()<LeftSelectScrollDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,CellCentdelagate,Cell5Centdelagate,TableViewCellDelegate,CellTextDelegate,UITextFieldDelegate>{
    LeftSelectScroll *leftScrollView;
        NSMutableArray *leftDataSource;
    //当点击的时候 不去调用滑动调节
    BOOL isScrollSetSelect;
    NSString * _packageStr;//套餐类型
    UITableView *tableViewList;
    
    NSMutableArray *_data1;// 套餐品牌数据源
    NSMutableArray *_data2;// 主材必选数据源
    NSMutableArray *_data3;// 基础必选数据源
    NSMutableArray *_data4;// 套餐价 数据源
    NSMutableArray *_data5;// 需求提交数据源
    NSMutableArray *_data6;// 可增加项数据源
    
    NSInteger combinedPrice;// 装修合计价格
    NSInteger basisPrice;// 基础价格
    NSInteger increasePrice;// 增加项价格

    PriceModel *_model;
    PriceModel1 *_model1;
    NSString *_zcbx;
    NSString *_jcgc;
    NSString *_remark;
    NSMutableDictionary *_parameter;
    NSMutableDictionary *_parameters;
       BOOL _isAction;// 判断是否处于点击状态

}
@property (nonatomic,strong) UIButton *leftButton;//基础套餐
@property (nonatomic,strong) UIButton *rightButton;//可增加项
@property (nonatomic,strong) UITableView *rightTab;
@property (nonatomic,strong) UIView *leftView; //最底层的UIView
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic,strong) UILabel *priceLabel1;//
@property (nonatomic,strong) UILabel *priceLabel2;//
@property (nonatomic,strong) UILabel *downLabel;// 装修合计


@property (nonatomic, strong) UIView *downView;// 装修合计上面 基础 and 增加项
@property (nonatomic, strong) UIView *blackView;
@property (nonatomic, strong) UILabel *basisLabel;//
@property (nonatomic, strong) UIView *middleView;// 中间的竖直的白色View
@property (nonatomic, strong) UILabel *increaseLabel;//


@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *cellLable;
@property (nonatomic, assign) BOOL isRL;// NO为左,YES为右//无效
@property (nonatomic, assign) NSInteger sectionIndex;// 记录分组
@property (nonatomic, assign) BOOL isAction;// 判断是否为选中状态

@property (nonatomic,retain)UITextField *rightTF;//记录右边视图的键盘
@property (nonatomic, retain)UITextField *leftTF;
@property (nonatomic, retain)UITextView *TextView;
@property (nonatomic,assign)BOOL add;
@end

@implementation PriceViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;// 取消导航栏透明
    

}
- (void)loadDatas{
    
    _data1 = nil;
    _data1 = [[NSMutableArray alloc]init];
    
    if ([_packageStr isEqual:@"package-1"]) {
        //***********************厨房
        _model = [[PriceModel alloc]init];
        _model.material = @"厨房";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"吊顶";
        _model.brand = @"奥普";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"橱柜";
        _model.brand = @"双华:定制";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"金意陶KCA45009";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"金意陶KPC060";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //***********************客厅
        _model = [[PriceModel alloc]init];
        _model.material = @"客厅";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"金意陶KPC08001";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //*********************阳台
        _model = [[PriceModel alloc]init];
        _model.material = @"阳台";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        
        _model = [[PriceModel alloc]init];
        _model.material = @"洗衣柜";
        _model.brand = @"法伊诺";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"龙头";
        _model.brand = @"恒洁HL-2600-13";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"金意陶KCA45009";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"金意陶KPC06011";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        // ******************主卧
        _model = [[PriceModel alloc]init];
        _model.material = @"主卧";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"安心(强化地板)";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"成品门";
        _model.brand = @"双华GJM-001";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //************************************次卧
        _model = [[PriceModel alloc]init];
        _model.material = @"次卧";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"安心(强化地板)";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"成品门";
        _model.brand = @"双华GJM-001";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //*******************卫生间
        _model = [[PriceModel alloc]init];
        _model.material = @"卫生间";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"吊顶";
        _model.brand = @"奥普";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"金意陶KCA45009";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"金意陶KCA30009";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"浴室柜";
        _model.brand = @"恒洁HGE-5701L-070";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"龙头";
        _model.brand = @"恒洁HL2500-42W";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        // *************                   其他
        _model = [[PriceModel alloc]init];
        _model.material = @"其他";
        _model.brand =nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"坐便器";
        _model.brand = @"恒洁H0112";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"花洒";
        _model.brand = @"恒洁HL2000-59";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"开关插座";
        _model.brand = @"西顿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"电线";
        _model.brand = @"球冠";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"乳胶漆";
        _model.brand = @"多乐士";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"照明";
        _model.brand = @"西顿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
    }else if ([_packageStr isEqual:@"package-2"]){
        _model = [[PriceModel alloc]init];
        _model.material = @"厨房";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"吊顶";
        _model.brand = @"奥普";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"橱柜";
        _model.brand = @"欧琳:格蕾斯,志邦:定制";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"东鹏630SLN50883";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏YG602071";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //***********************客厅
        _model = [[PriceModel alloc]init];
        _model.material = @"客厅";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏YG802091";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"百年明树(实木地板)";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //*********************阳台
        _model = [[PriceModel alloc]init];
        _model.material = @"阳台";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        
        _model = [[PriceModel alloc]init];
        _model.material = @"洗衣柜";
        _model.brand = @"MOOLOY/摩勒";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"龙头";
        _model.brand = @"恒洁HL2500-42W";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"东鹏630SLN50883";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏YG602071";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        // ******************主卧
        _model = [[PriceModel alloc]init];
        _model.material = @"主卧";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"百年明树,安心";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"成品门";
        _model.brand = @"开开木门PB01-PB05";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //************************************次卧
        _model = [[PriceModel alloc]init];
        _model.material = @"次卧";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"百年明树,安心";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"成品门";
        _model.brand = @"开开木门PB01-PB05";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        //*******************卫生间
        _model = [[PriceModel alloc]init];
        _model.material = @"卫生间";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"吊顶";
        _model.brand = @"奥普";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"东鹏630SLN50883";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏YG602071";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"浴室柜";
        _model.brand = @"金莎丽A154";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"淋浴房";
        _model.brand = @"双华扇形,双华钻石型";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"台盘";
        _model.brand = @"恒洁H106";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"龙头";
        _model.brand = @"恒洁HL103-111";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        // *************                   其他
        _model = [[PriceModel alloc]init];
        _model.material = @"其他";
        _model.brand =nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"坐便器";
        _model.brand = @"恒洁H0126";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"花洒";
        _model.brand = @"恒洁HL2000-60";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"开关插座";
        _model.brand = @"西顿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"电线";
        _model.brand = @"球冠";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"乳胶漆";
        _model.brand = @"多乐士";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"照明";
        _model.brand = @"西顿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
    }else if ([_packageStr isEqual:@"package-3"]){
        
        _model = [[PriceModel alloc]init];
        _model.material = @"厨房";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"吊顶";
        _model.brand = @"奥普";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"橱柜";
        _model.brand = @"欧琳:格蕾斯,志邦:定制";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"东鹏630SLN50879";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏FG803103";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //***********************客厅
        _model = [[PriceModel alloc]init];
        _model.material = @"客厅";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏FG803203";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"百年明树(实木地板)";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //*********************阳台
        _model = [[PriceModel alloc]init];
        _model.material = @"阳台";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        
        _model = [[PriceModel alloc]init];
        _model.material = @"洗衣柜";
        _model.brand = @"金莎丽HT-6041";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"龙头";
        _model.brand = @"恒洁HL103-111";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"东鹏630SLN50879";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏FG803103";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        // ******************主卧
        _model = [[PriceModel alloc]init];
        _model.material = @"主卧";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"百年明树,安心";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"成品门";
        _model.brand = @"开开木门QX11,QX28";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙纸";
        _model.brand = @"德国玛堡(原装进口)";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"硅藻泥";
        _model.brand = @"山亿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        //************************************次卧
        _model = [[PriceModel alloc]init];
        _model.material = @"次卧";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地板";
        _model.brand = @"百年明树,安心";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"成品门";
        _model.brand = @"开开木门QX11、QX28";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙纸";
        _model.brand = @"开开木门QX11、QX28";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"硅藻泥";
        _model.brand = @"山亿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        //*******************卫生间
        _model = [[PriceModel alloc]init];
        _model.material = @"卫生间";
        _model.brand = nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"吊顶";
        _model.brand = @"奥普";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"墙砖";
        _model.brand = @"东鹏630SLN50879";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"地砖";
        _model.brand = @"东鹏FG803103";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"防水";
        _model.brand = @"雨虹";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"浴室柜";
        _model.brand = @"恒洁HGM1421";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"淋浴房";
        _model.brand = @"恒洁HY-F10";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"台盘";
        _model.brand = @"恒洁H135";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"龙头";
        _model.brand = @"恒洁HL2915BW";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        // *************                   其他
        _model = [[PriceModel alloc]init];
        _model.material = @"其他";
        _model.brand =nil;
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"坐便器";
        _model.brand = @"恒洁H0142D";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"花洒";
        _model.brand = @"恒洁HL-2000-37Y";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"开关插座";
        _model.brand = @"西蒙,西门子";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"电线";
        _model.brand = @"球冠";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"乳胶漆";
        _model.brand = @"多乐士";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
        
        _model = [[PriceModel alloc]init];
        _model.material = @"照明";
        _model.brand = @"西顿";
        _model.isBtnAction = NO;
        [_data1 addObject:_model];
    }
    
    
    
    
    // 主材必选
    _data2 = nil;
    _data2 = [[NSMutableArray alloc]init];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"墙地砖";
    _model.brand = @"墙面300X400, 地面300X300";
    _model.isBtnAction = NO;
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"客厅过道";
    _model.brand = @"800X800抛光砖";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"成品门";
    _model.brand = @"多层复合实木门";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"门锁五金";
    _model.brand = @"每扇门一锁二合一门吸";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"厨房";
    _model.brand = @"集成吊顶含排风扇,灯具";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"橱柜";
    _model.brand = @"上柜1.8米,下柜4.2米";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"淋浴房";
    _model.brand = @"整体玻璃定制";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"浴室柜";
    _model.brand = @"成品定制普通型";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"马桶";
    _model.brand = @"吸洪式连体马桶";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"淋浴挡水条";
    _model.brand = @"中国黑,金碧辉煌大理石";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"卫生间";
    _model.brand = @"集成吊顶含风扇,灯具";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"地板";
    _model.brand = @"多层复合地板";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"成品配套踢脚线";
    _model.brand = @"";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"开关面板";
    _model.brand = @"全屋配套";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"阳台洗衣柜";
    _model.brand = @"成品购置普通";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"五金挂件";
    _model.brand = @"卫生间三件套,浴巾架,毛巾挂衣架,马桶刷";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"移门";
    _model.brand = @"厨房,阳台,钛合金移门清波带花纹玻璃5厘米厚";
    _model.isBtnAction = NO;
    [_data2 addObject:_model];
    
    
    // 基础必选
    
    _data3 = nil;
    _data3 = [[NSMutableArray alloc]init];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"水管铺设";
    _model.brand = @"卫生间、厨房、阳台";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"线路铺设";
    _model.brand = @"满足整屋基本需求";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"阳台地面";
    _model.brand = @"地面满铺,墙面不含";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"包下水管";
    _model.brand = @"厨房,卫生间,阳台";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"窗台板";
    _model.brand = @"人造石,限20公分内";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"门套基层";
    _model.brand = @"多层板,木工版";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"油漆";
    _model.brand = @"三底两面";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"乳胶漆";
    _model.brand = @"二底两面,腻子粉量抵";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"门槛石";
    _model.brand = @"中国黑,金碧辉煌";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"成品砖配踢脚线";
    _model.brand = @"";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"卧室地面找平";
    _model.brand = @"4~5公分厚";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"墙地砖铺贴";
    _model.brand = @"厨房,卫生间,客餐厅过道满铺";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    _model = [[PriceModel alloc]init];
    _model.material = @"防水";
    _model.brand = @"卫生间整间,厨房整间,阳台地面";
    _model.isBtnAction = NO;
    [_data3 addObject:_model];
    
    
    // 可增加项
    _data6 = nil;
    _data6 = [[NSMutableArray alloc]init];
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"电视机背景每平方";
    _model1.string1 = @"普通木饰面造型含油漆780元(异形另算)";
    _model1.integer1 = 780;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"其他工艺之类造型1000元";
    _model1.integer3 = 1000;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"拆除工程每平方";
    _model1.string1 = @"红砖墙体现场拆除含搬楼下50元";
    _model1.integer1 = 50;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"水泥墙体拆除含搬楼下110元";
    _model1.integer3 = 110;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"吊顶每平方";
    _model1.string1 = @"一级吊顶145元";
    _model1.integer1 = 145;
    _model1.string2 = @"二级吊顶188元";
    _model1.integer2 = 188;
    _model1.string3 = @"三级吊顶265元";
    _model1.integer3 = 265;
    _model1.string4 = @"平面面积计算";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"石膏线每米";
    _model1.string1 = @"8公分含安装18元";
    _model1.integer1 = 18;
    _model1.string2 = @"12公分含安装22元";
    _model1.integer2 = 22;
    _model1.string3 = @"15公分含安装28元";
    _model1.integer3 = 28;
    _model1.string4 = @"其他另议";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"衣柜无门每平方";
    _model1.string1 = @"杉木板E1级450元";
    _model1.integer1 = 450;
    _model1.string2 = @"箱体板520元";
    _model1.integer2 = 520;
    _model1.string3 = @"加香樟板每米100元";
    _model1.integer3 = 100;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"酒柜含门每平方";
    _model1.string1 = @"平板门380元";
    _model1.integer1 = 380;
    _model1.string2 = @"造型门550元";
    _model1.integer2 = 550;
    _model1.string3 = @"有框艺术玻璃门650元";
    _model1.integer3 = 650;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"床背景每平方";
    _model1.string1 = @"硬包含基层及边线收边450元";
    _model1.integer1 = 450;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"软包含基层及边线每平方580";
    _model1.integer3 = 580;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"玄关背景每平方";
    _model1.string1 = @"艺术形体1000元";
    _model1.integer1 = 1000;
    _model1.string2 = @"文化砖含基层安装720元";
    _model1.integer2 = 720;
    _model1.string3 = @"普通马赛克含基层620元";
    _model1.integer3 = 620;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"窗台每米";
    _model1.string1 = @"20CM内成品复合实木188元含安装";
    _model1.integer1 = 188;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"大理石类另算";
    _model1.integer3 = 0;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"垭口套每米";
    _model1.string1 = @"25CM内成品复合实木235元含安装";
    _model1.integer1 = 235;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"大理石类另算";
    _model1.integer3 = 0;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"装饰柜体每平方";
    _model1.string1 = @"无门含油漆620元";
    _model1.integer1 = 620;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"有门及造型类750元";
    _model1.integer3 = 750;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"灯槽每米";
    _model1.string1 = @"直线含材料人工28元";
    _model1.integer1 = 28;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"异形带材料含人工45元";
    _model1.integer3 = 45;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"门";
    _model1.string1 = @"平板门320元";
    _model1.integer1 = 320;
    _model1.string2 = @"造型门520元";
    _model1.integer2 = 520;
    _model1.string3 = @"百叶门650元";
    _model1.integer3 = 650;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"衣柜移门每平方";
    _model1.string1 = @"玻璃夹布移门280元";
    _model1.integer1 = 280;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"工艺造型350元";
    _model1.integer3 = 350;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"酒柜制作每平方";
    _model1.string1 = @"无门含油漆620元每平方";
    _model1.integer1 = 620;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"";
    _model1.integer3 = 0;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"无门鞋柜制作每平方";
    _model1.string1 = @"450元";
    _model1.integer1 = 450;
    _model1.string2 = @"";
    _model1.integer2 = 0;
    _model1.string3 = @"";
    _model1.integer3 = 0;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    
    _model1 = [[PriceModel1 alloc]init];
    _model1.string = @"衣柜开门每平方";
    _model1.string1 = @"平板门含油漆320元";
    _model1.integer1 = 320;
    _model1.string2 = @"造型门520元";
    _model1.integer2 = 520;
    _model1.string3 = @"";
    _model1.integer3 = 0;
    _model1.string4 = @"";
    _model1.integer4 = 0;
    _model1.isHidden1 = NO;
    _model1.isHidden2 = NO;
    _model1.isHidden3 = NO;
    _model1.isHidden4 = NO;
    [_data6 addObject:_model1];
    [tableViewList reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupnavi];
    [self setupsegement];
    [self setButton];
    [self setleftView];
    [self initObjects];
    [self creatLeftScrollView];
    [self createTableView];
    [self setuprightTab];
    _packageStr = @"package-1";
    [self loadDatas];
    [self addView];
    //监听键盘 设置tableView的frame***********
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillShow:(NSNotification *)note {
    NSDictionary *userinfo = [note userInfo];
    NSValue *aValue = [userinfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    float height = keyboardRect.size.height;
    NSLog(@"**%lf",keyboardRect.size.height);
    self.rightTab.contentInset = UIEdgeInsetsMake(0, 0,height, 0);
    tableViewList.contentInset = UIEdgeInsetsMake(0, 0,height, 0);
    
    NSLog(@"######%lf",tableViewList.contentInset.bottom);
}
- (void)keyboardWillHide:(NSNotification *)note {
    self.rightTab.contentInset = UIEdgeInsetsZero;
    tableViewList.contentInset = UIEdgeInsetsZero;
}
- (void)addView {
    
    [self.view addSubview:self.downView];
    [self.downView addSubview:self.downLabel];
    [self.view addSubview:self.blackView];
    [self.blackView addSubview:self.middleView];
    [self.blackView addSubview:self.basisLabel];
    [self.blackView addSubview:self.priceLabel1];
    [self.blackView addSubview:self.increaseLabel];
    [self.blackView addSubview:self.priceLabel2];
    
}

//****************导航条***************
- (void)setupnavi {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"套餐报价";
    
    UIImageView *navBarHairlineImageView = [[UIImageView alloc]init];
    navBarHairlineImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 1);
    navBarHairlineImageView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    navBarHairlineImageView.userInteractionEnabled = YES;
    [self.view addSubview:navBarHairlineImageView];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5,20 ,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        DatabaseManager *manager = [DatabaseManager new];
//          NSArray *array = [manager queryAllObjectsFromDatabaseWithClass:[MembersModel class]];
//            if ( array.count > 0 ) {
//            
//            _membersModel = [[MembersModel alloc]init];
//            
//            _membersModel = array[0];
//    }
//    });
    
   
}
- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//******************添加分段控件*******************************
- (void)setupsegement {
    NSArray *arr = @[@"688套餐",@"1288套餐",@"1888套餐"];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:arr];
    seg.frame = CGRectMake(20,5, ScreenW - 40, 30);
    [self.view addSubview:seg];
    seg.selectedSegmentIndex = 0;
    seg.tintColor =  Color ;
    seg.layer.masksToBounds = YES;
    seg.layer.cornerRadius = 10;
    seg.layer.borderColor = [Color CGColor];
    seg.layer.borderWidth = 1;
    seg.backgroundColor =  HWColor(254, 255, 255);
    [seg addTarget:self action:@selector(chage333:) forControlEvents:UIControlEventValueChanged];
    
    
}
- (void)chage333:(UISegmentedControl *)seg {
    if (seg.selectedSegmentIndex == 0) {
        _packageStr = @"package-1";
        [self loadDatas];
    }
    if (seg.selectedSegmentIndex == 1) {
        _packageStr = @"package-2";
        [self loadDatas];
    }
    if (seg.selectedSegmentIndex == 2) {
        _packageStr = @"package-3";
        [self loadDatas];
    }
}

#pragma mark 切换按钮
//********************************切换按钮***********************
- (void)setButton{
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, 40, kScreenWidth/2, 44);
    [self.leftButton setTitle:LeftButtonTitle forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor colorWithRed:156.0/255.0 green:208.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    
    
    [self.leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftButton];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftButton.frame), 52, 1, 20)];
    line.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    [self.view addSubview:line];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton .frame = CGRectMake(CGRectGetMaxX(self.leftButton.frame)+1, 40, kScreenWidth/2, 44);
    [self.rightButton  setTitle:RightButtonTitle forState:UIControlStateNormal];
    
    [self.rightButton  addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton setTitleColor:[UIColor colorWithWhite:0.004 alpha:1.000]  forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.rightButton ];
    
    
    
}
//*****************切换按钮的相应方法 ********************
- (void)buttonAction:(UIButton *)sender {
    [self.TextView resignFirstResponder];
    [self.rightTF resignFirstResponder];
    [self.leftTF resignFirstResponder];

    if (sender == self.rightButton) {
        [self.rightButton setTitleColor:[UIColor colorWithRed:156.0/255.0 green:208.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.leftButton setTitleColor:[UIColor colorWithWhite:0.004 alpha:1.000]  forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.leftView.frame = CGRectMake(-kScreenWidth, 84, kScreenWidth, kScreenHeight);
            self.rightView.frame = CGRectMake(0, 84, kScreenWidth, kScreenHeight);
        }];//左边的View
    }
    if (sender == self.leftButton) {
        [self.leftButton setTitleColor:[UIColor colorWithRed:156.0/255.0 green:208.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor colorWithWhite:0.004 alpha:1.000]  forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            self.leftView.frame = CGRectMake(0, 84, kScreenWidth, kScreenHeight);
            self.rightView.frame = CGRectMake(kScreenWidth, 84, kScreenWidth, kScreenHeight);
        }];//左边的View
   }
}


//*******************/下面的View******************
#pragma mark --- 右边的tabView
- (void)setuprightTab {
    self.rightTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, ScreenH-212)];
    [self.rightView addSubview:self.rightTab];
    self.rightTab.delegate = self;
    self.rightTab.dataSource = self;
    [self.rightTab registerNib:[UINib nibWithNibName:@"IncreaseCell" bundle:nil] forCellReuseIdentifier:@"IncreaseCell"];
}
#pragma mark 左边的集合视图
- (void)setleftView {
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 84, kScreenWidth, ScreenH-222)];
    [self.view addSubview:self.leftView];
    
    self.rightView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 104, kScreenWidth,ScreenH-222)];
    self.rightView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.rightView];
    
}
-(void)initObjects{
    leftDataSource = [[NSMutableArray alloc]initWithObjects:@"套餐品牌",@"主材必选",@"基础必选",@"套餐价", @"需求提交",nil];
}
-(void)createTableView{
    tableViewList = [[UITableView alloc]initWithFrame:CGRectMake(ScreenW*0.25, 0, kScreenWidth*0.75, ScreenH-212)];
    tableViewList.delegate = self;
    tableViewList.dataSource = self;
    [tableViewList registerClass:[List2Cell class] forCellReuseIdentifier:@"cell2"];
    [tableViewList registerNib:[UINib nibWithNibName:@"List3Cell" bundle:nil] forCellReuseIdentifier:@"cell3"];
    [tableViewList registerNib:[UINib nibWithNibName:@"List4Cell" bundle:nil] forCellReuseIdentifier:@"cell4"];
    [tableViewList registerNib:[UINib nibWithNibName:@"List5Cell" bundle:nil] forCellReuseIdentifier:@"cell5"];
    tableViewList.tag = 21;//标识tableView
    [self.leftView addSubview:tableViewList];
   //tableViewList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableViewList.scrollEnabled = YES;
}
-(void)creatLeftScrollView{
    
    leftScrollView = [[LeftSelectScroll alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth*0.25, kScreenHeight-(kNav_H)-(kTabbar_H))];
    
    leftScrollView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.000];;
    
    [leftScrollView setLeftSelectArray:leftDataSource];
    
    leftScrollView.leftSelectDelegate = self;
    
    leftScrollView.delegate = self;
    
    
    [self.leftView addSubview:leftScrollView];
}

#pragma mark 点击左侧切换右侧的代理方法
-(void)clickLeftSelectScrollButton:(NSInteger)indexPath{
    
    isScrollSetSelect = NO;
    [tableViewList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section{
  
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isScrollSetSelect = YES ;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (tableView == tableViewList) {
        if (tableView.tag == 21) {
            if (isScrollSetSelect == YES) {
               
                [leftScrollView setSelectButtonWithIndexPathSection:section];
            }
            return [self viewForHeaderView:section];
        }else{
            return nil;
        }
        
    }
    return nil;
}
//实际需要会修改
-(UIView*)viewForHeaderView:(NSInteger)parama{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 32)];
    label.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
    if (leftDataSource.count != 0) {
        label.text = leftDataSource[parama];
    }
    return label;
}

#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == tableViewList) {
        return  leftDataSource.count ;
    }
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == tableViewList) {
        if (section == 0) {
            return _data1.count;
        }else if (section == 1){
            return _data2.count;
        }else if (section == 2){
            return _data3.count;
        }else if (section == 3){
            return 1;
        }else if (section == 4){
            return  1;
        }
        
    }
    
    return _data6.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == tableViewList) {
        return  25 ;
    }
    return 0.0;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == tableViewList) {
        if (indexPath.section == 0) {
            return 44.0;
        }else if (indexPath.section == 1){
            return 80.0;
        }else if (indexPath.section == 2){
            return 80.0;
        }else if (indexPath.section == 3){
            return 141.0;
        }else if (indexPath.section == 4){
            return 184.0;
        }
        
    }
    return 179;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == tableViewList) {
        if (indexPath.section == 0) {
            for (int i = 0; i < _data1.count; i++) {
                if (indexPath.row == i) {
                    List2Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    if (_data1.count != 0) {
                        cell.model = _data1[indexPath.row];
                    }
                    return cell;
                }
            }
        }
        if (indexPath.section == 1) {
            
            List3Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            if (_data2.count != 0) {
                cell.model = _data2[indexPath.row];
                if (cell.model.isBtnAction == YES) {
                    
                    [cell.isImg setImage:[UIImage imageNamed:@"套餐申请_勾选_红"]];
                }else{
                    
                    [cell.isImg setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"]];
                }
                
            }
            cell.section = indexPath.section;
            cell.row = indexPath.row;
            
            
            return cell;
        }
        if (indexPath.section == 2) {
            
            List3Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            if (_data3.count != 0) {
                if (_data3.count != 0) {
                    cell.model = _data3[indexPath.row];
                    if (cell.model.isBtnAction == YES) {
                        
                        [cell.isImg setImage:[UIImage imageNamed:@"套餐申请_勾选_红"]];
                    }else{
                        
                        [cell.isImg setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"]];
                    }
                    
                }
            }
            cell.section = indexPath.section;
            cell.row = indexPath.row;
            
            return cell;
            
        }
        if (indexPath.section == 3) {
            List4Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textDelegate = self;
            cell.areaText.keyboardType =  UIKeyboardTypeNumberPad;
          
            return cell;
        }
        
        if (indexPath.section == 4) {
            List5Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isSection = indexPath.section;
            cell.delegate = self;
            
            return cell;
        }
        
    }else if (tableView == self.rightTab){
        
        IncreaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IncreaseCell" forIndexPath:indexPath];
           cell.delegate = self;
          cell.row = indexPath.row;
        if (_data6.count != 0) {
            cell.model = _data6[indexPath.row];
            NSLog(@"***%d***",cell.model.add);
            if (cell.model.add == YES) {
                NSLog(@"^^^^%d",cell.model.add);
                cell.addArea.hidden = YES;
                cell.wanchengBtn.hidden = NO;
                cell.areaLabel.hidden = NO;
                cell.promptLabel.hidden = NO;
                
                cell.text.hidden = NO;
                cell.btn1.hidden = YES;
                cell.btn2.hidden = YES;
                cell.btn3.hidden = YES;
                cell.btn4.hidden = YES;
                
                cell.introduceLabel.hidden = YES;
                cell.introduceLabel1.hidden = YES;
                cell.introduceLabel2.hidden = YES;
                cell.introduceLabel3.hidden = YES;
                
                
            }else if (cell.model.add == NO){
                cell.addArea.hidden = NO;
               cell.wanchengBtn.hidden = YES;
                cell.areaLabel.hidden = YES;
                cell.promptLabel.hidden = YES;
                cell.text.hidden = YES;
                if (![cell.model.string1 isEqual:@""]) {
                    cell.introduceLabel1.hidden = NO;
                   cell.btn1.hidden = NO;
                    
                }else{
                    cell.introduceLabel1.hidden = YES;
                    cell.btn1.hidden = YES;
                }
                if (![cell.model.string2 isEqual:@""]) {
                   cell.introduceLabel2.hidden = NO;
                    cell.btn2.hidden = NO;
                    
                }else{
                   cell.introduceLabel2.hidden = YES;
                    cell.btn2.hidden = YES;
                }
                if (![cell.model.string3 isEqual:@""]) {
                    cell.introduceLabel.hidden = NO;
                   cell.btn3.hidden = NO;
                    
                }else{
                  cell.introduceLabel.hidden = YES;
                    cell.btn3.hidden = YES;
                }
                if (![cell.model.string4 isEqual:@""]) {
                 cell.introduceLabel3.hidden = NO;
                    cell.btn4.hidden = NO;
                    
                }else{
                   cell.introduceLabel3.hidden = YES;
                   cell.btn4.hidden = YES;
                }
            
            }
        }
   
     
        return cell;
        
    }
    static NSString *cellID = @"cell33";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] ;
    }
    return cell;
}
#pragma mark ----------- 切换页面 回收键盘的代理方法的实现  --------------
- (void)List4celltextView:(UITextView *)textView {
    self.TextView = textView;
}
- (void)List4cell:(UITextField *)text {
    self.leftTF = text;
}
- (void)cellshouddidEid:(UITextField *)text {
    self.rightTF = text;
}
#pragma mark Cell代理方法  listcell3 代理的实现方法
- (void)cellCentDelegate:(NSString *)string Bool:(BOOL)isDelete section:(NSInteger)section row:(NSInteger)row{
    string = [string stringByAppendingFormat:@";"];
    if (section == 1) {
        if (_zcbx.length == 0) {
            _zcbx = string;
            _isAction = isDelete;
            PriceModel *models = _data2[row];
            models.isBtnAction = isDelete;
            [_data2 replaceObjectAtIndex:row withObject:models];
        }else if (_zcbx.length != 0){
            if (isDelete == NO) {
                PriceModel *models = _data2[row];
                models.isBtnAction = isDelete;
                [_data2 replaceObjectAtIndex:row withObject:models];
                NSArray *array = [_zcbx componentsSeparatedByString:string];
                _zcbx = @"";
                for (int i = 0;  i < array.count-1; i++) {
                    _zcbx = [_zcbx stringByAppendingString:array[i]];
                }
            }else if (isDelete == YES){
                PriceModel *models = _data2[row];
                models.isBtnAction = isDelete;
                [_data2 replaceObjectAtIndex:row withObject:models];
                _zcbx = [_zcbx stringByAppendingFormat:@"%@",string];
            }
        }
    }else if (section == 2){
        if (_jcgc.length == 0) {
            _jcgc = string;
            _isAction = isDelete;
            PriceModel *models = _data3[row];
            models.isBtnAction = isDelete;
            [_data3 replaceObjectAtIndex:row withObject:models];
        }else if (_jcgc.length != 0){
            if (isDelete == NO) {
                PriceModel *models = _data3[row];
                models.isBtnAction = isDelete;
                [_data3 replaceObjectAtIndex:row withObject:models];
                NSArray *array = [_jcgc componentsSeparatedByString:string];
                _jcgc = @"";
                for (int i = 0; i < array.count-1; i++) {
                    _jcgc = [_jcgc stringByAppendingString:array[i]];
                }
            }else if (isDelete == YES){
                PriceModel *models = _data3[row];
                models.isBtnAction = isDelete;
                [_data3 replaceObjectAtIndex:row withObject:models];
                _jcgc = [_jcgc stringByAppendingFormat:@"%@",string];
            }
        }
    }
}

// 基础  ListCell4 代理方法的实现  ********************
- (void)delegateAction:(NSString *)str{
    
    basisPrice = [str integerValue];
    combinedPrice = 0;
    // 装修合计价格
    combinedPrice = basisPrice+increasePrice;
    _priceLabel1.text = [NSString stringWithFormat:@"%ld元",(long)basisPrice];
    _downLabel.text = [NSString stringWithFormat:@"装修合计(%ld元)",(long)combinedPrice];
    
    
}

// 先判断是否登录,如果已登录就提交需求,如果未登录就转登录界面list5cell的代理方法的实现
- (BOOL)cell5CentDelegate:(NSString *)string section:(NSInteger)section{
    NSLog(@"#######需求提交%@",string);
    _remark = string;
    return YES;
}
#pragma mark -- 需求提交*******************************************
- (void)loadNetWorkingMid:(NSInteger)m zcbx:(NSString *)z jcbx:(NSString *)j remak:(NSString *)r packag:(NSString *)p{
    NSLog(@"****%@",_remark);
    NSLog(@"&&&&&&%@",z);
    AFHTTPSessionManager *MyManager = [AFHTTPSessionManager manager];
    MyManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    [parameters setObject:@"b107d5130286d3322d64d9f417ce5e2c" forKey:@"pwdstr"];
    if (m > 0) {
        [parameters setObject:[NSNumber numberWithInteger:m] forKey:@"mid"];
    }
    if (_packageStr.length > 0) {
        if ([_packageStr isEqual:@"package-1"]) {
            [parameters setObject:@"package-1" forKey:@"mtype"];
        }else if ([_packageStr isEqual:@"package-2"]){
            [parameters setObject:@"package-2" forKey:@"mtype"];
        }else if ([_packageStr isEqual:@"package-3"]){
            [parameters setObject:@"package-3" forKey:@"mtype"];
        }
    }
    if (z.length > 0) {
        [parameters setObject:z forKey:@"zcbx"];
    }
    if (j.length > 0) {
        [parameters setObject:j forKey:@"jcgc"];
    }
    if (r.length > 0) {
        [parameters setObject:r forKey:@"remark"];
    }
    
    [MyManager POST:@"http://api.xrzmall.com/api/upgrade.php" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"####%@",dataDict);
        
        NSString *string = [dataDict objectForKey:@"errcode"];
        if ([string intValue] == 100000) {
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"申请已提交" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertView addAction:cancelAction];
            [self presentViewController:alertView animated:YES completion:nil];
            
        }else if ([string intValue] == 100001){
        }else if ([string intValue] == 100002){
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"提交失败");
    }];
    
}
#pragma mark increaseCell 的代理方法的实现 *******************
- (void)cellBOOL:(BOOL)add row:(NSInteger)row{
    _add = add;
    PriceModel1 *modle = _data6[row];
   modle.add = add;
    NSLog(@"%ld",row);
    NSLog(@"***%d",_add);
}
// 增加项
- (void)cellPriceDelegate:(NSInteger)price{
    
    _priceLabel2.text = [NSString stringWithFormat:@"%ld元",price];
    combinedPrice = 0;
    combinedPrice = price+basisPrice;
    _downLabel.text = [NSString stringWithFormat:@"装修合计(%ld元)",combinedPrice];
    
}

- (void)increaseCellIsBtnAction:(BOOL)isBtnAction isBtn:(NSInteger)isBtn row:(NSInteger)row{
    
    if (isBtn == 1) {
        PriceModel1 *model = _data6[row];
        model.isHidden1 = isBtnAction;
        [_data6 replaceObjectAtIndex:row withObject:model];
    }else if (isBtn == 2){
        PriceModel1 *model = _data6[row];
        model.isHidden2 = isBtnAction;
        [_data6 replaceObjectAtIndex:row withObject:model];
    }else if (isBtn == 3){
        PriceModel1 *model = _data6[row];
        model.isHidden3 = isBtnAction;
        [_data6 replaceObjectAtIndex:row withObject:model];
    }else if (isBtn == 4){
        PriceModel1 *model = _data6[row];
        model.isHidden4 = isBtnAction;
        [_data6 replaceObjectAtIndex:row withObject:model];
    }
    
}
#pragma mark  *************最下面的基础可增加项 ************************
- (UILabel *)priceLabel2{
    if (!_priceLabel2) {
        _priceLabel2 = [[UILabel alloc]init];
        _priceLabel2.frame = CGRectMake(self.increaseLabel.frame.origin.x+self.increaseLabel.frame.size.width, self.basisLabel.frame.origin.y, [UIScreen mainScreen].bounds.size.width - self.middleView.frame.origin.x-56, self.basisLabel.frame.size.height);
        _priceLabel2.text = @"0元";
        _priceLabel2.font = [UIFont systemFontOfSize:15.0];
        _priceLabel2.textColor = [UIColor whiteColor];
        _priceLabel2.textAlignment = NSTextAlignmentRight;
        
    }
    return _priceLabel2;
}

- (UILabel *)increaseLabel{
    
    if (!_increaseLabel) {
        _increaseLabel = [[UILabel alloc]init];
        _increaseLabel.frame = CGRectMake(self.basisLabel.frame.origin.x+self.middleView.frame.origin.x+4, self.basisLabel.frame.origin.y, 45, self.basisLabel.frame.size.height);
        _increaseLabel.text = @"增加项";
        _increaseLabel.textColor = [UIColor whiteColor];
        _increaseLabel.textAlignment = NSTextAlignmentCenter;
        _increaseLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _increaseLabel;
}

- (UILabel *)priceLabel1{
    
    if (!_priceLabel1) {
        _priceLabel1 = [[UILabel alloc]init];
        _priceLabel1.frame = CGRectMake(self.basisLabel.frame.origin.x+self.basisLabel.frame.size.width, self.basisLabel.frame.origin.y, [UIScreen mainScreen].bounds.size.width - self.middleView.frame.origin.x-48, self.basisLabel.frame.size.height);
        _priceLabel1.text = @"0元";
        _priceLabel1.textColor = [UIColor whiteColor];
        _priceLabel1.font = [UIFont systemFontOfSize:15.0];
        _priceLabel1.textAlignment = NSTextAlignmentRight;
    }
    return _priceLabel1;
}

- (UILabel *)basisLabel{
    
    if (!_basisLabel) {
        _basisLabel = [[UILabel alloc]init];
        _basisLabel.frame = CGRectMake(4, 4, 40, self.blackView.frame.size.height-8);
        _basisLabel.text = @"基础";
        [_basisLabel setTextColor:[UIColor whiteColor]];
        _basisLabel.font = [UIFont systemFontOfSize:15.0];
        _basisLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _basisLabel;
}

- (UIView *)middleView{
    
    if (!_middleView) {
        _middleView = [[UIView alloc]init];
        _middleView.backgroundColor = [UIColor whiteColor];
        _middleView.frame = CGRectMake(self.blackView.frame.size.width/2.0, 2, 1, self.blackView.frame.size.height-4);
        
    }
    return _middleView;
}

- (UIView *)blackView{
    if (!_blackView) {
        _blackView = [[UIView alloc]init];
        _blackView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height -138, [UIScreen mainScreen].bounds.size.width, 30);
        _blackView.backgroundColor = [UIColor blackColor];
    }
    return _blackView;
}

- (UILabel *)downLabel{
    
    if (!_downLabel) {
        _downLabel = [[UILabel alloc]init];
        _downLabel.frame = CGRectMake(self.downView.frame.origin.x, self.downView.frame.origin.x, [UIScreen mainScreen].bounds.size.width , self.downView.frame.size.height);
        _downLabel.text = @"装修合计(0元)";
        [_downLabel setTextColor:[UIColor whiteColor]];
        _downLabel.font = [UIFont systemFontOfSize:15.0];
        _downLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _downLabel;
}

- (UIView *)downView{
    
    if (!_downView) {
        _downView = [[UIView alloc]init];
        _downView.backgroundColor = [UIColor colorWithRed:156.0/255.0 green:208.0/255.0 blue:111.0/255.0 alpha:1.0];
        
        _downView.frame = CGRectMake(0, ScreenH-108, [UIScreen mainScreen].bounds.size.width,44);
    }
    return _downView;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
