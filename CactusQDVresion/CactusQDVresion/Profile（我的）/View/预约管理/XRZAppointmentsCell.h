//
//  XRZAppointmentsCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZAppointmentsCell : UITableViewCell

//头像
@property (weak, nonatomic) IBOutlet UIImageView *icon;

//昵称
@property (weak, nonatomic) IBOutlet UILabel *name;

//时间
@property (weak, nonatomic) IBOutlet UILabel *time;
//拒绝
@property (weak, nonatomic) IBOutlet UIButton *refuse;
//接受
@property (weak, nonatomic) IBOutlet UIButton *accept;

@end
