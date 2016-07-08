//
//  XRZTableViewCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headerPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *testPhoto;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *position;

@end
