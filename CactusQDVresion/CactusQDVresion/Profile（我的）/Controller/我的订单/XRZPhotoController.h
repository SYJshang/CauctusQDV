//
//  XRZPhotoController.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQPhotoPickerViewController.h"


@interface XRZPhotoController : LQPhotoPickerViewController<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;


//@property(nonatomic,strong) UIView *noteTextBackgroudView;
//备注
//@property(nonatomic,strong) UITextView *noteTextView;

//文字个数提示label
//@property(nonatomic,strong) UILabel *textNumberLabel;
//
////文字说明
//@property(nonatomic,strong) UILabel *explainLabel;

//提交按钮
@property(nonatomic,strong) UIButton *submitBtn;

@end
