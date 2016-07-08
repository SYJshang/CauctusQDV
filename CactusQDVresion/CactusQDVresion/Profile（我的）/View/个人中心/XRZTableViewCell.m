//
//  XRZTableViewCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZTableViewCell.h"

@implementation XRZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.headerPhoto.layer.masksToBounds = YES;
        self.headerPhoto.layer.cornerRadius = 50;
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
