//
//  XRZFinishCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZFinishCell.h"
#import "UIView+SDAutoLayout.h"

@implementation XRZFinishCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImage *progress = [UIImage imageNamed:@"首页_案例图片"];
        UIImageView *pro = [[UIImageView alloc]initWithImage:progress];
        [self.contentView addSubview:pro];
        self.icon = pro;
        self.icon.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,20).widthIs((160.0 / 750.0) * ScreenW).heightIs((160.0 / 750.0) * ScreenW);
        
        self.title = [[UILabel alloc]init];
        [self.contentView addSubview:self.title];
        self.title.font = [UIFont boldSystemFontOfSize:15];
        self.title.text = @"盛世天城一期";
        self.title.textColor = [UIColor blackColor];
        self.title.textAlignment = NSTextAlignmentLeft;
        self.title.sd_layout.leftSpaceToView(self.icon,10).topSpaceToView(self.contentView,20).widthIs((220.0 / 750.0) * ScreenW).heightIs(20);

        self.descLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.descLab];
        self.descLab.font = [UIFont systemFontOfSize:15];
        XRZLog(@"%@",[UIFont systemFontOfSize:15]);
        self.descLab.textColor = [UIColor blackColor];
        self.descLab.text = @"精美美式装修";
        self.descLab.textAlignment = NSTextAlignmentRight;
        self.descLab.sd_layout.rightSpaceToView(self.contentView,10).topEqualToView(self.title).widthIs((220.0 / 750.0) * ScreenW).heightIs(20);
//
//        
        UIImage *house = [UIImage imageNamed:@"面积"];
        self.houseIcon = [[UIImageView alloc]initWithImage:house];
        [self.contentView addSubview:self.houseIcon];
        self.houseIcon.sd_layout.leftSpaceToView(self.icon,10).topSpaceToView(self.title,10).widthIs(20).heightIs(15);
////
        UIImage *price = [UIImage imageNamed:@"价格"];
        self.priceIcon = [[UIImageView alloc]initWithImage:price];
        [self.contentView addSubview:self.priceIcon];
        self.priceIcon.sd_layout.leftSpaceToView(self.icon,10).topSpaceToView(self.houseIcon,10).widthIs(20).heightIs(15);

        self.houseLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.houseLab];
        self.houseLab.font = [UIFont systemFontOfSize:13];
        self.houseLab.textColor = [UIColor grayColor];
        self.houseLab.text = @"面积:160㎡";
        self.houseLab.textAlignment = NSTextAlignmentCenter;
        self.houseLab.sd_layout.leftSpaceToView(self.houseIcon,5).centerYEqualToView(self.houseIcon).widthIs((160.0 / 750.0) * ScreenW).heightIs(20);

        self.priceLab = [[UILabel alloc]init];
        [self.contentView  addSubview:self.priceLab];
        self.priceLab.font = [UIFont systemFontOfSize:13];
        self.priceLab.textColor = [UIColor grayColor];
        self.priceLab.text = @"价格:200万";
        self.priceLab.textAlignment = NSTextAlignmentCenter;
        self.priceLab.sd_layout.leftSpaceToView(self.priceIcon,5).centerYEqualToView(self.priceIcon).widthIs((160.0 / 750.0) * ScreenW).heightIs(20);


//
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = HWColor(240, 240, 240);
        [self.contentView addSubview:self.line];
        self.line.sd_layout.leftSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,10).topSpaceToView(self.icon,10).heightIs(0.5);
        
        self.stsatBtn = [[UILabel alloc]init];
        [self.contentView addSubview:self.stsatBtn];
        self.stsatBtn.font = [UIFont systemFontOfSize:13];
        self.stsatBtn.textColor = [UIColor whiteColor];
        self.stsatBtn.text = @"已完工";
        self.stsatBtn.textAlignment = NSTextAlignmentCenter;
        self.stsatBtn.backgroundColor = [UIColor grayColor];
        self.stsatBtn.sd_layout.rightSpaceToView(self.contentView,10).bottomSpaceToView(self.line,10).widthIs((110.0 / 750.0) * ScreenW).heightIs(20);
//
        self.timeLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.timeLab];
        self.timeLab.font = [UIFont systemFontOfSize:13];
        self.timeLab.textColor = [UIColor grayColor];
        self.timeLab.text = @"签单:2016-02-07";
        self.timeLab.textAlignment = NSTextAlignmentLeft;
        self.timeLab.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.line,5).widthIs((300.0 / 750.0) * ScreenW).heightIs(20);
        
        self.finishLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.finishLab];
        self.finishLab.font = [UIFont systemFontOfSize:13];
        self.finishLab.text = @"完工:2016-02-07";
        self.finishLab.textColor = [UIColor grayColor];
        self.finishLab.textAlignment = NSTextAlignmentRight;
        self.finishLab.sd_layout.rightSpaceToView(self.contentView,10).topSpaceToView(self.line,5).widthIs((300.0 / 750.0) * ScreenW).heightIs(20);
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
