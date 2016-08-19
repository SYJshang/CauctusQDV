//
//  ShowTableViewCell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "ShowTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation ShowTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setData:(NSArray *)data{
    _data = data;
    UIImage *progress = [UIImage imageNamed:@"形状-3"];
    self.doubleLine = [[UIImageView alloc]initWithImage:progress];
    [self.contentView addSubview:self.doubleLine];
    self.doubleLine.sd_layout.centerXEqualToView(self.contentView).centerYEqualToView(self.contentView).heightIs(50).widthIs(ScreenW - 40);
    self.adview = [[FJAdView alloc]initWithTitles:_data];
    
    self.adview.backgroundColor = [UIColor clearColor];
    self.adview.textAlignment = NSTextAlignmentCenter;//默认
    self.adview.isHaveTouchEvent = YES;
    self.adview.labelFont = [UIFont systemFontOfSize:13];
    self.adview.color = [UIColor blackColor];
    self.adview.time = 1.5f;
   [self.adview beginScroll];
    [self.contentView addSubview:self.adview];
    self.adview.sd_layout.centerXEqualToView(self.doubleLine).centerYEqualToView(self.doubleLine).widthIs((2.0 / 3.0) * ScreenW).heightIs(30);
    
}
@end
