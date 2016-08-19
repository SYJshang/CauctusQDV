//
//  StoreCollectionCell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "StoreCollectionCell.h"

#define Height  CGRectGetHeight([UIScreen mainScreen].bounds)
#define Width   CGRectGetWidth([UIScreen mainScreen].bounds)
@implementation StoreCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, Width*145/375)];
    [self addSubview:_imgView];
}

@end
