//
//  List3Cell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/6.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "List3Cell.h"

@implementation List3Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _isAction = YES;
}

- (void)setModel:(PriceModel *)model{
    
    _model = model;
    
    if (model.brand == nil) {
        _furnitureLabel.text = model.material;
        _brandsLabel.text = nil;
    }else{
        _furnitureLabel.text = model.material;
        _brandsLabel.text = model.brand;
    }
    
}

- (IBAction)BtnAction:(id)sender {
    
    if (_isAction == YES) {
        [_isImg setImage:[UIImage imageNamed:@"套餐申请_勾选_红"]];
        
        [self.delegate cellCentDelegate:_furnitureLabel.text Bool:_isAction section:_section row:_row];//把当前的文字传值
        _isAction = NO;
    }else if (_isAction == NO){
        [_isImg setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"]];
        [self.delegate cellCentDelegate:_furnitureLabel.text Bool:_isAction section:_section row:_row];
        _isAction = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
