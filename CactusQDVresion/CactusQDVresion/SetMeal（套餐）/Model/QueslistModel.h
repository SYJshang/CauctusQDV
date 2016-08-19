//
//  QueslistModel.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "JSONModel.h"

@interface QueslistModel : JSONModel
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;

@end
