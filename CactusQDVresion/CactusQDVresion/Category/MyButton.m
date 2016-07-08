//
//  MyButton.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/4/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "MyButton.h"
#import "Masonry.h"

@implementation MyButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]init];
        //_imgView.backgroundColor = [UIColor redColor];
        [self addSubview:_imgView];
        
        _label = [[UILabel alloc]init];
        //_label.backgroundColor = [UIColor orangeColor];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];

            [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(self.mas_top).offset(16);
                make.centerX.equalTo(self.mas_centerX);
                make.height.offset(49);
                make.width.offset(49);
                
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
