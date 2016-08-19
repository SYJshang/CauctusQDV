//
//  PriceViewController.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/7/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LeftButtonTitle @"基础套餐"
#define RightButtonTitle @"可增加项"
//尺寸定义
#define kScreenWidth [UIScreen mainScreen].bounds.size.width//屏幕的宽度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height//屏幕的高度
#define kNav_H kScreenHeight > 668 ? 86 : 64//屏幕的高度
#define kTabbar_H kScreenHeight > 668 ? 59 : 49//屏幕的高度
//RGBA设置颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface PriceViewController : UIViewController
@end
