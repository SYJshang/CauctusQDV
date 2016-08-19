//
//  XRZSetMealController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZSetMealController.h"
#import "ShowTableViewCell.h"
#import "InstructionsViewController.h"
#import "ProcessViewController.h"
#import "PriceViewController.h"
#import "AFNetworking.h"
#import "StoreModel.h"
#import "PreCollectionViewCell.h"
#import "QuestionCollectionCell.h"
#import "CaseFourBtnCollectionCell.h"
#import "StoreCollectionCell.h"
#import "HCell4.h"
#import "FCell8.h"
#import "ApplyViewController.h"
#import "UIView+SDAutoLayout.h"
#import "MJRefresh.h"
#import "DNPageView.h"
#import "NSFileManager+DN.h"
#import "AppDelegate.h"
#import "FJAdView.h"
#import "SDCycleScrollView.h"

#define Color [UIColor colorWithRed:155 / 255.0 green:210 / 255.0 blue:105 / 255.0 alpha:1.0]

@interface XRZSetMealController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    
    NSMutableDictionary *_parameters;
    
    NSMutableArray *_datas;
    StoreModel *_storeModel;
    
    NSMutableArray *_dataa;// 数据源数组
    StoreAcseListModel *_acseListModel;
    
    NSMutableArray *_datab;
    TclistModel *_tclistModel;
    
    NSMutableArray *_datac;
    QueslistModel *_quesListModel;
    FJAdView *_adview;
    
    MJRefreshAutoNormalFooter *footer;
    
    
    NSMutableArray *storeArray;
    
    NSMutableArray *_rowArray;
    
    CGFloat hegit;
    
    NSArray *SDArray;// 轮播图
}
@property (nonatomic, strong)UIImageView *imageView;


@property (nonatomic, strong) FJAdView *adview;


@property (nonatomic, strong) UITableView *tableview;


@end

@implementation XRZSetMealController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableview.mj_footer.automaticallyChangeAlpha = YES;
       // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:15.0];
    
    // 设置颜色
    footer.stateLabel.textColor = Color;
    
    //    // 设置footer
    self.tableview.mj_footer = footer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"套餐" font:20];
    SDArray = @[@"商城_688",@"商城_1288",@"商城_1888"];
    
    _dataa = [[NSMutableArray alloc]init];
    _datab = [[NSMutableArray alloc]init];
    _datac = [[NSMutableArray alloc]init];
    storeArray = [[NSMutableArray alloc]init];
    _rowArray = [[NSMutableArray alloc]init];
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [_rowArray addObjectsFromArray:arr];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    
    [self.view addSubview:self.tableview];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableview registerClass:[CaseFourBtnCollectionCell class] forCellReuseIdentifier:@"cell2"];
    
    [self.tableview registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"cell3"];
    
    [self.tableview registerClass:[PreCollectionViewCell class] forCellReuseIdentifier:@"cell4"];
    
    
    [self.tableview registerClass:[QuestionCollectionCell class] forCellReuseIdentifier:@"cell5"];
    
    
    [self.tableview registerNib:[UINib nibWithNibName:@"StoreCollectionCell" bundle:nil] forCellReuseIdentifier:@"cell6"];
    [self.tableview registerNib:[UINib nibWithNibName:@"HCell4" bundle:nil] forCellReuseIdentifier:@"HCell"];
    
    
    
    [self.tableview registerNib:[UINib nibWithNibName:@"FCell8" bundle:nil] forCellReuseIdentifier:@"FCell"];
    // 关联代理
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.sectionHeaderHeight = 0;
    self.tableview.sectionFooterHeight = 0;
    self.tableview.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    [self loadNetWorking];
   // [self setFristLunch];
    
}
- (void)loadMoreData
{
    // 1.添加假数据
    for (int i = 0; i< _datac.count - 2;i ++) {
        [_rowArray addObject:@"1"];
    }
    if (_rowArray.count <= 6 + _datac.count) {
        // 刷新表格
        
        [self.tableview reloadData];
        
        // 拿到当前的上拉刷新控件，变为没有更多数据的状态
        [self.tableview.mj_footer endRefreshingWithNoMoreData];
        
    }else{
        
        // 拿到当前的上拉刷新控件，变为没有更多数据的状态
        [self.tableview.mj_footer endRefreshingWithNoMoreData];
        
    }
}

