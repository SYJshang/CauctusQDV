//
//  XRZLoginController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZRegistController.h"
#import "UIView+SDAutoLayout.h"
#import "AFNetworking.h"
#import "XRZLoginIDController.h"

@interface XRZRegistController (){
    NSMutableDictionary *_parameter;
    NSMutableDictionary *_LogAndRegparameter;
    NSMutableDictionary *_dict;
    
}
//头像
@property (strong, nonatomic)  UIImageView *icon;
//头像背景
@property (strong, nonatomic)  UIView *iconBg;
//选择职位背景
@property (strong, nonatomic)  UIView *positionBg;
//选择的职位
@property (strong, nonatomic)  UILabel *position;
//账号背景
@property (strong, nonatomic)  UIView *idBg;
//账号textFiled
@property (strong, nonatomic)  UITextField *numID;
//密码背景
@property (strong, nonatomic)  UIView *passwodBg;
//密码textfiled
@property (strong, nonatomic)  UITextField *password;

//密码背景
@property (strong, nonatomic)  UIView *passwodBg1;
//密码textfiled
@property (strong, nonatomic)  UITextField *password1;

//登录按钮
@property (strong, nonatomic)  UIButton *login;
//注册按钮
@property (strong, nonatomic)  UIButton *regiest;
//背景线
@property (strong, nonatomic)  UILabel *lineBg;

//职位的数组
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) UIView *selectView;


//@property (nonatomic, assign) BOOL hidden;

@end

@implementation XRZRegistController


//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        self.navigationController.navigationBarHidden = YES;
//    }
//    return self;
//}


- (NSArray *)array
{
    if (_array == nil) {
        _array = [[NSArray alloc]init];
    }
    return _array;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //布局
    [self layout];
}


