//
//  XRZPlateformCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZPlateformCell : UITableViewCell
//大图标
@property (strong, nonatomic) UIImageView *bigView;
//小图标
@property (strong, nonatomic)  UIImageView *smallImage;
//name
@property (strong, nonatomic)  UILabel *name;
//职位
@property (strong, nonatomic)  UILabel *position;
//地址
@property (strong, nonatomic)  UILabel *adress;
//面积（几间）
@property (strong, nonatomic)  UILabel *area;
//更新时间
@property (strong, nonatomic)  UIView *line;
//线
@property (strong, nonatomic)  UILabel *time;
//状态
@property (strong, nonatomic)  UILabel *state;
@end
