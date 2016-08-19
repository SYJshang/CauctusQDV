//
//  ShowTableViewCell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJAdView.h"

@interface ShowTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIImageView *doubleLine;
@property (nonatomic, strong) FJAdView *adview;
@property (nonatomic, strong) NSArray *data;

@end
