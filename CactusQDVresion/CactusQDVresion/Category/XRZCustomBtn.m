//
//  XRZCustomBtn.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZCustomBtn.h"

@implementation XRZCustomBtn

- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.imageView.contentMode = UIViewContentModeRight;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(self.frame.size.width - 100,5,80, 30);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(self.frame.size.width - 20,10,20, 20);
}


@end
