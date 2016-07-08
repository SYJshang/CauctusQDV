//
//  XRZDetailedController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZDetailedController.h"
#import "XRZDetatialCell.h"
#import "XRZFillInController.h"
#import "XRZFishingInfoCell.h"
#import "XRZStateCell.h"
#import "XRZInfomationCell.h"
#import "SaveNameFiveCell.h"
#import "XRZPhotoController.h"
#import "WyzAlbumViewController.h"

@interface XRZDetailedController ()

@property(nonatomic,strong) NSMutableArray  *imageNames;
@property(nonatomic,strong) NSMutableArray  *urlArrays;

@end

@implementation XRZDetailedController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"订单详情" font:20];

    
    [self setNavition];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZDetatialCell" bundle:nil] forCellReuseIdentifier:@"form"];
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZInfomationCell" bundle:nil] forCellReuseIdentifier:@"information"];
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZFishingInfoCell" bundle:nil] forCellReuseIdentifier:@"introduce"];
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZStateCell" bundle:nil] forCellReuseIdentifier:@"state"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFiveCell" bundle:nil] forCellReuseIdentifier:@"five"];
    
    
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
    
    //左边naVBar
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
    //右边NavBar
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW - 10, 5, 40,20)];
    //    [btn1 setTitle:@"保存" forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"抢单提醒_电话"] forState:UIControlStateNormal];
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



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        
        XRZDetatialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"form"];
        cell.iconImage.layer.masksToBounds = YES;
        cell.iconImage.layer.cornerRadius = 30;
        
        cell.processBtn.layer.masksToBounds = YES;
        cell.processBtn.layer.cornerRadius = 12;
        cell.processBtn.layer.borderWidth = 2;
        cell.processBtn.layer.borderColor = HWColor(63, 203, 125).CGColor;
        [cell.processBtn setTitleColor: HWColor(63, 203, 125) forState:UIControlStateNormal];
        
        return cell;
        
    }else if (indexPath.row == 1){
        
        XRZInfomationCell *cell =[tableView dequeueReusableCellWithIdentifier:@"information"];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(edit)];
        [cell.contentView addGestureRecognizer:gesture];
        return cell;
        
    }else if (indexPath.row == 2){
        
        XRZFishingInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introduce"];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(edit)];
        [cell.contentView addGestureRecognizer:gesture];
        return cell;
    }else if (indexPath.row == 3){
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.textLabel.text = @"进度跟踪";
        }
        return cell;
    }else if (indexPath.row > 3 && indexPath.row < 11){
        
        XRZStateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"state"];
        
        cell.upload.layer.masksToBounds = YES;
        cell.upload.layer.cornerRadius = 16;
        cell.upload.layer.borderWidth = 2;
        cell.upload.layer.borderColor = HWColor(63, 203, 125).CGColor;
        [cell.upload setTitleColor: HWColor(63, 203, 125) forState:UIControlStateNormal];
        [cell.upload addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
        
        cell.remind.layer.masksToBounds = YES;
        cell.remind.layer.cornerRadius = 16;
        cell.remind.backgroundColor = HWColor(63, 203, 125);

        
        return cell;
        
    }else if (indexPath.row == 11){
        SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five"];
        [cell.btn setTitle:@"未完工" forState:UIControlStateNormal];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.navigationController pushViewController:[XRZFillInController new] animated:YES];
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }else if (indexPath.row == 1){
        
        return 125;
    }else if (indexPath.row == 2){
        
        return 80;
    }else if (indexPath.row == 11){
        
        return 80;
    }
    
    return 50;
}

- (void)edit{
    
    [self.navigationController pushViewController:[XRZFillInController new] animated:YES];
}

- (void)action{
    
//    [self showPhotoBrowser:0];
    
    
    [self.navigationController pushViewController:[XRZPhotoController new] animated:YES];
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
