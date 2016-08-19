//
//  List4Cell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/9.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "List4Cell.h"

@implementation List4Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"免费设计_㎡"]];
    _areaText.rightView = imgView;
    _areaText.rightViewMode = UITextFieldViewModeAlways;
    _areaText.delegate = self;
    [_areaText addTarget:self action:@selector(textFielAction:) forControlEvents:UIControlEventEditingChanged];
    
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    
//
//    _priceLabel.text = textField.text;
//    
//}
- (void)textFielAction:(UITextField *)textField{
    
    NSString *string = textField.text;
    int areas = [string intValue];
    _priceLabel.text = [NSString stringWithFormat:@"套餐价 ( %d元 )",areas*688];
    [self.textDelegate delegateAction:[NSString stringWithFormat:@"%d",areas*688]];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.textDelegate List4cell:textField];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_areaText resignFirstResponder];
    return YES;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
