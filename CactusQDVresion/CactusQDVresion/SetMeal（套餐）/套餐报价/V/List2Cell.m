//
//  List2Cell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/6.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "List2Cell.h"
#import "UIView+SDAutoLayout.h"
@implementation List2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.furniture = [[UILabel alloc]init];
    [self.contentView addSubview:self.furniture];
    self.furniture.sd_layout.leftSpaceToView(self.contentView,8).topSpaceToView(self.contentView,0).heightIs(44).widthIs(150);
    self.furniture.font = [UIFont systemFontOfSize:13];
    self.furniture.textColor = [UIColor blackColor];
    
    self.brands = [[UILabel alloc]init];
    [self.contentView addSubview:self.brands];
    self.brands.sd_layout.leftSpaceToView(self.furniture,8).topSpaceToView(self.contentView,0).rightSpaceToView(self.contentView,8).heightIs(44);
     self.brands.textColor = [UIColor grayColor];
    self.brands.textAlignment = NSTextAlignmentRight;
    self.brands.font = [UIFont systemFontOfSize:13];
}
- (void)setModel:(PriceModel *)model{
    _model = model;
    
    if (model.brand == nil) {
        _furniture.text = model.material;
        _brands.text = nil;
        
    }else{
        _furniture.text = model.brand;
        _furniture.textColor = [UIColor blackColor];
        _brands.text = model.material;
       
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
