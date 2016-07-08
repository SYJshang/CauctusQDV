//
//  XRZLoginController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZLoginIDController.h"
#import "UIView+SDAutoLayout.h"
#import "AFNetworking.h"
#import "XRZRegistController.h"
#import "UIButton+countDown.h"
#import "DataManager.h"
#import "XRZTableController.h"
#import "XRZTabBarController.h"

@interface XRZLoginIDController ()<UITableViewDelegate,UITableViewDataSource>{
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
//选择按钮
@property (strong, nonatomic)  UIButton *choose;
//账号背景
@property (strong, nonatomic)  UIView *idBg;
//账号textFiled
@property (strong, nonatomic)  UITextField *numID;
//发送验证码btn
@property (strong, nonatomic)  UIButton *sendNum;
//密码背景
@property (strong, nonatomic)  UIView *passwodBg;
//密码textfiled
@property (strong, nonatomic)  UITextField *password;
//找回密码btn
@property (strong, nonatomic)  UIButton *findPW;
//登录按钮
@property (strong, nonatomic)  UIButton *login;
//注册按钮
@property (strong, nonatomic)  UIButton *regiest;
//背景线
@property (strong, nonatomic)  UILabel *lineBg;

//职位的数组
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) UIView *selectView;

@property (nonatomic, strong) UITableView *tableView;

//@property (nonatomic, assign) BOOL hidden;

@end

@implementation XRZLoginIDController





- (NSArray *)array
{
    if (_array == nil) {
        _array = [[NSArray alloc]init];
    }
    return _array;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"登录";
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //布局
    [self layout];
}


//布局
- (void)layout{
    
    float iconTop = 0.1 * ScreenH;
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
    self.position.text = @"设计师";
    self.position.sd_layout.leftSpaceToView(self.positionBg,10).topSpaceToView(self.positionBg,5).bottomSpaceToView(self.positionBg,5).rightSpaceToView(self.positionBg,30);
    
    self.choose = [UIButton  buttonWithType:UIButtonTypeCustom];
    [self.positionBg addSubview:self.choose];
    [self.choose setImage:[UIImage imageNamed:@"登录_下拉箭头"] forState:UIControlStateNormal];
    [self.choose addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
    self.choose.sd_layout.centerYEqualToView(self.positionBg).rightSpaceToView(self.positionBg,10).widthIs(20).heightIs(20);
    
    
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
    self.numID.placeholder = @"请输入手机号";
    self.numID.borderStyle = UITextBorderStyleNone;
    
    self.sendNum = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.idBg addSubview:self.sendNum];
    [self.sendNum setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.sendNum setBackgroundColor:HWColor(63, 203, 125)];
    self.sendNum.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self.sendNum setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.sendNum addTarget:self action:@selector(sendNUm:) forControlEvents:UIControlEventTouchUpInside];
    self.sendNum.sd_layout.rightSpaceToView(self.idBg,2).topSpaceToView(self.idBg,0).bottomSpaceToView(self.idBg,0).leftSpaceToView(self.numID,2);
    self.sendNum.layer.masksToBounds = YES;
    self.sendNum.layer.cornerRadius = 20;
    
    
    self.passwodBg = [[UIView alloc]init];
    [self.view addSubview:self.passwodBg];
    self.passwodBg.sd_layout.widthRatioToView(self.idBg,1).heightRatioToView(self.idBg,1).centerXEqualToView(self.idBg).topSpaceToView(self.idBg,space);
    self.passwodBg.layer.masksToBounds = YES;
    self.passwodBg.layer.cornerRadius = 20;
    self.passwodBg.layer.borderWidth = 2;
    self.passwodBg.layer.borderColor = HWColor(63, 203, 125).CGColor;
    
    
    self.password = [[UITextField alloc]init];
    self.password.placeholder = @"请输入验证码";
    [self.passwodBg addSubview:self.password];
    self.password.sd_layout.leftSpaceToView(self.passwodBg,10).rightSpaceToView(self.passwodBg,5).topSpaceToView(self.passwodBg,5).bottomSpaceToView(self.passwodBg,5);
    self.password.borderStyle = UITextBorderStyleNone;
    
    
    self.findPW = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.findPW];
    [self.findPW addTarget:self action:@selector(findPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.findPW setTitle:@"查找密码" forState:UIControlStateNormal];
    //    self.findPW.backgroundColor = [UIColor grayColor];
    [self.findPW setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.findPW.sd_layout.rightEqualToView(self.passwodBg).topSpaceToView(self.passwodBg,5).widthIs(100).heightIs(20);
    
    
    self.login = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.login];
    [self.login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.login setBackgroundColor:HWColor(63,203,125)];
    [self.login setTitle:@"登录/注册" forState:UIControlStateNormal];
    self.login.sd_layout.topSpaceToView(self.passwodBg,login).leftEqualToView(self.passwodBg).rightEqualToView(self.passwodBg).heightRatioToView(self.passwodBg,1);
    self.login.layer.masksToBounds = YES;
    self.login.layer.cornerRadius = 20;
    
    
    self.regiest = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.regiest];
    [self.regiest setTitle:@"装修公司注册" forState:UIControlStateNormal];
    [self.regiest setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
    self.regiest.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self.regiest addTarget:self action:@selector(registNum:) forControlEvents:UIControlEventTouchUpInside];
    self.regiest.sd_layout.leftEqualToView(self.login).rightEqualToView(self.login).bottomSpaceToView(self.view,regiestSpace).heightIs(15);
    
    self.lineBg = [[UILabel alloc]init];
    [self.view addSubview:self.lineBg];
    self.lineBg.sd_layout.leftEqualToView(self.login).rightEqualToView(self.login).topSpaceToView(self.regiest,3).heightIs(1);
    self.lineBg.backgroundColor = HWColor(63, 203, 125);
    
}

