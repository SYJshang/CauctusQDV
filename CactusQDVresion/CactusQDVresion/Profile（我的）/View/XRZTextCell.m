//
//  XRZTextCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZTextCell.h"

@implementation XRZTextCell

//设置cell的控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        //电话label
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(170, 10, 160, 25)];
        [self.contentView addSubview:lable];
        self.numLabel = lable;
        
        //描述
        UILabel *desc = [[UILabel alloc]initWithFrame:CGRectMake(45, 10, 100, 20)];
        [self.contentView addSubview:desc];
        self.descLabel = desc;
        
        //图标
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(8, 10, 25, 25)];
        [self.contentView addSubview:image];
        self.icon = image;
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
