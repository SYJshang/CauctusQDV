//
//  List4Cell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/9.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TableViewCellDelegate <NSObject>
@optional
-(void)delegateAction:(NSString*)str;//计算的价格
-(void)List4cell:(UITextField *)text;


@end
@interface List4Cell : UITableViewCell<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, weak) id<TableViewCellDelegate>textDelegate;
@property (strong, nonatomic) IBOutlet UITextField *areaText;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
