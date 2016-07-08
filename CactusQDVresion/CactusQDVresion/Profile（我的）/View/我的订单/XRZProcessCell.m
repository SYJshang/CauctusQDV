//
//  XRZProcessCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZProcessCell.h"
#import "UIView+SDAutoLayout.h"

@implementation XRZProcessCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImage *progress = [UIImage imageNamed:@"95G58PIC4qb_1024"];
        self.icon = [[UIImageView alloc]initWithImage:progress];
        [self.contentView addSubview:self.icon];
        self.icon.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,20).widthIs((170.0 / 750.0) * ScreenW).heightIs((170.0 / 750.0) * ScreenW);
        self.icon.layer.masksToBounds = YES;
        self.icon.layer.cornerRadius = self.icon.height / 2;
        
        self.name = [[UILabel alloc]init];
        [self.contentView addSubview:self.name];
        self.name.font = [UIFont boldSystemFontOfSize:15];
        self.name.text = @"戴戴先生";
        self.name.textColor = [UIColor blackColor];
        self.name.textAlignment = NSTextAlignmentLeft;
        self.name.sd_layout.leftSpaceToView(self.icon,10).topEqualToView(self.icon).widthIs((180.0 / 750.0) * ScreenW).heightIs(20);
//
        self.descLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.descLab];
        self.descLab.font = [UIFont systemFontOfSize:14];
        self.descLab.text = @"待编辑";
        self.descLab.textColor = HWColor(252, 148, 152);
        self.descLab.textAlignment = NSTextAlignmentRight;
        self.descLab.sd_layout.rightSpaceToView(self.contentView,10).centerYEqualToView(self.name).widthIs((180.0 / 750.0) * ScreenW).heightIs(20);
//
        UIImage *pro= [UIImage imageNamed:@"地图"];
        self.adressIcon = [[UIImageView alloc]initWithImage:pro];
        [self.contentView addSubview:self.adressIcon];
        self.adressIcon.sd_layout.leftSpaceToView(self.icon,10).centerYEqualToView(self.icon).widthIs(17).heightIs(17);
//
        self.adressLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.adressLab];
        self.adressLab.font = [UIFont systemFontOfSize:13];
        self.adressLab.textColor = [UIColor grayColor];
        self.adressLab.text = @"盛世天城一期";
        self.adressLab.textAlignment = NSTextAlignmentLeft;
        self.adressLab.sd_layout.leftSpaceToView(self.adressIcon,5).centerYEqualToView(self.adressIcon).widthIs((300.0 / 750.0) * ScreenW).heightIs(20);
//
        self.timeLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.timeLab];
        self.timeLab.font = [UIFont systemFontOfSize:13];
        self.timeLab.textColor = [UIColor grayColor];
        self.timeLab.text = @"签单日期:2016-04-15";
        self.timeLab.textAlignment = NSTextAlignmentLeft;
        self.timeLab.sd_layout.leftSpaceToView(self.icon,10).bottomEqualToView(self.icon).widthIs((350.0 / 750.0) * ScreenW).heightIs(20);
//
//        
        self.finfishBtn = [[UILabel alloc]init];
        [self.contentView addSubview:self.finfishBtn];
        self.finfishBtn.font = [UIFont systemFontOfSize:13];
        self.finfishBtn.textColor = [UIColor grayColor];
        self.finfishBtn.backgroundColor = [UIColor whiteColor];
        self.finfishBtn.text = @"开工";
        self.finfishBtn.textAlignment = NSTextAlignmentCenter;
        self.finfishBtn.sd_layout.rightSpaceToView(self.contentView,10).centerYEqualToView(self.timeLab).widthIs((120.0 / 750.0) * ScreenW).heightIs(20);
        [self.finfishBtn.layer setMasksToBounds:YES];
        [self.finfishBtn.layer setCornerRadius:10];
        [self.finfishBtn.layer setBorderColor:HWColor(63, 203, 125).CGColor];
        [self.finfishBtn.layer setBorderWidth:1];
        
        
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
