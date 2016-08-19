//
//  FCell8.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "FCell8.h"
#import "UIView+SDAutoLayout.h"

@implementation FCell8

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"套餐产品问答";
    label.font = [UIFont systemFontOfSize:15];
//    [label setTextColor:HWColor(200, 200, 200)];
    [label setTextColor:[UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0]];
    [self.contentView addSubview:label];
    label.sd_layout.centerXEqualToView(self.contentView).centerYEqualToView(self.contentView).widthIs(90).heightIs(20);
    
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1.0];
    [self.contentView addSubview:leftView];
    leftView.sd_layout.leftSpaceToView(self.contentView,0).rightSpaceToView(label,5).centerYEqualToView(label).heightIs(1);
    
    
    
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1.0];
    [self.contentView addSubview:rightView];
    rightView.sd_layout.leftSpaceToView(label,5).rightSpaceToView(self.contentView,0).centerYEqualToView(label).heightIs(1);


}

@end
