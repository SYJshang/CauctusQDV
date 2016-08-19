
//
//  CaseFourBtnCollectionCell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"

@interface CaseFourBtnCollectionCell : UITableViewCell
{
    NSMutableArray *_imgArray;
    NSMutableArray *_labelArray;
    
}
@property(nonatomic,strong)MyButton *button;
@property (nonatomic, assign) BOOL isSiez;
@end
