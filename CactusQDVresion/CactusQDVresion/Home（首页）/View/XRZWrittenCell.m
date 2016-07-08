//
//  XRZWrittenCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZWrittenCell.h"
#import "UIView+SDAutoLayout.h"


@implementation XRZWrittenCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImage *progress = [UIImage imageNamed:@"95G58PIC4qb_1024"];
        self.icon = [[UIImageView alloc]initWithImage:progress];

        [self.contentView addSubview:self.icon];
        self.icon.sd_layout.leftSpaceToView(self.contentView,10).centerYEqualToView(self.contentView).widthIs((120.0 / 750.0) * ScreenW).heightIs((120.0 / 750.0) * ScreenW);
        self.icon.layer.masksToBounds = YES;
        self.icon.layer.cornerRadius = self.icon.height / 2;
        
        self.name = [[UILabel alloc]init];
        [self.contentView addSubview:self.name];
        self.name.font = [UIFont systemFontOfSize:17];
        self.name.text = @"呆呆先生";
        self.name.textColor = [UIColor blackColor];
        self.name.textAlignment = NSTextAlignmentLeft;
        self.name.sd_layout.leftSpaceToView(self.icon,10).topSpaceToView(self.contentView,15).widthIs((200.0 / 750.0)*ScreenW).heightIs(20);
//
//        
        self.time = [[UILabel alloc]init];
        [self.contentView addSubview:self.time];
        self.time.font = [UIFont boldSystemFontOfSize:13];
        self.time.text = @"13:11";
        self.time.textColor = [UIColor grayColor];
        self.time.textAlignment = NSTextAlignmentRight;
        self.time.sd_layout.rightSpaceToView(self.contentView,10).centerYEqualToView(self.name).widthIs((200.0 / 750.0)*ScreenW).heightIs(20);
//
//        
        self.desc = [[UILabel alloc]init];
        [self.contentView addSubview:self.desc];
        self.desc.font = [UIFont systemFontOfSize:13];
        self.desc.textColor = [UIColor grayColor];
        self.desc.text = @"意向于您交易";
        self.desc.textAlignment = NSTextAlignmentLeft;
        self.desc.sd_layout.leftSpaceToView(self.icon,10).topSpaceToView(self.name,10).widthIs((200.0 / 750.0)*ScreenW).heightIs(20);
        
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn2 setTitle:@"接受" forState:UIControlStateNormal];
        [self.btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self.btn2 setBackgroundColor:HWColor(63, 203, 125)];
        [self.contentView addSubview:self.btn2];
        self.btn2.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn2 addTarget:self action:@selector(accept:) forControlEvents:UIControlEventTouchUpInside];
        self.btn2.sd_layout.rightSpaceToView(self.contentView,10).bottomEqualToView(self.icon).widthIs((130.0 / 750.0) * ScreenW).heightIs(30);
        self.btn2.layer.masksToBounds = YES;
        self.btn2.layer.cornerRadius = 15;
//
//        
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn1 setTitle:@"拒绝" forState:UIControlStateNormal];
        [self.btn1 setBackgroundColor:[UIColor whiteColor]];
        self.btn1.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn1 setTitleColor:HWColor(63, 203, 125) forState:UIControlStateNormal];
        [self.contentView addSubview:self.btn1];
        [self.btn1 addTarget:self action:@selector(refuseBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.btn1.sd_layout.rightSpaceToView(self.btn2,10).centerYEqualToView(self.btn2).widthRatioToView(self.btn2,1).heightRatioToView(self.btn2,1);
        self.btn1.layer.masksToBounds = YES;
        self.btn1.layer.cornerRadius = 15;
        self.btn1.layer.borderColor = HWColor(63, 203, 125).CGColor;
        self.btn1.layer.borderWidth = 1;
        
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

//拒绝事件
- (void)refuseBtn:(UIButton *)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        self.btn1.hidden = YES;
        self.btn2.hidden = YES;
    } completion:^(BOOL finished) {
        UILabel *cutdown = [[UILabel alloc]init];
        cutdown.frame =  self.btn2.frame;
        cutdown.backgroundColor = HWColor(223, 223, 223);
        [cutdown.layer setMasksToBounds:YES];
        [cutdown.layer setCornerRadius:15];
        cutdown.text = @"已拒绝";
        [self addSubview:cutdown];
        cutdown.font = [UIFont systemFontOfSize:15];
        cutdown.textColor = [UIColor whiteColor];
        cutdown.textAlignment = NSTextAlignmentCenter;
    }];
}

//接受事件
- (void)accept:(UIButton *)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        self.btn1.hidden = YES;
        self.btn2.hidden = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = self.btn2.frame;
        [btn setTitle:@"去查看" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = HWColor(63, 203, 125);
        [self addSubview:btn];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:15];
        [btn addTarget:self action:@selector(seeWatch:) forControlEvents:UIControlEventTouchUpInside];

    }];
    
}



- (void)seeWatch:(UIButton *)btn{
    
    [self.delegate skip];
}




@end
