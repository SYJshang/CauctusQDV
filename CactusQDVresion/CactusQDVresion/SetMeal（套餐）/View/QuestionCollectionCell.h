//
//  QuestionCollectionCell.h
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueslistModel.h"

@interface QuestionCollectionCell : UITableViewCell
@property(nonatomic,retain)UILabel *questionLab;
@property(nonatomic,retain)UILabel *answerLab;
@property (nonatomic, strong) QueslistModel *model;


+ (CGFloat)HeightWithQuestionLab:(QueslistModel *)question;
+ (CGFloat)HeightWithAnserLab:(QueslistModel *)answer;


+ (CGFloat)cellHeightWithTextModel:(QueslistModel *)textModel;

@end
