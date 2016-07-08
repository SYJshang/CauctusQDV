//
//  SaveNameFirstCell.h
//  测试
//
//  Created by LZY on 16/4/15.
//  Copyright © 2016年 LZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRZCommonModel.h"

@interface SaveNameFirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) XRZCommonModel *common;

@end
