//
//  LeftSelectScroll.m
//  YiLeHelp
//
//  Created by ChenYi on 15/11/14.
//  Copyright © 2015年 JC. All rights reserved.
//

#import "LeftSelectScroll.h"
#import "ZB.h"

#define Color [UIColor colorWithRed:155 / 255.0 green:210 / 255.0 blue:105 / 255.0 alpha:1.0]
@implementation LeftSelectScroll
{
    ZB *tempSelectButton;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        tempSelectButton = [[ZB alloc]init];

    }
    return self;
}

-(void)setLeftSelectArray:(NSArray *)leftSelectArray{
    _leftSelectArray = leftSelectArray;
    for (int i = 0; i<_leftSelectArray.count; i++) {
        
        ZB *button = [[ZB alloc]initWithFrame:CGRectMake(0, 44*i, kScreenWidth*0.25, 44)];
        [button setTitle:_leftSelectArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:Color forState:UIControlStateSelected];
       
        [button setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.000]];
       
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, button.frame.size.height - 0.5, button.frame.size.width, 0.5)];

        label.backgroundColor = [UIColor grayColor];
        
        [button addSubview:label];
        
        [self addSubview:button];
      
        
        [button addTarget:self action:@selector(clickLeftSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i+11;
        if (i == 0) {
            [button setSelected:YES];
            [button setBackgroundColor:[UIColor whiteColor]];
             button.imgView.backgroundColor = Color;
            tempSelectButton = button;
         
        }
    }
}
//but的点击事件跟滚动视图联系起来
-(void)clickLeftSelectButton:(ZB* )button{
    
    [tempSelectButton setSelected:NO];
    [tempSelectButton setBackgroundColor:[UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.000]];
    tempSelectButton.imgView.backgroundColor = [UIColor clearColor];
    [button setBackgroundColor:[UIColor whiteColor]];
    button.imgView.backgroundColor = Color;
    [button setSelected:YES];
    
    tempSelectButton = button;
    
    NSInteger tag = button.tag - 11;
    if (self.leftSelectDelegate && [self.leftSelectDelegate respondsToSelector:@selector(clickLeftSelectScrollButton:)]) {
        [self.leftSelectDelegate clickLeftSelectScrollButton:tag];
    }
}
//滚动视图把but的颜色关联起来了
-(void)setSelectButtonWithIndexPathSection:(NSInteger)indexPathSection{

    for (int i = 0; i< _leftSelectArray.count; i++) {
        NSInteger tag = i + 11 ;
        ZB *btn = (ZB*)[self viewWithTag:tag];
        if (btn.tag == indexPathSection + 11) {
            tempSelectButton = btn;
            [btn setSelected:YES];
            btn.backgroundColor = [UIColor whiteColor];
            btn.imgView.backgroundColor = Color;
        }else{
            [btn setSelected:NO];
            btn.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.000];
            btn.imgView.backgroundColor = [UIColor clearColor];
        }
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com