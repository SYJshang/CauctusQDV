//
//  XRZBtn.m
//  仙人掌抢单般
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZBtn.h"

@implementation XRZBtn

- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeRight;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(self.frame.size.width - 65,5,50, 30);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(self.frame.size.width - 22,17,10, 8);
}

@end