#pragma mark LoadNetWorking
- (void)loadNetWorking{
   
    AFHTTPSessionManager *MyManager = [AFHTTPSessionManager manager];
    MyManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (!_parameters) {
        _parameters = [NSMutableDictionary new];
        [_parameters setObject:@"b107d5130286d3322d64d9f417ce5e2c" forKey:@"pwdstr"];
        
    }
    [MyManager GET:@"http://api.xrzmall.com/api/tc_home.php" parameters:_parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *personalArray = [dict objectForKey:@"datas"];
        
        
        for (NSDictionary *dicts in personalArray) {
            
            _storeModel = [[StoreModel alloc]initWithDictionary:dicts error:nil];
            [_datas addObject:_storeModel];
            NSArray *arraya = [dicts objectForKey:@"caselist"];
            NSArray *arrayb = [dicts objectForKey:@"tclist"];
            NSArray *arrayc = [dicts objectForKey:@"queslist"];
            
            for (NSDictionary *adict in arraya) {
                _acseListModel = [[StoreAcseListModel alloc]initWithDictionary:adict error:nil];
                [_dataa addObject:_acseListModel];
            }
            for (NSDictionary *bdict in arrayb) {
                _tclistModel = [[TclistModel alloc]initWithDictionary:bdict error:nil];
                [storeArray addObject:_tclistModel];
                
                NSString *xiaoqu = _tclistModel.xiaoqu;
                NSString *taocan = _tclistModel.tc;
                NSString *time = _tclistModel.sqtime;
                NSString *name = _tclistModel.nickname;
                NSString *str = [NSString stringWithFormat:@"%@ %@ %@ %@",name,xiaoqu,taocan,time];
                
                [_datab addObject:str];
            }
            for (NSDictionary *cdict in arrayc) {
                _quesListModel = [[QueslistModel alloc]initWithDictionary:cdict error:nil];
                [_datac addObject:_quesListModel];
            }
        }
        
        [_tableview reloadData];
        [_adview beginScroll];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


#pragma mark - table view dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _rowArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //        return CGSizeMake(0, 0);
    if (indexPath.row == 0) {
        return 170;
    }else if (indexPath.row == 1){
        return 95;
    }else if (indexPath.row == 2) {
        return 90;
    }else if (indexPath.row == 3){
        return 30;
    }else if (indexPath.row == 4){
        return 345;
    }else if (indexPath.row == 5){
        return 30;
    }else if ( 5  < indexPath.row < _rowArray.count){
        if (_dataa.count > 0) {
            
            return [QuestionCollectionCell cellHeightWithTextModel:_datac[indexPath.row - 6]];
            
        }else{
            return 0;
        }
        
    }
    return 50;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.adview closeScroll];
}
- ( void )scrollViewDidEndDragging:( UIScrollView  *)scrollView willDecelerate:( BOOL )decelerate

{
    
    if(!decelerate)
        
    {
        [self.adview beginScroll];
    }
    
}

- ( void )scrollViewDidEndDecelerating:( UIScrollView  *)scrollView

