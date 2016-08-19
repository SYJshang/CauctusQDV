//
//  CaseFourBtnCollectionCell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "CaseFourBtnCollectionCell.h"

#define Height  CGRectGetHeight([UIScreen mainScreen].bounds)
#define Width   CGRectGetWidth([UIScreen mainScreen].bounds)
@implementation CaseFourBtnCollectionCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imgArray = [NSMutableArray arrayWithObjects:@"主页_套餐说明",@"主页_套餐流程",@"主页_套餐报价",@"主页_套餐申请", nil];
        _labelArray = [NSMutableArray arrayWithObjects:@"套餐说明",@"套餐流程",@"套餐报价",@"套餐申请", nil];
        for (int i = 0; i<4; i++) {
            _button = [[MyButton alloc]initWithFrame:CGRectMake(Width/4*i, 0, Width/4,80)];
            _button.imgView.frame = CGRectMake(0, 0, _button.frame.size.width, _button.frame.size.height);
            _button.imgView.image = [UIImage imageNamed:_imgArray[i]];
            _button.label.text = _labelArray[i];
            
            _button.tag = i+50;
            //            [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:_button];
        }

    }
    return self;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    }

@end
