//
//  XRZFinish.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SkipView <NSObject>
@optional
-(void)skipInterface:(NSString *)title;
@end

@interface XRZFinish : UITableView<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, strong) UIViewController *cotroller;

@property (nonatomic,assign)id<SkipView>tiaozhuanDelegate;

@end
