//
//  List5Cell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/9.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "List5Cell.h"

@implementation List5Cell

- (void)awakeFromNib {
    [super awakeFromNib];

    _textViewPL.delegate = self;
    _textViewPL.tag = 1000;
    _buttomView.tag = 2000;
}

//通过判断表层TextView的内容来实现底层TextView的显示于隐藏
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(![text isEqualToString:@""])
    {

        _string = _textViewPL.text;
        [_textViewPL setAlpha:1.0];
        [_plLabel setHidden:YES];
    }
    if([text isEqualToString:@""]){
        [_plLabel setHidden:NO];
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }

    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [self.delegate List4celltextView:textView];
    return YES;
}
- (IBAction)submitBtn:(id)sender {
    
   
    UIButton *btn = (UIButton *)sender;
    btn.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
    btn.userInteractionEnabled = NO;
    
    BOOL senderAction = [self.delegate cell5CentDelegate:_string section:_isSection];
    if (senderAction == YES) {
        btn.backgroundColor = [UIColor colorWithRed:155.0/255.0 green:205.0/255.0 blue:105.0/255.0 alpha:1.0];
        btn.userInteractionEnabled = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
