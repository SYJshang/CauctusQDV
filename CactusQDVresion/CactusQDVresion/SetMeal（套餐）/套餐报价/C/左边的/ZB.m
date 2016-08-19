//
//  ZB.m
//  XB
//
//  Created by zhuxunyi on 16/7/12.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "ZB.h"
#import "Masonry.h"

@implementation ZB
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIView alloc]init];
        
        [self addSubview:_imgView];
        _label = [[UILabel alloc]init];
        
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.mas_top).offset(4);
            make.left.equalTo(self.mas_left).offset(0);
            make.bottom.equalTo(self.mas_bottom).offset(-4);
            make.width.offset(3);
            
        }];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(_imgView.mas_bottom).offset(10);
            make.width.offset(70);
            make.height.offset(20);
        }];
        
    }
    return self;
}



@end
