//
//  XRZBtton.m
//  CactusQDVresion
//
//  Created by zhuxunyi on 16/8/16.
//  Copyright © 2016年 尚勇杰. All rights reserved.
//

#import "XRZBtton.h"

@implementation XRZBtton
- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeRight;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0,5,70, 30);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(65,17,10, 8);
}

@end
