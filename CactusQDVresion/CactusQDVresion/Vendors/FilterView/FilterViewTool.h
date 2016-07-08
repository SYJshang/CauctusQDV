//
//  FilterViewTool.h
//  BrokerWorkTool
//
//  Created by liujianzhong on 15/12/10.
//  Copyright © 2015年 liujianzhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewFilterSingle.h"
#import "ViewFilterDouble.h"

#define FilterViewToolHight 40

@interface FilterViewTool : UIView

@property (nonatomic, strong) ViewFilterSingle *viewFilterArea;
@property (nonatomic, strong) ViewFilterSingle *viewFilterDoubleBlock;
@property (nonatomic, strong) ViewFilterSingle *viewFilterPrice;
@property (nonatomic, strong) ViewFilterSingle *viewFilterMore;

@property (nonatomic, strong) UIButton *buttonBlock;
@property (nonatomic, strong) UIButton *buttonArea;
@property (nonatomic, strong) UIButton *buttonPrice;
@property (nonatomic, strong) UIButton *buttonMore;

@property (nonatomic, strong) UIView *viewLineF;
@property (nonatomic, strong) UIView *viewLineT;
@property (nonatomic, strong) UIView *viewLineR;

@property (nonatomic, strong) id localDoubleValue;
@property (nonatomic, strong) id localMoreValue;

@property (nonatomic, strong) id localAreaValue;
@property (nonatomic, strong) id localPriceValue;


@end
