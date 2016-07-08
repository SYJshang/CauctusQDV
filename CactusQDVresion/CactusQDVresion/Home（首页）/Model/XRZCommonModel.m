//
//  XRZCommonModel.m
//  仙人掌抢单般
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZCommonModel.h"

@implementation XRZCommonModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"iId"}];
}

@end