//点击选择按钮事件
- (void)choose:(UIButton *)sender {
    
    
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    self.selectView = view;
    view.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
    
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.7;
    
    
    UITableView *tableview = [[UITableView alloc]init];
    [self.view addSubview:tableview];
    tableview.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登录_下拉bg"]];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.sectionHeaderHeight = 10;
    tableview.sd_layout.topSpaceToView(self.positionBg,-10).leftSpaceToView(self.view,40).rightSpaceToView(self.view,40).heightIs(215);
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview setSeparatorColor:HWColor(63, 203, 125)];
    //        tableview.backgroundColor = [UIColor grayColor];
    
    self.tableView = tableview;
    
}


//发送验证码
- (void)sendNUm:(UIButton *)sender {
    
    
    _parameter = [[NSMutableDictionary alloc]init];
    [_parameter setObject:AppKey forKey:@"pwdstr"];
    [_parameter setObject:[NSString stringWithFormat:@"%@",self.numID.text] forKey:@"mobile"];
    XRZLog(@"%@",_parameter);
    
    //获取验证码请求
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    [manager POST:@"http://api.xrzmall.com/api2/get_msgcode.php" parameters:_parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        XRZLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        XRZLog(@">>>>>%@",error);
        
        XRZLog(@">>>>>%@",dict);
        
        NSInteger str = [[dict valueForKey:@"errcode"] integerValue];
        
        XRZLog(@".............%ld",(long)str);
        
        
        //判断手机格式是否正确
        if (str == 100004) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机格式不正确，请输入正确的手机号" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
                [self.sendNum startWithTime:0 title:@"获取验证码" countDownTitle:nil mainColor:[UIColor colorWithRed:63/255.0 green:203/255.0 blue:125/255.0 alpha:1.0f] countColor:[UIColor lightGrayColor]];
                
            }];
        }
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        _msgcodes = [string substringFromIndex:string.length-8];
        NSRange range = NSMakeRange(1, 4);
        _msgcodes = [_msgcodes substringWithRange:range];
        // 判断字符串中是否全是数字
        if ([self isPureInt:_msgcodes]) {
            XRZLog(@"正确验证码%@",_msgcodes);
            //倒计时
            [self.sendNum startWithTime:60 title:@"获取验证码" countDownTitle:@"s重新发送" mainColor:[UIColor colorWithRed:63/255.0 green:203/255.0 blue:125/255.0 alpha:1.0f] countColor:[UIColor lightGrayColor]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XRZLog(@">>>>>>>>>>>>>%@",error);
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"获取验证码失败" message:@"请重新获取" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }];
    
}

