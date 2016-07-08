//
//  XRZStarvCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZStarvCell.h"
#import "UIView+SDAutoLayout.h"

@implementation XRZStarvCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.iocn = [[UIImageView alloc]init];
        [self.iocn setBackgroundColor:HWColor(63, 203, 125)];
        [self.contentView addSubview:self.iocn];
        self.iocn.sd_layout.leftSpaceToView(self.contentView,10).centerYEqualToView(self.contentView).widthIs((120.0 / 750.0) * ScreenW).heightIs((120.0 / 750.0) * ScreenW);
        self.iocn.layer.masksToBounds = YES;
        self.iocn.layer.cornerRadius = self.iocn.height / 2;
        
        
        self.SystemNotifition = [[UIImageView alloc]init];
        [self.SystemNotifition setBackgroundColor:HWColor(63, 203, 125)];
        [self.iocn addSubview:self.SystemNotifition];
        self.SystemNotifition.sd_layout.leftSpaceToView(self.iocn,10).rightSpaceToView(self.iocn,10).topSpaceToView(self.iocn,10).bottomSpaceToView(self.iocn,10);
        self.SystemNotifition.layer.masksToBounds = YES;
        self.SystemNotifition.layer.cornerRadius = self.SystemNotifition.height / 2;
        
        self.name = [[UILabel alloc]init];
        [self.contentView addSubview:self.name];
        self.name.textColor = [UIColor grayColor];
        self.name.font = [UIFont systemFontOfSize:17];
        self.name.textAlignment = NSTextAlignmentLeft;
        self.name.text = @"系统消息";
        self.name.sd_layout.leftSpaceToView(self.iocn,10).topSpaceToView(self.contentView,15).widthIs((200.0 / 750.0) * ScreenW).heightIs(20);
        
        self.time = [[UILabel alloc]init];
        [self.contentView addSubview:self.time];
        self.time.text = @"13:11";
        self.time.textColor = [UIColor grayColor];
        self.time.font = [UIFont systemFontOfSize:13];
        self.time.textAlignment = NSTextAlignmentRight;
        self.time.sd_layout.rightSpaceToView(self.contentView,10).centerYEqualToView(self.name).widthIs((200.0 / 750.0) * ScreenW).heightIs(20);
        
        
        self.desc = [[UILabel alloc]init];
        [self.contentView addSubview:self.desc];
        self.desc.textColor = [UIColor grayColor];
        self.desc.font = [UIFont systemFontOfSize:13];
        self.desc.text = @"更新了版本信息，修复了";
        self.desc.textAlignment = NSTextAlignmentLeft;
        self.desc.sd_layout.leftSpaceToView(self.iocn,10).topSpaceToView(self.name,10).widthIs((300.0 / 750.0) * ScreenW).heightIs(20);
        
        
        
        self.num = [[UILabel alloc]init];
        [self.contentView addSubview:self.num];
        self.num.textColor = [UIColor whiteColor];
        self.num.backgroundColor = HWColor(251, 107, 112);
        self.num.font = [UIFont systemFontOfSize:13];
        self.num.textAlignment = NSTextAlignmentCenter;
        self.num.sd_layout.rightSpaceToView(self.contentView,10).bottomEqualToView(self.iocn).widthIs(20).heightIs(20);
        self.num.text = @"1";
        self.num.layer.masksToBounds = YES;
        self.num.layer.cornerRadius = self.num.height / 2;
        
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
