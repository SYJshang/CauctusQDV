//
//  XRZBackButton.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZBackButton.h"


@implementation XRZBackButton

- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageView.contentMode = UIViewContentModeBottom;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, contentRect.size.height / 2, contentRect.size.width, contentRect.size.height / 2);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height / 2);
}



@end
