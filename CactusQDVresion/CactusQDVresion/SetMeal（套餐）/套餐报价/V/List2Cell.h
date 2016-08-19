//
//  List2Cell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/6.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PriceModel.h"

@interface List2Cell : UITableViewCell

@property (nonatomic, strong) PriceModel *model;
@property (nonatomic,strong)UILabel *furniture;
@property (nonatomic,strong)UILabel *brands;

@end
