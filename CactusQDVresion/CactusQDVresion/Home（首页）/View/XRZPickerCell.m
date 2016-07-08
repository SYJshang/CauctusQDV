//
//  XRZPickerCell.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZPickerCell.h"

@implementation XRZPickerCell

//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        for (int i; i < 3; i ++) {
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            btn.frame = CGRectMake(i * (frame.size.width / 3),20, frame.size.width / 3, frame.size.height - 20);
//            btn.tag = i + 1;
//            btn.backgroundColor = [UIColor redColor];
//            [self.contentView addSubview:btn];
//        }
//    }
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    self.mutableArray = [[NSMutableArray alloc]init];

    for (int i = 0; i < 3; i++) {
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(i * (ScreenW / 3), 40, ScreenW / 3, self.contentView.size.height - 40);
        [btn1 setTitle:@"array[i]" forState:UIControlStateNormal];
        btn1.titleLabel.font = [UIFont systemFontOfSize:15.0];
        btn1.tag = i + 1;
//        btn.backgroundColor = HWColor(247, 247, 247);
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:btn1];
        
        
        [self.mutableArray addObject:btn1];
        
//        self.btn = btn1;

        
         UIView *line = [[UIView alloc]initWithFrame:CGRectMake(i * (ScreenW / 3), 50, 1, self.contentView.size.height - 60)];
        line.backgroundColor = HWColor(239, 239, 239);
        [self.contentView addSubview:line];
    }
    

    
}



@end
