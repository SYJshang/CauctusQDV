//
//  XRZInfomationCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZInfomationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *editBtn;
@property (weak, nonatomic) IBOutlet UILabel *style;
@property (weak, nonatomic) IBOutlet UILabel *houseType;
@property (weak, nonatomic) IBOutlet UILabel *adress;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end
