//
//  XRZWrittenTV.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRZWrittenCell.h"

@protocol WatchSkip <NSObject>

- (void)SkipController;

@end


@interface XRZWrittenTV : UITableView<UITableViewDataSource, UITableViewDelegate,SeeSkip>

@property (nonatomic, strong)XRZWrittenCell *changeCell;

//接受
@property (nonatomic, strong) UIButton *accountBtn;
//拒绝
@property (nonatomic, strong) UIButton *refuseBtn;

@property (nonatomic, strong) UIView *bg;

@property (nonatomic, assign) int index;


@property (nonatomic, strong) id<WatchSkip>tiaozhuan;


@end
