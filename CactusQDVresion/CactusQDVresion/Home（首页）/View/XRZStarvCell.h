//
//  XRZStarvCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZStarvCell : UITableViewCell
@property (strong, nonatomic)  UIImageView *iocn;
@property (strong, nonatomic)  UILabel *name;
@property (strong, nonatomic)  UILabel *desc;
@property (strong, nonatomic)  UILabel *time;
@property (strong, nonatomic)  UILabel *num;
//系统通知
@property (strong, nonatomic)  UIImageView *SystemNotifition;

@end
