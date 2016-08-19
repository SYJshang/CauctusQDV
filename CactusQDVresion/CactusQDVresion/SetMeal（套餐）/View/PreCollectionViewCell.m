//
//  PreCollectionViewCell.m
//  CactusHomeFurnish
//
//  Created by zhuxunyi on 16/5/10.
//  Copyright © 2016年 muyou. All rights reserved.
//

#import "PreCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+SDAutoLayout.h"

@implementation PreCollectionViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //上边leftview


        self.leftView = [[UIView alloc]init];
        [self.contentView addSubview:self.leftView];
        self.leftView.backgroundColor = [UIColor whiteColor];
        self.leftView.sd_layout.leftSpaceToView(self.contentView,5).topSpaceToView(self.contentView,0).heightIs(170).widthIs(ScreenW / 2 - 7);
        self.leftView.layer.masksToBounds = YES;
        self.leftView.layer.cornerRadius = 3.0;
        self.leftView.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
        self.leftView.layer.borderWidth = 1.0;

        
        
        self.image = [[UIImageView alloc]init];
        [self.image setImage:[UIImage imageNamed:@"192x120"]];
        [self.leftView addSubview:self.image];
        self.image.sd_layout.leftSpaceToView(self.leftView,0).rightSpaceToView(self.leftView,0).topSpaceToView(self.leftView,0).heightIs(120);
        

        
        self.leftLabel1 = [[UILabel alloc]init];
        [self.leftView addSubview:self.leftLabel1];
        self.leftLabel1.font = [UIFont systemFontOfSize:13];
        self.leftLabel1.sd_layout.leftSpaceToView(self.leftView,5).topSpaceToView(self.image,5).widthIs((2.0 / 3.0) * self.leftView.width - 10).heightIs(20);
       
        self.rightLabel1 = [[UILabel alloc]init];
        [self.leftView addSubview:self.rightLabel1];
        self.rightLabel1.font = [UIFont systemFontOfSize:13];
        self.rightLabel1.textAlignment = NSTextAlignmentRight;
        self.rightLabel1.sd_layout.rightSpaceToView(self.leftView,5).topSpaceToView(self.image,5).leftSpaceToView(self.leftView,5).heightIs(20);
      
        self.leftLabel2 = [[UILabel alloc]init];
        [self.leftView addSubview:self.leftLabel2];
        self.leftLabel2.font = [UIFont systemFontOfSize:12];
        self.leftLabel2.textColor = [UIColor grayColor];
        self.leftLabel2.sd_layout.leftSpaceToView(self.leftView,5).topSpaceToView(self.leftLabel1,0).widthIs((2.0 / 3.0) * self.leftView.width - 10).heightIs(20);
        
        self.rightLabel2 = [[UILabel alloc]init];
        [self.leftView addSubview:self.rightLabel2];
        self.rightLabel2.textAlignment = NSTextAlignmentRight;
        self.rightLabel2.textColor = [UIColor grayColor];
        self.rightLabel2.font = [UIFont systemFontOfSize:12];
        self.rightLabel2.sd_layout.rightSpaceToView(self.leftView,5).topSpaceToView(self.rightLabel1,0).leftSpaceToView(self.leftView,5).heightIs(20);
        
//
        //上边rightView
        self.rightView = [[UIView alloc]init];
        [self.contentView addSubview:self.rightView];
        self.rightView.backgroundColor = [UIColor whiteColor];
        self.rightView.sd_layout.rightSpaceToView(self.contentView,5).topSpaceToView(self.contentView,0).heightIs(170).widthIs(ScreenW / 2 - 7);
        self.rightView.layer.masksToBounds = YES;
        self.rightView.layer.cornerRadius = 3.0;
        self.rightView.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
        self.rightView.layer.borderWidth = 1.0;
        
        self.topRightImage = [[UIImageView alloc]init];
        [self.topRightImage setImage:[UIImage imageNamed:@"192x120"]];
        [self.rightView addSubview:self.topRightImage];
        self.topRightImage.sd_layout.leftSpaceToView(self.rightView,0).rightSpaceToView(self.rightView,0).topSpaceToView(self.rightView,0).heightIs(120);
        
        self.topLabel1 = [[UILabel alloc]init];
        [self.rightView addSubview:self.topLabel1];
        self.topLabel1.font = [UIFont systemFontOfSize:13];
        self.topLabel1.sd_layout.leftSpaceToView(self.rightView,5).topSpaceToView(self.topRightImage,5).widthIs((2.0 / 3.0) * self.rightView.width - 10).heightIs(20);
        
        self.topRightLabel1 = [[UILabel alloc]init];
        [self.rightView addSubview:self.topRightLabel1];
        self.topRightLabel1.font = [UIFont systemFontOfSize:13];
        self.topRightLabel1.textAlignment = NSTextAlignmentRight;
        self.topRightLabel1.sd_layout.rightSpaceToView(self.rightView,5).topSpaceToView(self.image,5).leftSpaceToView(self.rightView,5).heightIs(20);
        
        self.topLabel2 = [[UILabel alloc]init];
        [self.rightView addSubview:self.topLabel2];
        self.topLabel2.font = [UIFont systemFontOfSize:12];
        self.topLabel2.textColor = [UIColor grayColor];
        self.topLabel2.sd_layout.leftSpaceToView(self.rightView,5).topSpaceToView(self.topLabel1,0).widthIs((2.0 / 3.0) * self.rightView.width - 10).heightIs(20);
        
        self.topRightLabel2 = [[UILabel alloc]init];
        [self.rightView addSubview:self.topRightLabel2];
        self.topRightLabel2.textAlignment = NSTextAlignmentRight;
        self.topRightLabel2.textColor = [UIColor grayColor];
        self.topRightLabel2.font = [UIFont systemFontOfSize:12];
        self.topRightLabel2.sd_layout.rightSpaceToView(self.rightView,5).topSpaceToView(self.topRightLabel1,0).leftSpaceToView(self.rightView,5).heightIs(20);
        
