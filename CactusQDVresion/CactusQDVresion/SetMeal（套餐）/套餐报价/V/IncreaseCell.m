//
//  IncreaseCell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/9.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "IncreaseCell.h"
@implementation IncreaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    _areaLabel.hidden = YES;
    _promptLabel.hidden = YES;
    _text.hidden = YES;
    _text.keyboardType = UIKeyboardTypeNumberPad;
    _wanchengBtn.hidden = YES;
     _money.text = @"¥0.00";
    _add = YES;
}

- (void)setModel:(PriceModel1 *)model{
    _model = model;
    self.topLabel.text = model.string;
    _isHidden1 = model.isHidden1;
    _isHidden2 = model.isHidden2;
    _isHidden3 = model.isHidden3;
    _isHidden4 = model.isHidden4;
    if (_isHidden1 == NO) {
        [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    }else{
        [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
    }
    if (_isHidden2 == NO) {
        [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    }else{
        [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
    }
    if (_isHidden3 == NO) {
        [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    }else{
        [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
    }
    if (_isHidden4 == NO) {
        [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    }else{
        [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
    }

    if (![model.string1 isEqual:@""]) {
        self.introduceLabel1.hidden = NO;
        self.btn1.hidden = NO;
        self.introduceLabel1.text = model.string1;
        self.price1 = model.integer1;
    }else{
        self.introduceLabel1.hidden = YES;
        self.btn1.hidden = YES;
    }
    if (![model.string2 isEqual:@""]) {
        self.introduceLabel2.hidden = NO;
        self.btn2.hidden = NO;
        self.introduceLabel2.text = model.string2;
        self.price2 = model.integer2;
    }else{
        self.introduceLabel2.hidden = YES;
        self.btn2.hidden = YES;
    }
    if (![model.string3 isEqual:@""]) {
        self.introduceLabel.hidden = NO;
        self.btn3.hidden = NO;
        self.introduceLabel.text = model.string3;
        self.price = model.integer3;
    }else{
        self.introduceLabel.hidden = YES;
        self.btn3.hidden = YES;
    }
    if (![model.string4 isEqual:@""]) {
        self.introduceLabel3.hidden = NO;
        self.btn4.hidden = NO;
        self.introduceLabel3.text = model.string4;
        self.price3 = model.integer4;
    }else{
        self.introduceLabel3.hidden = YES;
        self.btn4.hidden = YES;
    }
    
    self.introduceLabel1.userInteractionEnabled = YES;
    self.introduceLabel2.userInteractionEnabled = YES;
    self.introduceLabel.userInteractionEnabled = YES;
    self.introduceLabel3.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sender1:)];
    [self.introduceLabel1 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sender2:)];
    [self.introduceLabel2 addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sender3:)];
    [self.introduceLabel addGestureRecognizer:tap3];
    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sender4:)];
    [self.introduceLabel3 addGestureRecognizer:tap4];
    
}
- (void)sender1:(id)sender{
    
    self.isBtn = 1;
    
    if (_isHidden1 == NO) {
        _isHidden1 = YES;
        _isHidden2 = NO;
        _isHidden3 = NO;
        _isHidden4 = NO;
        _moneyInt = _model.integer1;//价钱数
        [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
        [self.delegate increaseCellIsBtnAction:_isHidden1 isBtn:1 row:_row];
    }else{
        [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
        _isHidden1 = NO;
        [self.delegate increaseCellIsBtnAction:_isHidden1 isBtn:1 row:_row];
    }
    [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
}
- (void)sender2:(id)sender{
    
    self.isBtn = 2;
    if (_isHidden2 == NO) {
        _isHidden1 = NO;
        _isHidden2 = YES;
        _isHidden3 = NO;
        _isHidden4 = NO;
        _moneyInt = _model.integer2;
        [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
        [self.delegate increaseCellIsBtnAction:_isHidden2 isBtn:2 row:_row];
    }else{
        [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
        _isHidden2 = NO;
        [self.delegate increaseCellIsBtnAction:_isHidden2 isBtn:1 row:_row];
    }
    [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];

}
- (void)sender3:(id)sender{
    
    self.isBtn = 3;
    if (_isHidden3 == NO) {
        _isHidden1 = NO;
        _isHidden2 = NO;
        _isHidden3 = YES;
        _isHidden4 = NO;
        _moneyInt = _model.integer3;
        [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
        [self.delegate increaseCellIsBtnAction:_isHidden3 isBtn:1 row:_row];
    }else{
        [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
        _isHidden3 = NO;
        [self.delegate increaseCellIsBtnAction:_isHidden3 isBtn:1 row:_row];
    }
    [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    
}
- (void)sender4:(id)sender{
    
    self.isBtn = 4;
    if (_isHidden4 == NO) {
        _isHidden1 = NO;
        _isHidden2 = NO;
        _isHidden3 = NO;
        _isHidden4 = YES;
        _moneyInt = _model.integer4;
        [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_红"] forState:0];
        [self.delegate increaseCellIsBtnAction:_isHidden4 isBtn:1 row:_row];
    }else{
        [self.btn4 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
        _isHidden4 = NO;
        [self.delegate increaseCellIsBtnAction:_isHidden4 isBtn:1 row:_row];
    }
    [self.btn1 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn2 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    [self.btn3 setImage:[UIImage imageNamed:@"套餐申请_勾选_灰"] forState:0];
    
}

- (IBAction)AreaAction:(id)sender{
 
//    if (_add == YES) {
        [self.delegate cellBOOL:_add row:_row];
          _add = NO;
        _addArea.hidden = YES;
        _wanchengBtn.hidden = NO;
        _areaLabel.hidden = NO;
        _promptLabel.hidden = NO;
        
        _text.hidden = NO;
        _btn1.hidden = YES;
        _btn2.hidden = YES;
        _btn3.hidden = YES;
        _btn4.hidden = YES;
        
        _introduceLabel.hidden = YES;
        _introduceLabel1.hidden = YES;
        _introduceLabel2.hidden = YES;
        _introduceLabel3.hidden = YES;
        
        _text.delegate = self;
        if (!_imgView) {
            _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"免费设计_㎡"]];
        }
        _text.rightView = _imgView;
        [_text addTarget:self action:@selector(textAddTarget:) forControlEvents:UIControlEventEditingChanged];
        _text.rightViewMode = UITextFieldViewModeAlways;
        _text.delegate = self;
      

//    }
    
    
}
- (IBAction)wancheng:(id)sender{
//    if (_add == NO) {
         [self.delegate cellBOOL:_add row:_row];
        _add =YES;
        [self.text resignFirstResponder];
        _addArea.hidden = NO;
        _wanchengBtn.hidden = YES;
        _areaLabel.hidden = YES;
        _promptLabel.hidden = YES;
        _text.hidden = YES;
        if (![_model.string1 isEqual:@""]) {
            self.introduceLabel1.hidden = NO;
            self.btn1.hidden = NO;
            
        }else{
            self.introduceLabel1.hidden = YES;
            self.btn1.hidden = YES;
        }
        if (![_model.string2 isEqual:@""]) {
            self.introduceLabel2.hidden = NO;
            self.btn2.hidden = NO;
            
        }else{
            self.introduceLabel2.hidden = YES;
            self.btn2.hidden = YES;
        }
        if (![_model.string3 isEqual:@""]) {
            self.introduceLabel.hidden = NO;
            self.btn3.hidden = NO;
            
        }else{
            self.introduceLabel.hidden = YES;
            self.btn3.hidden = YES;
        }
        if (![_model.string4 isEqual:@""]) {
            self.introduceLabel3.hidden = NO;
            self.btn4.hidden = NO;
            
        }else{
            self.introduceLabel3.hidden = YES;
            self.btn4.hidden = YES;
        }
        

//    }
   }
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.delegate cellshouddidEid:textField];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.text resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.text resignFirstResponder];
}
//可增加项的钱数的计算
- (void)textAddTarget:(UITextField *)textField{
 
    _money.text = @"¥0.00";
    NSScanner *scan = [NSScanner scannerWithString:textField.text];
    int val;
    if ([scan scanInt:&val] && [scan isAtEnd]) {

         if (_moneyInt > 0) {
            if (_isBtn == 1) {
             
                _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*_moneyInt];
                
                [self.delegate cellPriceDelegate:[textField.text integerValue]*_moneyInt];
                 }else if (_isBtn == 2){
                
                _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*_moneyInt];
                   
                [self.delegate cellPriceDelegate:[textField.text integerValue]*_moneyInt];
                
            }else if (_isBtn == 3){
                
                _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*_moneyInt];
                
                [self.delegate cellPriceDelegate:[textField.text integerValue]*_moneyInt];
    
            }else if (_isBtn == 4){
                
                _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*_moneyInt];
                
                [self.delegate cellPriceDelegate:[textField.text integerValue]*_moneyInt];
            }
        }else{
            if (_isBtn == 1) {
                if (self.price2 > 0) {
                    _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*self.price1];
                    [self.delegate cellPriceDelegate:0];
                    [self.delegate cellPriceDelegate:[textField.text integerValue]*self.price2];
                }else{
                    _mj = textField.text;
                }
            }else if (_isBtn == 2){
                if (self.price2 > 0) {
                    _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*self.price2];
                    [self.delegate cellPriceDelegate:0];
                    [self.delegate cellPriceDelegate:[textField.text integerValue]*self.price2];
                }else{
                    _mj = textField.text;
                }
            }else if (_isBtn == 3){
                if (self.price > 0) {
                    _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*self.price];
                    [self.delegate cellPriceDelegate:0];
                    [self.delegate cellPriceDelegate:[textField.text integerValue]*self.price];
                }else{
                    _mj = textField.text;
                }
                
            }else if (_isBtn == 4){
                if (self.price3 > 0) {
                    _money.text = [NSString stringWithFormat:@"¥%ld.00",[textField.text integerValue]*self.price3];
                    [self.delegate cellPriceDelegate:0];
                    [self.delegate cellPriceDelegate:[textField.text integerValue]*self.price3];
                }else{
                    _mj = textField.text;
                }
                
            }
        }
    }else{
        if (textField.text.length > 0) {
            [self.delegate cellTextDelegate];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
