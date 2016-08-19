//
//  StoreAcseListModel.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "StoreAcseListModel.h"

@implementation StoreAcseListModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"replaceID"}];
}
@end
