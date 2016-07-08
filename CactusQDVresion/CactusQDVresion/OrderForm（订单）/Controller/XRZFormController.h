//
//  XRZFormController.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZFormController : UIViewController

//左边图片
@property (strong, nonatomic) UIImageView *icon1;
//右边图片
@property (strong, nonatomic) UIImageView *icon2;
//双箭头
@property (strong, nonatomic) UIImageView *jiantou;
//交易双方
@property (strong, nonatomic) UILabel *dealLab;
//交易甲方
@property (strong, nonatomic)  UILabel *dealLeftLab;
//left职位
@property (strong, nonatomic)  UILabel *daalPositionLab;
//交易乙方
@property (strong, nonatomic)  UILabel *dealRightLab;
//right职位
@property (strong, nonatomic)  UILabel *dealPositionRightLab;
//左边职位图标
@property (strong, nonatomic)  UIImageView *leftIcon;
//右边职位图标
@property (strong, nonatomic)  UIImageView *rightIcon;
//详细信息描述
@property (strong, nonatomic)  UILabel *adressLab;
//横线
@property (strong, nonatomic)  UIView *line;
//时间
@property (strong, nonatomic)  UILabel *timeLab;
//状态
@property (strong, nonatomic)  UILabel *finsihLab;
//按钮背景
@property (strong, nonatomic)  UIView *btnBG;
//标题
@property (strong, nonatomic)  UILabel *titleLab;
//左边线
@property (strong, nonatomic)  UILabel *leftLine;
//右边线
@property (strong, nonatomic)  UILabel *rightLine;
//开工
@property (strong, nonatomic)  UIButton *startWork;
//开工时间
@property (strong, nonatomic)  UILabel *startTime;

//中间的线
@property (strong, nonatomic)  UIView *view1;
//水电
@property (strong, nonatomic)  UIButton *water;
//水电时间
@property (strong, nonatomic)  UILabel *waterTime;


@property (strong, nonatomic)  UIView *view2;
//泥瓦
@property (strong, nonatomic)  UIButton *mason;
//泥瓦时间
@property (strong, nonatomic)  UILabel *masonTime;

@property (strong, nonatomic)  UIView *View3;
//木工
@property (strong, nonatomic)  UIButton *woodWorking;
//木工时间
@property (strong, nonatomic)  UILabel *woodTime;

//油漆
@property (strong, nonatomic)  UIButton *paint;
//油漆时间
@property (strong, nonatomic)  UILabel *paintTime;

@property (strong, nonatomic)  UIView *view4;
//安装
@property (strong, nonatomic)  UIButton *install;
//安装时间
@property (strong, nonatomic)  UILabel *installTime;

@property (strong, nonatomic)  UIView *view5;
//验收
@property (strong, nonatomic)  UIButton *checkAndAccept;
//验收时间
@property (strong, nonatomic)  UILabel *checkTime;

@property (strong, nonatomic)  UIView *view6;
//完工
@property (strong, nonatomic)  UIButton *finsih;
//完工时间
@property (strong, nonatomic)  UILabel *finishTime;




@end
