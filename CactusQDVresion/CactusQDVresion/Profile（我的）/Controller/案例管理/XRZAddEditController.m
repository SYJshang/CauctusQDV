//
//  XRZAddEditController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZAddEditController.h"
#import "XRZAddCasePhoto.h"
#import "XRZTextView.h"
#import "BRPlaceholderTextView.h"
#import "XRZAlertView.h"
#import "UIView+SDAutoLayout.h"


@interface XRZAddEditController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
        
    //图片2进制路径
    NSString* filePath;
}
@property (weak, nonatomic) IBOutlet XRZAddCasePhoto *addPhoto;
@property (weak, nonatomic) IBOutlet BRPlaceholderTextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *descLab;

@property (nonatomic, strong) UIImageView *img;


@end

@implementation XRZAddEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UILabel titleWithColor:[UIColor whiteColor] title:@"添加图片" font:20];

    
    [self.textView setPlaceholderColor:[UIColor redColor]];
    self.textView.backgroundColor = HWColor(247, 247, 247);
//    [self.view bringSubviewToFront:self.textView];
    self.textView.layer.zPosition = 1;
    [self.textView setPlaceholder:@"请输入文字。。。"];
    [self.textView addMaxTextLengthWithMaxLength:0 andEvent:^(BRPlaceholderTextView *text) {
        
        
        [self.view endEditing:YES];
        UIAlertView * alter=[[UIAlertView alloc] initWithTitle:@"提示" message:@"超过指定长度了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alter show];
        
        
    }];
    [self setNavition];
    
    [XRZNotificationCenter addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [XRZNotificationCenter addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
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
    [btn1 setTitle:@"完成" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barButton1;
}

- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)action{
    
    XRZLog(@"...........wancheng");
}

-(void)keyboardShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.textView.transform=CGAffineTransformMakeTranslation(0, -deltaY);
    }];
}
-(void)keyboardHide:(NSNotification *)note
{
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        self.textView.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
//        self.textView.placeholder = @"请输入文字描述信息......";

    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (IBAction)clickBtn:(XRZAddCasePhoto *)sender {
    


    
    XRZAlertView *alertView = [XRZAlertView showInView:self.view withTitle:@"上传照片" message:@"请选择上传方式" confirmButtonTitle:@"相册" cancelButtonTitle:@"拍照"];
    alertView.layer.zPosition = 2;
    
    [alertView handleCancel:^{
        //拍照
        [self takePhoto];
        self.addPhoto.hidden = YES;
        self.descLab.hidden = YES;
        
        UIImageView *iamge = [[UIImageView alloc]init];
        [self.view addSubview:iamge];
        iamge.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).topSpaceToView(self.view,80).bottomSpaceToView(self.view,200);
        self.img = iamge;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"更改图片" forState:UIControlStateNormal];
        [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.sd_layout.centerXEqualToView(iamge).topSpaceToView(iamge,5).widthIs(100).heightIs(20);
        [btn addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];

        
    }    handleConfirm:^{
        //照片
        [self LocalPhoto];
        self.addPhoto.hidden = YES;
        self.descLab.hidden = YES;
        
        UIImageView *iamge = [[UIImageView alloc]init];
        [self.view addSubview:iamge];
        iamge.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).topSpaceToView(self.view,80).bottomSpaceToView(self.view,200);
        self.img = iamge;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"更改图片" forState:UIControlStateNormal];
        [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.sd_layout.centerXEqualToView(iamge).topSpaceToView(iamge,5).widthIs(100).heightIs(20);
        [btn addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    alertView.TLAnimationType = (arc4random_uniform(10) % 2 == 0) ? TLAnimationType3D : tLAnimationTypeHinge;
    [alertView show];
}

- (void)changePhoto:(UIButton *)btn{
    
    XRZAlertView *alertView = [XRZAlertView showInView:self.view withTitle:@"上传照片" message:@"请选择上传方式" confirmButtonTitle:@"相册" cancelButtonTitle:@"拍照"];
    alertView.layer.zPosition = 2;
    
    [alertView handleCancel:^{
        //拍照
        [self takePhoto];
        self.addPhoto.hidden = YES;
        self.descLab.hidden = YES;
        
        UIImageView *iamge = [[UIImageView alloc]init];
        [self.view addSubview:iamge];
        iamge.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).topSpaceToView(self.view,80).bottomSpaceToView(self.view,200);
        self.img = iamge;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"更改图片" forState:UIControlStateNormal];
        [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.sd_layout.centerXEqualToView(iamge).topSpaceToView(iamge,5).widthIs(100).heightIs(20);
        [btn addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }    handleConfirm:^{
        //照片
        [self LocalPhoto];
        self.addPhoto.hidden = YES;
        self.descLab.hidden = YES;
        
        UIImageView *iamge = [[UIImageView alloc]init];
        [self.view addSubview:iamge];
        iamge.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).topSpaceToView(self.view,80).bottomSpaceToView(self.view,200);
        self.img = iamge;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"更改图片" forState:UIControlStateNormal];
        [btn setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        btn.sd_layout.centerXEqualToView(iamge).topSpaceToView(iamge,5).widthIs(100).heightIs(20);
        [btn addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    alertView.TLAnimationType = (arc4random_uniform(10) % 2 == 0) ? TLAnimationType3D : tLAnimationTypeHinge;
    [alertView show];
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.descLab.hidden = YES;
    self.addPhoto.hidden = YES;
}


- (void)textViewDidEndEditing:(UITextView *)textView{
    self.descLab.hidden = NO;
    self.addPhoto.hidden = NO;

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
    }else
    {
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
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
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
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        self.img.image = image;
//        
//        if (frontBtn.selected) {
//            
//            [frontBtn setBackgroundImage:image forState:UIControlStateNormal];
//        }if (resevstBtn.selected) {
//            [resevstBtn setBackgroundImage:image forState:UIControlStateNormal];
//            
//        }if (papersBtn.selected) {
//            [papersBtn setBackgroundImage:image forState:UIControlStateNormal];
//            
//        }
        
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





@end
