//
//  XRZTextView.h
//  仙人掌抢单般
//
//  Created by apple on 16/4/16.
//  Copyright © 2016年 muios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XRZTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;


@end
