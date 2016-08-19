//
//  List5Cell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/9.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Cell5Centdelagate <NSObject>
-(BOOL)cell5CentDelegate:(NSString *)string section:(NSInteger)section;
-(void)List4celltextView:(UITextView *)textView;
@end

@interface List5Cell : UITableViewCell<UITextViewDelegate>

@property (nonatomic, weak) id<Cell5Centdelagate>delegate;

@property (strong, nonatomic) IBOutlet UIView *buttomView;
@property (nonatomic, strong) UIView *viewText;
@property (nonatomic, assign) NSInteger isSection;

@property (nonatomic, strong) NSString *string;

@property (strong, nonatomic) IBOutlet UILabel *plLabel;

@property (strong, nonatomic) IBOutlet UITextView *textViewPL;

@end
