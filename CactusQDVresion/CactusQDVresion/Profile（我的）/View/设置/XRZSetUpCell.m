//
//  XRZSetUpCell.m
//  CactusQDVresion
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 尚勇杰. All rights reserved.
//

#import "XRZSetUpCell.h"
#import "UIView+SDAutoLayout.h"

@implementation XRZSetUpCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.title = [[UILabel alloc]init];
        self.title.text = @"当前版本";
        self.title.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.title];
        self.title.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,5).bottomSpaceToView(self.contentView,5).widthIs(100);
        
        self.vresion = [[UILabel alloc]init];
        self.vresion.text = @"1.0";
        self.vresion.textAlignment = NSTextAlignmentRight;
        self.vresion.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.vresion];
        self.vresion.sd_layout.rightSpaceToView(self.contentView,10).topSpaceToView(self.contentView,5).bottomSpaceToView(self.contentView,5).widthIs(150);
        
//        UIView *view = [[UIView alloc]init];
//        view.backgroundColor = [UIColor grayColor];
//        [self.contentView addSubview:view];
//        view.sd_layout.leftSpaceToView(self.contentView,0).rightSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0).heightIs(1);
        
        
    }
    return self;
}


- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
