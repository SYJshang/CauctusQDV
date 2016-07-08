//
//  XRZPlateformCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZPlateformCell.h"
#import "UIView+SDAutoLayout.h"

@implementation XRZPlateformCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImage *progress = [UIImage imageNamed:@"95G58PIC4qb_1024"];
        UIImageView *pro = [[UIImageView alloc]initWithImage:progress];
        [self.contentView addSubview:pro];
        self.bigView = pro;
        self.bigView.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,15).widthIs((140.0 / 750.0) * ScreenW).heightIs((140.0 / 750.0) * ScreenW);
        
        UILabel *cutdown = [[UILabel alloc]init];
        [self.contentView addSubview:cutdown];
        cutdown.font = [UIFont systemFontOfSize:17];
        cutdown.textColor = [UIColor blackColor];
        self.name = cutdown;
        self.name.sd_layout.leftSpaceToView(self.bigView,10).topSpaceToView(self.contentView,(1.0 / 5.0) * 140.0).heightIs(20).widthIs((160.0/750.0)*ScreenW + 30);
        
        UILabel *cutdown1 = [[UILabel alloc]init];
        [self.contentView addSubview:cutdown1];
        cutdown1.font = [UIFont systemFontOfSize:14];
        cutdown1.textColor = [UIColor blackColor];
        self.position = cutdown1;
        self.position.sd_layout.leftSpaceToView(self.bigView,10).topSpaceToView(self.name,5).widthIs(60).heightIs(20);
        
        UIImage *icon = [UIImage imageNamed:@"工人"];
        UIImageView *sm = [[UIImageView alloc]initWithImage:icon];
        [self.contentView addSubview:sm];
        self.smallImage = sm;
        self.smallImage.sd_layout.leftSpaceToView(self.position,0).centerYEqualToView(self.position).widthIs(15).heightIs(15);
        
        UILabel *ad = [[UILabel alloc]init];
        [self.contentView addSubview:ad];
        ad.font = [UIFont systemFontOfSize:14];
        ad.textColor = [UIColor blackColor];
        ad.textAlignment = NSTextAlignmentRight;
        self.adress = ad;
        self.adress.sd_layout.rightSpaceToView(self.contentView,10).bottomEqualToView(self.name).widthIs((250.0 / 750.0)*ScreenW).heightIs(20);
        
        UILabel *a = [[UILabel alloc]init];
        [self.contentView addSubview:a];
        a.font = [UIFont systemFontOfSize:14];
        a.textColor = [UIColor blackColor];
        a.textAlignment = NSTextAlignmentRight;
        self.area = a;
        self.area.sd_layout.rightSpaceToView(self.contentView,10).topSpaceToView(self.adress,10).widthIs((250.0 / 750.0)*ScreenW).heightIs(20);
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.line];
//        self.line = view;
        self.line.sd_layout.leftSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,10).topSpaceToView(self.bigView,20).heightIs(0.7);
        
        UILabel *t = [[UILabel alloc]init];
        [self.contentView addSubview:t];
        t.font = [UIFont systemFontOfSize:14];
        t.textColor = [UIColor grayColor];
        self.time = t;
        self.time.sd_layout.leftEqualToView(self.line).topSpaceToView(self.line,10).widthIs((220.0 / 750.0) *ScreenW + 30).heightIs(25);
        
        UILabel *sta = [[UILabel alloc]init];
        [self.contentView addSubview:sta];
        sta.font = [UIFont systemFontOfSize:14];
        sta.textColor = [UIColor whiteColor];
        sta.backgroundColor = HWColor(63, 203, 125);
        sta.textAlignment = NSTextAlignmentCenter;
        self.state = sta;
        self.state.sd_layout.rightSpaceToView(self.contentView,10).topEqualToView(self.time).widthIs((160.0 / 750.0) * ScreenW).heightRatioToView(self.time,1);
        

        
    }
    return self;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    
      // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure  view for the selected state
}

@end
