//
//  XRZFinishCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZFinishCell : UITableViewCell
//标题
@property (strong, nonatomic)  UILabel *title;
//状态
@property (strong, nonatomic)  UILabel *stsatBtn;
//图片
@property (strong, nonatomic)  UIImageView *icon;
//房子面积
@property (strong, nonatomic)  UIImageView *houseIcon;
//价格图片
@property (strong, nonatomic)  UIImageView *priceIcon;
//房子面积
@property (strong, nonatomic)  UILabel *houseLab;
//价格
@property (strong, nonatomic)  UILabel *priceLab;
//房子描述
@property (strong, nonatomic)  UILabel *descLab;
//横线
@property (strong, nonatomic)  UIView *line;
//时间
@property (strong, nonatomic)  UILabel *timeLab;
//完工时间
@property (strong, nonatomic)  UILabel *finishLab;

@end
