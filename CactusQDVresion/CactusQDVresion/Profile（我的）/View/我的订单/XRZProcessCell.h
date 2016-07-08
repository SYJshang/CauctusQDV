//
//  XRZProcessCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZProcessCell : UITableViewCell

//标题
@property (strong, nonatomic)  UILabel *name;
//状态
@property (strong, nonatomic)  UILabel *finfishBtn;
//图片
@property (strong, nonatomic)  UIImageView *icon;
//地图图片
@property (strong, nonatomic)  UIImageView *adressIcon;
//地址
@property (strong, nonatomic)  UILabel *adressLab;
//timeLab
@property (strong, nonatomic)  UILabel *timeLab;

//描述信息
@property (strong, nonatomic)  UILabel *descLab;



@end
