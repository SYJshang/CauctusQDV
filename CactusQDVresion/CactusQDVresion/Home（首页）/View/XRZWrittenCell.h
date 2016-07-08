//
//  XRZWrittenCell.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeeSkip <NSObject>

- (void)skip;

@end

@interface XRZWrittenCell : UITableViewCell
@property (strong, nonatomic)  UIImageView *icon;
@property (strong, nonatomic)  UILabel *name;
@property (strong, nonatomic)  UILabel *desc;
@property (strong, nonatomic)  UILabel *time;
@property (strong, nonatomic)  UIButton *btn1;
@property (strong, nonatomic)  UIButton *btn2;

@property (nonatomic,assign)id<SeeSkip>delegate;

@end
