//
//  XRZProcess.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SkipContoller <NSObject>
@optional
-(void)skipInterface:(NSString *)title;
@end

@interface XRZProcess: UITableView<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, strong) UIViewController *cotroller;

@property (nonatomic,assign)id<SkipContoller>tiaozhuanDelegate;
@end
