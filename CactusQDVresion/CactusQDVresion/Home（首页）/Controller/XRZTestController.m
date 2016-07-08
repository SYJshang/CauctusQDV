//
//  XRZTestController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZTestController.h"
#import "SaveNameFirstCell.h"
#import "SaveNameSecondCell.h"
#import "SaveNameThreeCell.h"
#import "SaveNameFourCell.h"
#import "SaveNameFiveCell.h"
#import "SaveNameSixCell.h"
#import "XRZBackButton.h"
#import "UIView+SDAutoLayout.h"
#import "XRZPickerCell.h"
#import "AreaPickerView.h"
#import "UIView+SDAutoLayout.h"
#import "XRZAlertView.h"
#import "XRZCommonModel.h"
#import "UIImageView+WebCache.h"



@interface XRZTestController ()<UITableViewDataSource,UITableViewDelegate,AreaPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{

    //身份证反面
    UIButton *resevstBtn;
    //身份证正面
    UIButton *frontBtn;
    //证件
    UIButton *papersBtn;
    
    //图片2进制路径
    NSString *filePath;
    
    XRZCommonModel *commonModel;
}

@property (nonatomic, strong) UITableView *tableView;

///标题
@property (nonatomic, strong) NSArray *dataSoucre;
///占位符
@property (nonatomic, strong) NSArray *placeHoldArray;

@property (nonatomic, strong) AreaPickerView *areaPickerView;


@property (nonatomic, strong) UIButton *province;
@property (nonatomic, strong) UIButton *city;
@property (nonatomic, strong) UIButton *district;

@property (nonatomic, strong) UIView *table;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, assign) BOOL isNO;

@property (nonatomic, strong) NSString *str1;
@property (nonatomic, strong) NSString *str2;
@property (nonatomic, strong) NSString *str3;

@end

@implementation XRZTestController


static NSString *cellIdentifier = @"MTCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isNO = YES;
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStylePlain];
    self.tableView = table;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFirstCell" bundle:nil] forCellReuseIdentifier:@"first"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameSecondCell" bundle:nil] forCellReuseIdentifier:@"second"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameThreeCell" bundle:nil] forCellReuseIdentifier:@"three"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFourCell" bundle:nil] forCellReuseIdentifier:@"four"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameFiveCell" bundle:nil] forCellReuseIdentifier:@"five"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SaveNameSixCell" bundle:nil] forCellReuseIdentifier:@"six"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XRZPickerCell" bundle:nil] forCellReuseIdentifier:@"picker"];
    //标题
    self.dataSoucre = @[@"真实姓名", @"身份证号", @"联系手机", @"户籍所在地"];
    //占位符
    self.placeHoldArray = @[@"请输入真实姓名", @"请输入身份证号", @"请输入手机号码", @"如: 浙江省宁波市鄞州区金星小区"];
    
    [self setNavition];

}