//
////
//        //下边leftview
        self.bootomLeftView = [[UIView alloc]init];
        [self.contentView addSubview:self.bootomLeftView];
        self.bootomLeftView.backgroundColor = [UIColor whiteColor];
        self.bootomLeftView.sd_layout.leftSpaceToView(self.contentView,5).topSpaceToView(self.leftView,5).bottomSpaceToView(self.contentView,0).widthIs(ScreenW / 2 - 7);
        self.bootomLeftView.layer.masksToBounds = YES;
        self.bootomLeftView.layer.cornerRadius = 3.0;
        self.bootomLeftView.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
        self.bootomLeftView.layer.borderWidth = 1.0;
//
        self.bootomLeftImage = [[UIImageView alloc]init];
        [self.bootomLeftImage setImage:[UIImage imageNamed:@"192x120"]];
        [self.bootomLeftView addSubview:self.bootomLeftImage];
        self.bootomLeftImage.sd_layout.leftSpaceToView(self.bootomLeftView,0).rightSpaceToView(self.bootomLeftView,0).topSpaceToView(self.bootomLeftView,0).heightIs(120);
        
        self.bootomLeftLabel1 = [[UILabel alloc]init];
        [self.bootomLeftView addSubview:self.bootomLeftLabel1];
        self.bootomLeftLabel1.font = [UIFont systemFontOfSize:13];
        self.bootomLeftLabel1.sd_layout.leftSpaceToView(self.bootomLeftView,5).topSpaceToView(self.bootomLeftImage,5).widthIs((2.0 / 3.0) * self.bootomLeftView.width - 10).heightIs(20);
        
        self.bootomRightLabel1 = [[UILabel alloc]init];
        [self.bootomLeftView addSubview:self.bootomRightLabel1];
        self.bootomRightLabel1.font = [UIFont systemFontOfSize:13];
        self.bootomRightLabel1.textAlignment = NSTextAlignmentRight;
        self.bootomRightLabel1.sd_layout.rightSpaceToView(self.bootomLeftView,5).topSpaceToView(self.bootomLeftImage,5).leftSpaceToView(self.bootomLeftView,5).heightIs(20);
        
        self.bootomLeftLabel2 = [[UILabel alloc]init];
        [self.bootomLeftView addSubview:self.bootomLeftLabel2];
        self.bootomLeftLabel2.font = [UIFont systemFontOfSize:12];
        self.bootomLeftLabel2.textColor = [UIColor grayColor];
        self.bootomLeftLabel2.sd_layout.leftSpaceToView(self.bootomLeftView,5).topSpaceToView(self.bootomLeftLabel1,0).widthIs((2.0 / 3.0) * self.bootomLeftView.width - 10).heightIs(20);
        
        self.bootomRightLabel2 = [[UILabel alloc]init];
        [self.bootomLeftView addSubview:self.bootomRightLabel2];
        self.bootomRightLabel2.textAlignment = NSTextAlignmentRight;
        self.bootomRightLabel2.textColor = [UIColor grayColor];
        self.bootomRightLabel2.font = [UIFont systemFontOfSize:12];
        self.bootomRightLabel2.sd_layout.rightSpaceToView(self.bootomLeftView,5).topSpaceToView(self.bootomLeftLabel1,0).leftSpaceToView(self.bootomLeftView,5).heightIs(20);
