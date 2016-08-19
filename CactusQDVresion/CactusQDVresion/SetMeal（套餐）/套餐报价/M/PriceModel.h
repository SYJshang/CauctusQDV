//
//  PriceModel.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/6.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "JSONModel.h"

@interface PriceModel : JSONModel
@property (nonatomic, strong) NSString *material;// 材料
@property (nonatomic, strong) NSString *brand;// 品牌
@property (nonatomic, assign) BOOL isBtnAction;
@end