- (void)setNavition{
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"用户验证" font:20];

    
    //左边naVBar
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 20,20)];
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
    
    //右边NavBar
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW - 10, 5, 40,20)];
    [btn1 setTitle:@"保存" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if (indexPath.row == 0) {
        
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        

        //判断是否实名
        if (commonModel.appreal == 0) {
            
            cell.titleText.text = self.dataSoucre[indexPath.row];
            cell.textField.placeholder = self.placeHoldArray[indexPath.row];
    
        }else{
            
            cell.titleText.text = self.dataSoucre[indexPath.row];
            cell.textField.placeholder = self.placeHoldArray[indexPath.row];
            cell.textField.text = commonModel.truename;
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row == 1) {
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        //判断是否有身份证号
        if (commonModel.appreal == 0) {
            cell.titleText.text = self.dataSoucre[indexPath.row];
            cell.textField.placeholder = self.placeHoldArray[indexPath.row];
        }else{
            cell.titleText.text = self.dataSoucre[indexPath.row];
            cell.textField.placeholder = self.placeHoldArray[indexPath.row];
            cell.textField.text = @"4xxxxxxxxxx123";
        }
        

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 2) {
        //判断是否有手机号
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
        if (commonModel.appreal == 0) {
            cell.titleText.text = self.dataSoucre[indexPath.row];
            cell.textField.placeholder = self.placeHoldArray[indexPath.row];
        }else{
            cell.titleText.text = self.dataSoucre[indexPath.row];
            cell.textField.placeholder = self.placeHoldArray[indexPath.row];
            cell.textField.text = commonModel.mobile;
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 3) {
        //判断是哪个类型
        SaveNameSixCell *cell = [tableView dequeueReusableCellWithIdentifier:@"six"];
        if ([commonModel.memtype isEqualToString:@"memtype-2"]) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.desc.text = @"装修公司";
        }else if ([commonModel.memtype isEqualToString:@"memtype-3"]){
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.desc.text = @"设计师";
        }else if ([commonModel.memtype isEqualToString:@"memtype-4"]){
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.desc.text = @"项目经理";
        }else if ([commonModel.memtype isEqualToString:@"memtype-5"]){
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.desc.text = @"工人";
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 4) {
        
        //判断工作年限
        SaveNameSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        
//        XRZLog(@"......%@",rect);
        
        if (commonModel.appreal == 0) {
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            [cell.chooseBtn setTitle:@"1年" forState:UIControlStateNormal];


        }else{
        
        if ([commonModel.workage isEqualToString:@"workage-1"]) {
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.chooseBtn setTitle:@"1年" forState:UIControlStateNormal];
        }else if ([commonModel.workage isEqualToString:@"workage-2"]){
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.chooseBtn setTitle:@"1-3年" forState:UIControlStateNormal];
        }else if ([commonModel.workage isEqualToString:@"workage-3"]){
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.chooseBtn setTitle:@"3-5年" forState:UIControlStateNormal];
        }else if ([commonModel.workage isEqualToString:@"workage-4"]){
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.chooseBtn setTitle:@"5-7年" forState:UIControlStateNormal];
        }else if ([commonModel.workage isEqualToString:@"workage-5"]){
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.chooseBtn setTitle:@"7-10年" forState:UIControlStateNormal];
        }else if ([commonModel.workage isEqualToString:@"workage-6"]){
            [cell.chooseBtn addTarget:self action:@selector(chooseTable:) forControlEvents:UIControlEventTouchUpInside];
            [cell.chooseBtn setTitle:@"10年以上" forState:UIControlStateNormal];
        }
    }
        self.btn = cell.chooseBtn;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 5) {
        
        //身份证选择照片
        SaveNameThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"three" forIndexPath:indexPath];
        
        if (commonModel.appreal == 0) {
            [cell.front addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
            frontBtn = cell.front;
            cell.front.tag = 1;
            [cell.reverse addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
            resevstBtn = cell.reverse;
            cell.reverse.tag = 2;

        }else{
            
            UIImageView *img = [[UIImageView alloc]init];
            [img sd_setImageWithURL:[NSURL URLWithString:commonModel.cardno1] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                [cell.front setBackgroundImage:image forState:UIControlStateNormal];
                
            }];
            
            
            UIImageView *img1 = [[UIImageView alloc]init];
            [img1 sd_setImageWithURL:[NSURL URLWithString:commonModel.cardno1] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                [cell.reverse setBackgroundImage:image forState:UIControlStateNormal];
                
            }];
            
            
            [cell.front addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
            frontBtn = cell.front;
            cell.front.tag = 1;
            [cell.reverse addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
            resevstBtn = cell.reverse;
            cell.reverse.tag = 2;
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 6) {
        //证件选择照片
        SaveNameFourCell *cell = [tableView dequeueReusableCellWithIdentifier:@"four" forIndexPath:indexPath];

        if (commonModel.appreal == 0) {
            [cell.papersBtn addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
            cell.papersBtn.tag = 3;
            papersBtn = cell.papersBtn;

        }else{
            
            UIImageView *img1 = [[UIImageView alloc]init];
            [img1 sd_setImageWithURL:[NSURL URLWithString:commonModel.qualificate] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                [cell.papersBtn setBackgroundImage:image forState:UIControlStateNormal];
                
            }];

            
            [cell.papersBtn addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
            cell.papersBtn.tag = 3;
            papersBtn = cell.papersBtn;

        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 7) {
        
        //户籍所在地
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];

        if (commonModel.appreal == 0) {
            cell.titleText.text = self.dataSoucre.lastObject;
            cell.textField.placeholder = self.placeHoldArray.lastObject;
        }else{
            
            cell.titleText.text = self.dataSoucre.lastObject;
            cell.textField.placeholder = self.placeHoldArray.lastObject;
            cell.textField.text = commonModel.hjcityarea;
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 8){
        
        //工作区域

        XRZPickerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"picker"];
        
        if (commonModel.appreal == 0) {
            [cell.mutableArray[0] addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            self.province = cell.mutableArray[0];
            [self.province setTitle:@"省" forState:UIControlStateNormal];
            
            [cell.mutableArray[1] addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            self.city = cell.mutableArray[1];
            [self.city setTitle:@"市" forState:UIControlStateNormal];

            
            [cell.mutableArray[2] addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            self.district = cell.mutableArray[2];
            [self.district setTitle:@"区" forState:UIControlStateNormal];
            
        }else{
            
            [cell.mutableArray[0] addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            self.province = cell.mutableArray[0];
            [self.province setTitle:self.str1 forState:UIControlStateNormal];
            
            [cell.mutableArray[1] addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            self.city = cell.mutableArray[1];
            [self.city setTitle:self.str2 forState:UIControlStateNormal];

            
            [cell.mutableArray[2] addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
            self.district = cell.mutableArray[2];
            [self.district setTitle:self.str3 forState:UIControlStateNormal];


    }
        
            return cell;
        
}else if (indexPath.row == 9){
        
        //详细地址
        SaveNameFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
    
    if (commonModel.appreal == 0) {
        cell.titleText.text = @"详细地址";
        cell.textField.placeholder = @"请输入详细地址（街、道、门牌号）";
 
    }else{
        cell.titleText.text = @"详细地址";
        cell.textField.placeholder = @"请输入详细地址（街、道、门牌号）";
        cell.textField.text = commonModel.addr;
    }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

        
    }else {
        //提交认证
        SaveNameFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.btn.layer.masksToBounds= YES;
        cell.btn.layer.cornerRadius = 20;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 5 || indexPath.row == 6) {
        return 120;
    }else if (indexPath.row == 10) {
        return 80;
    }else if (indexPath.row == 8){
        return 120;
    }
    else {
        return 44;
    }
}



- (void)areaPickerView:(AreaPickerView *)areaPickerView didFinishedSelectWithProvince:(NSString *)province city:(NSString *)city district:(NSString *)district {
//    [self.selectedAreaShowLabel setText:[NSString stringWithFormat:@"%@ %@ %@", province, city, district]];
    
    self.str1 = province;
    self.str2 = city;
    self.str3 = district;
    
    [self.province setTitle:province forState:UIControlStateNormal];
    [self.city setTitle:city forState:UIControlStateNormal];
    [self.district setTitle:district forState:UIControlStateNormal];
}

- (void)actionClick:(UIButton *)btn{
    if (btn.tag == 1) {
        XRZLog(@"1111111111");
    }
    
    XRZLog(@".....");
    
    if (self.areaPickerView == nil) {
        self.areaPickerView = [[[NSBundle mainBundle] loadNibNamed:@"AreaPickerView" owner:self options:nil] lastObject];
        self.areaPickerView.delegate = self;
    }
    [self.areaPickerView show];
        
}

- (void)choosePhoto:(XRZBackButton *)btn{
    
    

    
    if (btn.tag == 1) {
        
        papersBtn.selected = NO;
        resevstBtn.selected = NO;
        btn.selected = YES;

        [self alertChoose];
}
    
    
    if (btn.tag == 2) {
        
        papersBtn.selected = NO;
        frontBtn.selected = NO;
        btn.selected = YES;
        
        [self alertChoose];
}
//    
    if (btn.tag == 3) {
        resevstBtn.selected = NO;
        frontBtn.selected = NO;
        btn.selected = YES;
        
        [self alertChoose];
        
    }

}

//弹出视图
- (void)alertChoose{
    
    
    XRZAlertView *alertView = [XRZAlertView showInView:self.view withTitle:@"上传照片" message:@"请选择上传方式" confirmButtonTitle:@"拍照" cancelButtonTitle:@"相册"];
    
    [alertView handleCancel:^{
        //拍照
        [self takePhoto];
    
    }    handleConfirm:^{
        //照片
        [self LocalPhoto];

    }];
    
    alertView.TLAnimationType = (arc4random_uniform(10) % 2 == 0) ? TLAnimationType3D : tLAnimationTypeHinge;
    [alertView show];


}

//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else{
        
        XRZLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,@"/image.png"];
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        if (frontBtn.selected) {
            
            [frontBtn setBackgroundImage:image forState:UIControlStateNormal];
        }if (resevstBtn.selected) {
            [resevstBtn setBackgroundImage:image forState:UIControlStateNormal];

        }if (papersBtn.selected) {
            [papersBtn setBackgroundImage:image forState:UIControlStateNormal];
            
        }
        
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    XRZLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)sendInfo
{
    XRZLog(@"图片的路径是：%@", filePath);
    
}




//点击列表
- (void)chooseTable:(UIButton *)sender{
   

    //设置btn在当前的位置
    UIButton *button = sender;
    CGPoint correctedPoint = [button convertPoint:button.bounds.origin toView:self.tableView]; NSIndexPath *indexPath =
    [self.tableView indexPathForRowAtPoint:correctedPoint];
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:indexPath];
    CGRect rect = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
    
    self.btn.selected = YES;
//    self.btn.imageView.transform = CGAffineTransformMakeRotation(1 * (M_PI / 180.0f));
    
    
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    [self.view addSubview:bg];
    bg.backgroundColor = [UIColor grayColor];
    bg.alpha = 0.5;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(ScreenW - 120, rect.origin.y + 44,120, 240)];
    [bg addSubview:view];
//    view.backgroundColor = [UIColor blackColor];
    
    self.table = bg;
    
    
    if (_isNO) {
        
        NSArray *array = @[@"一年",@"1-3年",@"3-5年",@"5-7年",@"7-10年",@"10年以上"];
        
        for (int i = 0; i < 6; i ++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            btn.frame = CGRectMake(0, i * 40,120, 40);
            btn.tag = i + 1;
            
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateHighlighted];
            [btn setTitle:array[i] forState:UIControlStateNormal];
            
            [btn setBackgroundColor:[UIColor blackColor]];
            

            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [view addSubview:btn];
        }
        
        _isNO = NO;
 
    }else{
        
        
        [bg removeFromSuperview];
        
//        self.btn.selected = NO;
        self.table.hidden = YES;
        _isNO = YES;
    }
    
}


- (void)btnClick:(UIButton *)sender{
    
//    if (sender.tag == 1) {
//         self.btn.titleLabel.text = sender.titleLabel.text;
//    }else if (sender.tag == 2){
//         self.btn.titleLabel.text = sender.titleLabel.text;
//    }else if (sender.tag == 3){
//         self.btn.titleLabel.text = sender.titleLabel.text;
//    }else if (sender.tag == 4){
//         self.btn.titleLabel.text = sender.titleLabel.text;
//    }else if (sender.tag == 5){
//         self.btn.titleLabel.text = sender.titleLabel.text;
//    }
    
    if (sender.selected) {
        sender.backgroundColor = HWColor(63, 203, 125);
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    
    sender.backgroundColor = HWColor(63, 203, 125);
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
     self.btn.titleLabel.text = sender.titleLabel.text;
    [self.table removeFromSuperview];
    _isNO = YES;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    
    [self.table removeFromSuperview];
    _isNO = YES;

}


#pragma mark - table view delegate



@end
