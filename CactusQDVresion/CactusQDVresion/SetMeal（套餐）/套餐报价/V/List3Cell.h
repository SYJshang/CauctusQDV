//
//  List3Cell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/6.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PriceModel.h"
@protocol CellCentdelagate <NSObject>
-(void)cellCentDelegate:(NSString *)string Bool:(BOOL)isDelete section:(NSInteger)section row:(NSInteger)row; //传值 勾选的

@end

@interface List3Cell : UITableViewCell
@property (nonatomic, weak) id<CellCentdelagate>delegate;
@property (nonatomic, strong) PriceModel *model;
@property (strong, nonatomic) IBOutlet UIImageView *isImg;
@property (strong, nonatomic) IBOutlet UILabel *brandsLabel;
@property (strong, nonatomic) IBOutlet UILabel *furnitureLabel;
@property (nonatomic, assign) BOOL isAction;
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, assign) NSInteger row;
@property (strong, nonatomic) IBOutlet UIButton *button;
@end
