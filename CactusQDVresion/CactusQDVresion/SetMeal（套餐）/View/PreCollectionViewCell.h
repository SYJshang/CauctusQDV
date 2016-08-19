//
//  PreCollectionViewCell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreAcseListModel.h"
#import "TclistModel.h"
@interface PreCollectionViewCell : UITableViewCell

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *bootomLeftView;
@property (nonatomic, strong) UIView *bootomRightView;

@property (strong, nonatomic)  UIImageView *image;
@property (strong, nonatomic)  UILabel *leftLabel1;
@property (strong, nonatomic)  UILabel *leftLabel2;
@property (strong, nonatomic)  UILabel *rightLabel1;
@property (strong, nonatomic)  UILabel *rightLabel2;

@property (strong, nonatomic)  UIImageView *topRightImage;
@property (strong, nonatomic)  UILabel *topLabel1;
@property (strong, nonatomic)  UILabel *topLabel2;
@property (strong, nonatomic)  UILabel *topRightLabel1;
@property (strong, nonatomic)  UILabel *topRightLabel2;


@property (strong, nonatomic)  UIImageView *bootomLeftImage;
@property (strong, nonatomic)  UILabel *bootomLeftLabel1;
@property (strong, nonatomic)  UILabel *bootomLeftLabel2;
@property (strong, nonatomic)  UILabel *bootomRightLabel1;
@property (strong, nonatomic)  UILabel *bootomRightLabel2;


@property (strong, nonatomic)  UIImageView *bootomRightImage;
@property (strong, nonatomic)  UILabel *rightViewLeftLabel1;
@property (strong, nonatomic)  UILabel *rightViewLeftLabel2;
@property (strong, nonatomic)  UILabel *rightViewRightLabel1;
@property (strong, nonatomic)  UILabel *rightViewRightLabel2;

@property (nonatomic, strong) StoreAcseListModel *model;
@property (nonatomic, strong) TclistModel *tclist;

@property (nonatomic, strong) StoreAcseListModel *model1;
@property (nonatomic, strong) TclistModel *tclist1;

@property (nonatomic, strong) StoreAcseListModel *model2;
@property (nonatomic, strong) TclistModel *tclist2;

@property (nonatomic, strong) StoreAcseListModel *model3;
@property (nonatomic, strong) TclistModel *tclist3;

@end
