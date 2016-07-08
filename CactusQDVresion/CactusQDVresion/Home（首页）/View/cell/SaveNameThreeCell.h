//
//  SaveNameThreeCell.h
//  测试
//
//  Created by LZY on 16/4/15.
//  Copyright © 2016年 LZY. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "XRZBackButton.h"

@interface SaveNameThreeCell : UITableViewCell<UIImagePickerControllerDelegate>
//正面
@property (weak, nonatomic) IBOutlet XRZBackButton *front;
//反面
@property (weak, nonatomic) IBOutlet XRZBackButton *reverse;


@end
