//
//  IncreaseCell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/9.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PriceModel1.h"



@protocol CellTextDelegate <NSObject>

@optional
- (void)cellTextDelegate;
- (void)cellBOOL:(BOOL)add row:(NSInteger )row;
- (void)cellPriceDelegate:(NSInteger)price;//装修合计代理

- (void)increaseCellIsBtnAction:(BOOL)isBtnAction isBtn:(NSInteger)isBtn row:(NSInteger)row;  //勾选
- (void)cellshouddidEid:(UITextField *)text;
@end

@interface IncreaseCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic, strong) PriceModel1 *model;

@property (nonatomic, assign) id<CellTextDelegate> delegate;

@property (nonatomic, assign) BOOL isHidden1;
@property (nonatomic, assign) BOOL isHidden2;
@property (nonatomic, assign) BOOL isHidden3;
@property (nonatomic, assign) BOOL isHidden4;
@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;

//@property (nonatomic, assign) BOOL isBtn;// 判断点击了哪个button,YES是上面的,NO是下面的
@property (nonatomic, assign) NSInteger isBtn;
@property (nonatomic, assign) NSInteger row;

@property (strong, nonatomic) IBOutlet UIButton *addArea;
@property (strong, nonatomic) IBOutlet UIButton *wanchengBtn;

@property (nonatomic, strong) NSString *textFieldText;

- (IBAction)sender1:(id)sender;
- (IBAction)sender2:(id)sender;
- (IBAction)sender3:(id)sender;
- (IBAction)sender4:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *topLabel;


@property (strong, nonatomic) IBOutlet UILabel *introduceLabel1;
@property (nonatomic, assign) NSInteger price1;

@property (strong, nonatomic) IBOutlet UILabel *introduceLabel2;
@property (nonatomic, assign) NSInteger price2;

@property (strong, nonatomic) IBOutlet UILabel *introduceLabel;
@property (nonatomic, assign) NSInteger price;

@property (strong, nonatomic) IBOutlet UILabel *introduceLabel3;
@property (nonatomic, assign) NSInteger price3;

@property (nonatomic, assign) NSInteger moneyInt;
@property (nonatomic, strong) NSString *mj;// 输入的面积

// 默认隐藏
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;
@property (strong, nonatomic) IBOutlet UILabel *promptLabel;
@property (strong, nonatomic) IBOutlet UITextField *text;
@property (nonatomic, strong) UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *money;// 金额
@property (nonatomic, assign) BOOL add;
@end
