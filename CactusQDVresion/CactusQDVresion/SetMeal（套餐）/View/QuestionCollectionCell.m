//
//  QuestionCollectionCell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/11.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "QuestionCollectionCell.h"
#import "UIView+SDAutoLayout.h"

@implementation QuestionCollectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.questionLab = [[UILabel alloc]init];
        self.questionLab.numberOfLines = 0;
        self.questionLab.font = [UIFont systemFontOfSize:14];
        self.questionLab.lineBreakMode = NSLineBreakByTruncatingTail;
        
        self.answerLab = [[UILabel alloc]init];
        self.answerLab.numberOfLines = 0;
        self.answerLab.lineBreakMode = NSLineBreakByTruncatingTail;
        self.answerLab.font = [UIFont systemFontOfSize:14];
        self.answerLab.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.questionLab];
        [self.contentView addSubview:self.answerLab];
        
        self.questionLab.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,15).rightSpaceToView(self.contentView,10).heightIs(20);
        self.answerLab.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.questionLab,0).rightSpaceToView(self.contentView,10).heightIs(20);
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(QueslistModel *)model
{
    if (_model != model) {
        
        // 问题
        NSString *quest = [NSString stringWithFormat:@"问：%@",model.title];
        NSString *answer = [NSString stringWithFormat:@"答：%@",model.content];
        
        _questionLab.text = quest;
        _answerLab.text = answer;
        
        // 计算文字高度
        CGFloat height = [QuestionCollectionCell HeightWithQuestionLab:model];
        
        // 将文字Label高度修改
        CGRect frame = self.questionLab.frame;
        frame.size.height = height;
        self.questionLab.frame = frame;

        //答案
        CGFloat height1 = [QuestionCollectionCell HeightWithAnserLab:model];
        CGRect frame1 = self.answerLab.frame;
        frame1.size.height = height1;
        self.answerLab.frame = frame1;
    }
}

// 问题高度
+ (CGFloat)HeightWithQuestionLab:(QueslistModel *)question
{
    CGRect rect = [question.title boundingRectWithSize:CGSizeMake(290, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]} context:nil];
    
    return rect.size.height;

}
//答案高度
+ (CGFloat)HeightWithAnserLab:(QueslistModel *)answer
{
    CGRect rect = [answer.content boundingRectWithSize:CGSizeMake(290, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]} context:nil];
    
    return rect.size.height;
}


// 自定义高度,在tableViewController的.m中得cell高度中调用返回这个方法
+ (CGFloat)cellHeightWithTextModel:(QueslistModel *)textModel
{
    
    return 15 + [self HeightWithQuestionLab:textModel] + [self HeightWithAnserLab:textModel];
}


@end
