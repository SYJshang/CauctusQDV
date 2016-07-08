//
//  XRZTabBarController.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZTabBarController.h"
#import "XRZTableController.h"
#import "XRZProfileController.h"
#import "XRZSetMealController.h"
#import "XRZOrdeFomeController.h"
#import "XRZNavitationController.h"
//#import "StoreViewController.h"

@interface XRZTabBarController ()

@end

@implementation XRZTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    XRZTableController *home = [[XRZTableController alloc] init];
    [self addChildVc:home title:@"主页" image:@"主页_灰" selectedImage:@"主页"];
    
    XRZOrdeFomeController *messageCenter = [[XRZOrdeFomeController alloc] init];
    [self addChildVc:messageCenter title:@"订单" image:@"订单_灰" selectedImage:@"订单"];
    
    XRZSetMealController *discover = [[XRZSetMealController alloc] init];
    [self addChildVc:discover title:@"套餐" image:@"套餐_灰" selectedImage:@"套餐"];
    
    XRZProfileController *profile = [[XRZProfileController alloc] init];
    [self addChildVc:profile title:@"我的" image:@"我的_灰" selectedImage:@"我的"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(156,156,156);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = HWColor(63, 202,125);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    childVc.view.backgroundColor = [UIColor whiteColor];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    XRZNavitationController *nav = [[XRZNavitationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}


@end