//布局
- (void)layout{
    
    float iconTop = 0.05 * ScreenH;
    float iconHeight = 0.2 * ScreenH;
    float viewSpace = 0.06 * ScreenH;
    float viewHeight = 0.07 * ScreenH;
    float space = 0.013 * ScreenH;
    float login = 0.08 * ScreenH;
    float regiestSpace = 0.053 * ScreenH;
    
    self.iconBg = [[UIView alloc]init];
    [self.view addSubview:self.iconBg];
    self.iconBg.backgroundColor = HWColor(63, 203, 125);
    self.iconBg.sd_layout.topSpaceToView(self.view,iconTop).centerXEqualToView(self.view).heightIs(iconHeight).widthIs(iconHeight);
    self.iconBg.layer.masksToBounds = YES;
    self.iconBg.layer.cornerRadius = self.iconBg.frame.size.width / 2;
    
    UIImage *img = [UIImage imageNamed:@"登录默认头像"];
    self.icon = [[UIImageView alloc]initWithImage:img];
    [self.iconBg addSubview:self.icon];
    self.icon.sd_layout.centerXEqualToView(self.iconBg).centerYEqualToView(self.iconBg).widthIs(iconHeight - 5).heightIs(iconHeight - 5);
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = self.icon.frame.size.width / 2;
    
    self.positionBg = [[UIView alloc]init];
    [self.view addSubview:self.positionBg];
    self.positionBg.sd_layout.leftSpaceToView(self.view,40).rightSpaceToView(self.view,40).topSpaceToView(self.iconBg,viewSpace).heightIs(viewHeight);
    self.positionBg.layer.masksToBounds = YES;
    self.positionBg.layer.cornerRadius = 20;
    self.positionBg.layer.borderWidth = 2;
    self.positionBg.layer.borderColor = HWColor(63, 203, 125).CGColor;
    
    self.position = [[UILabel alloc]init];
    [self.positionBg addSubview:self.position];
    self.position.text = @"装修公司";
    self.position.sd_layout.leftSpaceToView(self.positionBg,10).topSpaceToView(self.positionBg,5).bottomSpaceToView(self.positionBg,5).rightSpaceToView(self.positionBg,30);

    
    
    self.idBg = [[UIView alloc]init];
    [self.view addSubview:self.idBg];
    self.idBg.sd_layout.widthRatioToView(self.positionBg,1).heightRatioToView(self.positionBg,1).leftEqualToView(self.positionBg).rightEqualToView(self.positionBg).topSpaceToView(self.positionBg,space);
    self.idBg.layer.masksToBounds = YES;
    self.idBg.layer.cornerRadius = 20;
    self.idBg.layer.borderWidth = 2;
    self.idBg.layer.borderColor = HWColor(63, 203, 125).CGColor;
    
    self.numID = [[UITextField alloc]init];
    [self.idBg addSubview:self.numID];
    self.numID.sd_layout.leftSpaceToView(self.idBg,10).topSpaceToView(self.idBg,5).bottomSpaceToView(self.idBg,5).rightSpaceToView(self.idBg,90);
    self.numID.placeholder = @"请输入名称";
    self.numID.borderStyle = UITextBorderStyleNone;
    
    
    
    self.passwodBg = [[UIView alloc]init];
    [self.view addSubview:self.passwodBg];
    self.passwodBg.sd_layout.widthRatioToView(self.idBg,1).heightRatioToView(self.idBg,1).centerXEqualToView(self.idBg).topSpaceToView(self.idBg,space);
    self.passwodBg.layer.masksToBounds = YES;
    self.passwodBg.layer.cornerRadius = 20;
    self.passwodBg.layer.borderWidth = 2;
    self.passwodBg.layer.borderColor = HWColor(63, 203, 125).CGColor;
    
    
    self.password = [[UITextField alloc]init];
    self.password.placeholder = @"请输入密码";
    [self.passwodBg addSubview:self.password];
    self.password.sd_layout.leftSpaceToView(self.passwodBg,10).rightSpaceToView(self.passwodBg,5).topSpaceToView(self.passwodBg,5).bottomSpaceToView(self.passwodBg,5);
    self.password.borderStyle = UITextBorderStyleNone;
    
    
    self.passwodBg1 = [[UIView alloc]init];
    [self.view addSubview:self.passwodBg1];
    self.passwodBg1.sd_layout.widthRatioToView(self.passwodBg,1).heightRatioToView(self.passwodBg,1).centerXEqualToView(self.passwodBg).topSpaceToView(self.passwodBg,space);
    self.passwodBg1.layer.masksToBounds = YES;
    self.passwodBg1.layer.cornerRadius = 20;
    self.passwodBg1.layer.borderWidth = 2;
    self.passwodBg1.layer.borderColor = HWColor(63, 203, 125).CGColor;
    
    
    self.password1 = [[UITextField alloc]init];
    self.password1.placeholder = @"请再次输入密码";
    [self.passwodBg1 addSubview:self.password1];
    self.password1.sd_layout.leftSpaceToView(self.passwodBg1,10).rightSpaceToView(self.passwodBg1,5).topSpaceToView(self.passwodBg1,5).bottomSpaceToView(self.passwodBg1,5);
    self.password1.borderStyle = UITextBorderStyleNone;
    
    
    
    
    self.login = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.login];
    [self.login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.login setBackgroundColor:HWColor(63,203,125)];
    [self.login setTitle:@"注册" forState:UIControlStateNormal];
    self.login.sd_layout.topSpaceToView(self.passwodBg1,login).leftEqualToView(self.passwodBg1).rightEqualToView(self.passwodBg1).heightRatioToView(self.passwodBg1,1);
    self.login.layer.masksToBounds = YES;
    self.login.layer.cornerRadius = 20;
    
    
    self.regiest = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.regiest];
    [self.regiest setTitle:@"点击进入登录界面" forState:UIControlStateNormal];
    [self.regiest setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
    self.regiest.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self.regiest addTarget:self action:@selector(registNum:) forControlEvents:UIControlEventTouchUpInside];
    self.regiest.sd_layout.leftEqualToView(self.login).rightEqualToView(self.login).bottomSpaceToView(self.view,regiestSpace).heightIs(15);
    
    self.lineBg = [[UILabel alloc]init];
    [self.view addSubview:self.lineBg];
    self.lineBg.sd_layout.leftEqualToView(self.login).rightEqualToView(self.login).topSpaceToView(self.regiest,3).heightIs(1);
    self.lineBg.backgroundColor = HWColor(63, 203, 125);
    
}


//注册
- (void)login:(UIButton *)sender {
    
    XRZLog(@"注册页面注册");
    
    _LogAndRegparameter = [[NSMutableDictionary alloc]init];
    
    [_LogAndRegparameter setObject:@"memtype-2" forKey:@"memtype"];
    [_LogAndRegparameter setObject:AppKey forKey:@"pwdstr"];
    [_LogAndRegparameter setObject:self.numID.text forKey:@"mobile"];
    [_LogAndRegparameter setObject:self.password1.text forKey:@"accpass"];
    //注册
    XRZLog(@"%@",self.password.text);
    if (self.password.text == self.password1.text) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
        [manager POST:@"http://api.xrzmall.com/api2/user_regist.php" parameters:_LogAndRegparameter progress:^(NSProgress * _Nonnull uploadProgress) {
            XRZLog(@"%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            XRZLog(@"<<<<<<<   注册成功 >>>>>>>>>>%@",responseObject);
            
            NSInteger code = [[responseObject valueForKey:@"errcode"] integerValue];
            if (code == 100003) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"账号已存在" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:^{
                    
                }];
                
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            XRZLog(@">>>>>>>>>>>>>%@",error);
            
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        }];
        
        }
}

//注册账号
- (void)registNum:(UIButton *)sender {
    
    XRZLoginIDController *vc = [[XRZLoginIDController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    self.selectView.hidden = YES;
    
}



@end
