//
//  StoreModel.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "JSONModel.h"

@interface StoreModel : JSONModel
@property (nonatomic, strong) NSArray *tclist;// 伪套餐申请数组 (注：需要滚动)
@property (nonatomic, strong) NSArray *caselist;// 套餐案例数组 (字段：pic,title,style,mj,nickname)
@property (nonatomic, strong) NSArray *queslist;// 套餐问答数组 (字段：title,content)
@end