// 判断输入的字符串中是否全是数字
- (BOOL)isPureInt:(NSString*)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] &&[scan isAtEnd];
}


//查找密码
- (void)findPassword:(UIButton *)sender {
    
    XRZLog(@".......");
}
//登录事件
- (void)login:(UIButton *)sender {
    
    XRZLog(@"注册页面注册");
    
    _LogAndRegparameter = [[NSMutableDictionary alloc]init];
    [_LogAndRegparameter setObject:AppKey forKey:@"pwdstr"];
    [_LogAndRegparameter setObject:self.numID.text forKey:@"mobile"];
    if ([self.position.text isEqualToString:@"设计师"]) {
        [_LogAndRegparameter setObject:@"memtype-3" forKey:@"memtype"];
    }else if ([self.position.text isEqualToString:@"项目经理"]){
        [_LogAndRegparameter setObject:@"memtype-4" forKey:@"memtype"];
        
    }else if ([self.position.text isEqualToString:@"工人"]){
        [_LogAndRegparameter setObject:@"memtype-5" forKey:@"memtype"];
    }
    
    //注册
    XRZLog(@"%@",self.password.text);
    if (self.password.text == _msgcodes) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
        [manager POST:@"http://api.xrzmall.com/api2/user_regist.php" parameters:_LogAndRegparameter progress:^(NSProgress * _Nonnull uploadProgress) {
            XRZLog(@"%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            XRZLog(@"<<<<<<<   注册成功 >>>>>>>>>>%@",responseObject);
            
            NSInteger code = [[responseObject valueForKey:@"errcode"] integerValue];
            if (code == 100003) {
                //                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"手机号码已存在" preferredStyle:UIAlertControllerStyleAlert];
                //                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //
                //                }];
                //                [alert addAction:action];
                //                [self presentViewController:alert animated:YES completion:^{
                //
                //                }];
                
            }
            
            
            //登录成功
            AFHTTPSessionManager *man = [AFHTTPSessionManager manager];
            
            _dict = [[NSMutableDictionary alloc]init];
            
            [_dict setObject:AppKey forKey:@"pwdstr"];
            [_dict setObject:self.numID.text forKey:@"mobile"];
            if ([self.position.text isEqualToString:@"设计师"]) {
                [_LogAndRegparameter setObject:@"memtype-3" forKey:@"memtype"];
            }else if ([self.position.text isEqualToString:@"项目经理"]){
                [_LogAndRegparameter setObject:@"memtype-4" forKey:@"memtype"];
                
            }else if ([self.position.text isEqualToString:@"工人"]){
                [_LogAndRegparameter setObject:@"memtype-5" forKey:@"memtype"];
            }else if ([self.position.text isEqualToString:@"装修公司"]){
                [_LogAndRegparameter setObject:@"memtype-2" forKey:@"memtype"];
                [_LogAndRegparameter setObject:[NSString stringWithFormat:@"%@",self.numID.text] forKey:@"mobile"];
                [_LogAndRegparameter setObject:[NSString stringWithFormat:@"%@",self.password.text] forKey:@"accpass"];
            }
            man.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
            [man POST:@"http://api.xrzmall.com/api2/user_login.php" parameters:_dict progress:^(NSProgress * _Nonnull uploadProgress) {
                XRZLog(@"%@",uploadProgress);
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                XRZLog(@"<<<<<<<<  登录成功  >>>>>>>>>>>%@",responseObject);
                
                NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[responseObject objectForKey:@"datas"]];
                XRZLog(@">>>>>%@",dict);
                
                NSInteger code = [responseObject[@"errcode"] integerValue];
                if (code == 100000) {
                    NSString *mid = [dict[@"mid"] stringValue];
                    NSString *accuser = dict[@"accuser"];
                    
                    XRZLog(@"%@....%@",mid,accuser);
                    
                    [[DataManager shareManager] saveUsername:accuser andPassword:mid];
                    
                    XRZTabBarController *vc = [[XRZTabBarController alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                    
                }
                
                XRZLog(@"%@",dict);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                XRZLog(@">>>>>>>>>>>>>%@",error);
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"请重新登录" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:^{
                    
                }];
                
            }];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            XRZLog(@">>>>>>>>>>>>>%@",error);
            
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        }];
        
        
    }else{
        
        //装修公司登录
        AFHTTPSessionManager *man = [AFHTTPSessionManager manager];
        
        _dict = [[NSMutableDictionary alloc]init];
        
        [_dict setObject:AppKey forKey:@"pwdstr"];
        [_dict setObject:self.numID.text forKey:@"mobile"];
        if ([self.position.text isEqualToString:@"装修公司"]){
            [_LogAndRegparameter setObject:@"memtype-2" forKey:@"memtype"];
            [_LogAndRegparameter setObject:[NSString stringWithFormat:@"%@",self.numID.text] forKey:@"mobile"];
            [_LogAndRegparameter setObject:[NSString stringWithFormat:@"%@",self.password.text] forKey:@"accpass"];
        }
        man.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
        [man POST:@"http://api.xrzmall.com/api2/user_login.php" parameters:_dict progress:^(NSProgress * _Nonnull uploadProgress) {
            XRZLog(@"%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            XRZLog(@"<<<<<<<<  登录成功  >>>>>>>>>>>%@",responseObject);
            
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[responseObject objectForKey:@"datas"]];
            
            XRZLog(@"%@",dict);
            NSInteger code = [responseObject[@"errcode"] integerValue];
            
            if (code == 100004) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"用户未注册~请先注册账号" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:action];
                [self presentViewController:alert animated:YES completion:^{
                    
                }];
                
            }
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            XRZLog(@">>>>>>>>>>>>>%@",error);
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"请重新登录" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
            
        }];
    }
    
    if ([self.numID.text isEqual:@""] || [self.password.text isEqual:@""]){
        
        if ([self.position.text isEqualToString:@"装修公司"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入用户名或密码" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        }
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入手机号或验证码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
    }
    
    if (_msgcodes != self.password.text && ![self.position.text isEqualToString: @"装修公司"]) {
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证码错误" message:@"请输入正确的验证码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}

//注册账号
- (void)registNum:(UIButton *)sender {
    
    XRZRegistController *vc = [[XRZRegistController alloc]init];
    self.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    self.selectView.hidden = YES;
    self.tableView.hidden = YES;
    
}


#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MTCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    self.array = @[@"装修公司",@"项目经理",@"设计师",@"工人"];
    cell.textLabel.text = self.array[indexPath.row];
    
    //    cell.backgroundColor = HWColor(230, 230, 230);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    
    
    if (indexPath.row == 0) {
        self.position.text = @"装修公司";
        self.sendNum.hidden = YES;
        self.numID.placeholder = @"请输入用户名";
        self.password.placeholder = @"请输入密码";
        [self.login setTitle:@"登录" forState:UIControlStateNormal];
    }else if (indexPath.row == 1){
        self.position.text = @"项目经理";
        self.sendNum.hidden = NO;
        self.numID.placeholder = @"请输入手机号";
        self.password.placeholder = @"请输入验证码";
        [self.login setTitle:@"登录/注册" forState:UIControlStateNormal];
        
    }else if (indexPath.row == 2){
        self.position.text = @"设计师";
        self.sendNum.hidden = NO;
        self.numID.placeholder = @"请输入手机号";
        self.password.placeholder = @"请输入验证码";
        [self.login setTitle:@"登录/注册" forState:UIControlStateNormal];
    }else if (indexPath.row == 3){
        self.position.text = @"工人";
        self.sendNum.hidden = NO;
        self.numID.placeholder = @"请输入手机号";
        self.password.placeholder = @"请输入验证码";
        [self.login setTitle:@"登录/注册" forState:UIControlStateNormal];
    }
    
    self.selectView.hidden = YES;
    self.tableView.hidden = YES;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, ScreenW, 14);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 14;
}


@end