//        //下边rightView
        self.bootomRightView = [[UIView alloc]init];
        [self.contentView addSubview:self.bootomRightView];
        self.bootomRightView.backgroundColor = [UIColor whiteColor];
        self.bootomRightView.sd_layout.rightSpaceToView(self.contentView,5).topSpaceToView(self.rightView,5).bottomSpaceToView(self.contentView,0).widthIs(ScreenW / 2 - 7);
        self.bootomRightView.layer.masksToBounds = YES;
        self.bootomRightView.layer.cornerRadius = 3.0;
        self.bootomRightView.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0].CGColor;
        self.bootomRightView.layer.borderWidth = 1.0;
        
        self.bootomRightImage = [[UIImageView alloc]init];
        [self.bootomRightImage setImage:[UIImage imageNamed:@"192x120"]];
        [self.bootomRightView addSubview:self.bootomRightImage];
        self.bootomRightImage.sd_layout.leftSpaceToView(self.bootomRightView,0).rightSpaceToView(self.bootomRightView,0).topSpaceToView(self.bootomRightView,0).heightIs(120);
        
        self.rightViewLeftLabel1 = [[UILabel alloc]init];
        [self.bootomRightView addSubview:self.rightViewLeftLabel1];
        self.rightViewLeftLabel1.font = [UIFont systemFontOfSize:13];
        self.rightViewLeftLabel1.sd_layout.leftSpaceToView(self.bootomRightView,5).topSpaceToView(self.bootomRightImage,5).widthIs((2.0 / 3.0) * self.bootomRightView.width - 10).heightIs(20);
        
        self.rightViewRightLabel1 = [[UILabel alloc]init];
        [self.bootomRightView addSubview:self.rightViewRightLabel1];
        self.rightViewRightLabel1.font = [UIFont systemFontOfSize:13];
        self.rightViewRightLabel1.textAlignment = NSTextAlignmentRight;
        self.rightViewRightLabel1.sd_layout.rightSpaceToView(self.bootomRightView,5).topSpaceToView(self.bootomRightImage,5).leftSpaceToView(self.bootomRightView,5).heightIs(20);
        
        self.rightViewLeftLabel2 = [[UILabel alloc]init];
        [self.bootomRightView addSubview:self.rightViewLeftLabel2];
        self.rightViewLeftLabel2.font = [UIFont systemFontOfSize:12];
        self.rightViewLeftLabel2.textColor = [UIColor grayColor];
        self.rightViewLeftLabel2.sd_layout.leftSpaceToView(self.bootomRightView,5).topSpaceToView(self.rightViewLeftLabel1,0).widthIs((2.0 / 3.0) * self.bootomRightView.width - 10).heightIs(20);
        
        self.rightViewRightLabel2 = [[UILabel alloc]init];
        [self.bootomRightView addSubview:self.rightViewRightLabel2];
        self.rightViewRightLabel2.textAlignment = NSTextAlignmentRight;
        self.rightViewRightLabel2.textColor = [UIColor grayColor];
        self.rightViewRightLabel2.font = [UIFont systemFontOfSize:12];
        self.rightViewRightLabel2.sd_layout.rightSpaceToView(self.bootomRightView,5).topSpaceToView(self.rightViewRightLabel1,0).leftSpaceToView(self.bootomRightView,5).heightIs(20);
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setModel:(StoreAcseListModel *)model{
    
    _model = model;
    NSString *string2 = model.title;
    NSString *string3 = model.pic;
    NSString *string4 = model.style;
    NSString *string5 = model.mj;
    NSString *string6 = model.nickname;
    
    
    // 异步加载图片
    [_image sd_setImageWithURL:[NSURL URLWithString:string3]];
    
    _leftLabel1.text = string2;
    _leftLabel2.text = string4;
    
    _rightLabel1.text = string6;
    _rightLabel2.text = string5;
}



- (void)setModel1:(StoreAcseListModel *)model1
{
    _model1 = model1;
    NSString *string2 = model1.title;
    NSString *string3 = model1.pic;
    NSString *string4 = model1.style;
    NSString *string5 = model1.mj;
    NSString *string6 = model1.nickname;
    
    
    // 异步加载图片
    [self.topRightImage sd_setImageWithURL:[NSURL URLWithString:string3]];
    
    self.topLabel1.text = string2;
    self.topLabel2.text = string4;
    
    self.topRightLabel1.text = string6;
    self.topRightLabel2.text = string5;
    
    // 异步加载图片
//    [self.topRightImage sd_setImageWithURL:[NSURL URLWithString:string3]];
//    
//    self.topLabel2.text = string4;
//    
//    self.rightLabel2.text = string5;

}



- (void)setModel2:(StoreAcseListModel *)model2{
    
    _model2 = model2;
    NSString *string2 = model2.title;
    NSString *string3 = model2.pic;
    NSString *string4 = model2.style;
    NSString *string5 = model2.mj;
    NSString *string6 = model2.nickname;
    
    
    // 异步加载图片
    [self.bootomLeftImage sd_setImageWithURL:[NSURL URLWithString:string3]];
    
    self.bootomLeftLabel1.text = string2;
    self.bootomLeftLabel2.text = string4;
    
    self.bootomRightLabel1.text = string6;
    self.bootomRightLabel2.text = string5;
}



- (void)setModel3:(StoreAcseListModel *)model3{
    
    
    _model3 = model3;
    NSString *string2 = model3.title;
    NSString *string3 = model3.pic;
    NSString *string4 = model3.style;
    NSString *string5 = model3.mj;
    NSString *string6 = model3.nickname;
    
    
    // 异步加载图片
    [self.bootomRightImage sd_setImageWithURL:[NSURL URLWithString:string3]];
    
    self.rightViewLeftLabel1.text = string2;
    self.rightViewLeftLabel2.text = string4;
    
    self.rightViewRightLabel1.text = string6;
    self.rightViewRightLabel2.text = string5;
}





@end
