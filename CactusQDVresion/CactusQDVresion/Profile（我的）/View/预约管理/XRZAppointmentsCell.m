//
//  XRZAppointmentsCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZAppointmentsCell.h"

@implementation XRZAppointmentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//拒绝
- (IBAction)refuse:(UIButton *)sender {
    self.refuse.hidden = YES;
    self.accept.hidden = YES;
    
    UILabel *cutdown = [[UILabel alloc]init];
    cutdown.frame = self.accept.frame;
    cutdown.backgroundColor = HWColor(223, 223, 223);
    cutdown.text = @"已拒绝";
    [self addSubview:cutdown];
    cutdown.font = [UIFont systemFontOfSize:15];
    cutdown.textColor = [UIColor whiteColor];
    cutdown.textAlignment = NSTextAlignmentCenter;
    cutdown.layer.masksToBounds = YES;
    cutdown.layer.cornerRadius = 15;

}

//接受
- (IBAction)accout:(UIButton *)sender {
    self.refuse.hidden = YES;
    self.accept.hidden = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = self.accept.frame;
    [btn setTitle:@"立即联系" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = HWColor(63, 203, 125);
    [self addSubview:btn];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:15];

}

//xrz87751035

@end