{
    [self.adview beginScroll];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        StoreCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell6" forIndexPath:indexPath];
        SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,ScreenW,170) delegate:self placeholderImage:nil];
        scrollView.tag = 2;
        scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
  
        
        if (SDArray.count > 0) {
            scrollView.imageURLStringsGroup = SDArray;
        }else{
            scrollView.imageURLStringsGroup = @[@"414x85"];
        }
        
        
        [cell addSubview:scrollView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
       
        cell.layer.borderWidth=0.0;
        
        return cell;
    }
    if (indexPath.row == 1) {
        CaseFourBtnCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        
        cell.isSiez = 1;
        UIButton *ins = (UIButton *)[cell viewWithTag:50];
        [ins addTarget:self action:@selector(instructions) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *pro = (UIButton *)[cell viewWithTag:51];
        [pro addTarget:self action:@selector(process) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *price = (UIButton *)[cell viewWithTag:52];
        [price addTarget:self action:@selector(insureClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *apply = (UIButton *)[cell viewWithTag:53];
        [apply addTarget:self action:@selector(geomancyClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *insure = (UIButton *)[cell viewWithTag:12];
        [insure addTarget:self action:@selector(insureClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *geomancy = (UIButton *)[cell viewWithTag:13];
        [geomancy addTarget:self action:@selector(geomancyClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    if (indexPath.row == 2) {
        ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_datab.count) {
            
            
            static dispatch_once_t dis;
            dispatch_once(&dis,^{
                [cell setData:_datab];
                self.adview = cell.adview;
                
                
                
            });
        }
        
        return cell;
    }
    if (indexPath.row == 3) {
        HCell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"HCell" forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
        
        return cell;
    }
    if (indexPath.row == 4) {
        PreCollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
        
        //        cell.layer.borderWidth = 0.3;
        if (_dataa.count == 0) {
            //            [self loadNetWorking];
        }else{
            StoreAcseListModel *model = _dataa[0];
            cell.model = model;
            
            StoreAcseListModel *model1 = _dataa[1];
            cell.model1 = model1;
            
            StoreAcseListModel *model2 = _dataa[2];
            cell.model2 = model2;
            
            StoreAcseListModel *model3 = _dataa[3];
            cell.model3 = model3;
            
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureTap:)];
            [cell.leftView addGestureRecognizer:tap];
            cell.leftView.tag = 1;
            
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureTap:)];
            [cell.rightView addGestureRecognizer:tap1];
            cell.rightView.tag = 2;
            
            
            UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureTap:)];
            [cell.bootomLeftView addGestureRecognizer:tap2];
            cell.bootomLeftView.tag = 3;
            
            
            UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureTap:)];
            [cell.bootomRightView addGestureRecognizer:tap3];
            cell.bootomRightView.tag = 4;
            cell.backgroundColor = [UIColor whiteColor];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone; // 取消Cell点击
        }
        
        cell.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
        return cell;
    }
    
    if (indexPath.row == 5) {
        FCell8 *cell = [tableView dequeueReusableCellWithIdentifier:@"FCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
        
        return cell;
    }
    if ( 5 < indexPath.row < _rowArray.count) {
        QuestionCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_datac.count == 0) {
            
        }else{
            
            QueslistModel *model = _datac[indexPath.row-6];
            cell.model = model;
            
        }
        return cell;
    }
    
    return [[UITableViewCell alloc]init];
}

- (void)GestureTap:(UIGestureRecognizer *)sender{
   
  
            
            if (sender.view.tag == 1) {
                NSLog(@"%ld",sender.view.tag);
            }else if (sender.view.tag == 2){
               NSLog(@"%ld",sender.view.tag);
            }else if (sender.view.tag == 3){
              NSLog(@"%ld",sender.view.tag);
            }else if (sender.view.tag == 4){
              NSLog(@"%ld",sender.view.tag);
            }
            
            
    
    
}
- (void)instructions{
    
    InstructionsViewController *insVC = [[InstructionsViewController alloc]init];
    
    [self.navigationController pushViewController:insVC animated:YES];
    
}
- (void)process{
    
    ProcessViewController *proVC = [[ProcessViewController alloc]init];
    [self.navigationController pushViewController:proVC animated:YES];
}
- (void)insureClick{
    
    PriceViewController *price = [[PriceViewController alloc]init];
    
    [self.navigationController pushViewController:price animated:YES];
    
    
}
- (void)geomancyClick{
    
    ApplyViewController *apply = [[ApplyViewController alloc]init];
    [self.navigationController pushViewController:apply animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
