//
//  XRZStateCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZStateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *stateLab;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIButton *upload;
@property (weak, nonatomic) IBOutlet UIButton *remind;

@end
