//
//  XRZCaseMangerCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZCaseMangerCell : UITableViewCell

//大图片
@property (weak, nonatomic) IBOutlet UIImageView *icon;
//收藏数
@property (weak, nonatomic) IBOutlet UILabel *likeNum;
//地址
@property (weak, nonatomic) IBOutlet UILabel *adress;
//地图定位
@property (weak, nonatomic) IBOutlet UILabel *location;
//套图编辑
@property (weak, nonatomic) IBOutlet UIButton *edit;
//时间
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
