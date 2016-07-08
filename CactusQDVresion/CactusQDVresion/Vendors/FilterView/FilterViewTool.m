//
//  FilterViewTool.m
//  BrokerWorkTool
//
//  Created by liujianzhong on 15/12/10.
//  Copyright © 2015年 liujianzhong. All rights reserved.
//

#import "FilterViewTool.h"


#define FILTERCONTENTHIGHT 266

@interface FilterViewTool () <ViewFilterSingleDelegate, ViewFilterDoubleDelegate>

@end

@implementation FilterViewTool
- (UIButton *)buttonBlock {
    if (_buttonBlock == nil) {
        _buttonBlock = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonBlock addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonBlock.selected = NO;
        _buttonBlock.tag = 1;
        [_buttonBlock setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonBlock setTitleColor: DSColorMake(155, 210, 105) forState:UIControlStateSelected];
        [_buttonBlock setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        [_buttonBlock setContentMode:UIViewContentModeScaleToFill];
        [_buttonBlock setBackgroundColor:[UIColor whiteColor]];
        _buttonBlock.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonBlock.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        [_buttonBlock addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];

        [_buttonBlock setTitle:@"项目经理" forState:UIControlStateNormal];
    }
    return _buttonBlock ;
}

- (UIButton *)buttonArea {
    if (_buttonArea == nil) {
        _buttonArea = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonArea addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonArea.selected = NO;
        _buttonArea.tag = 2;
        [_buttonArea setBackgroundColor:[UIColor whiteColor]];
        [_buttonArea setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonArea setTitleColor: DSColorMake(155, 210, 105) forState:UIControlStateSelected];
        [_buttonArea setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        [_buttonArea setContentMode:UIViewContentModeScaleToFill];
        _buttonArea.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonArea.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        [_buttonArea addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];
        [_buttonArea setTitle:@"装修公司" forState:UIControlStateNormal];
    }
    return _buttonArea;
}

- (UIButton *)buttonPrice {
    if (_buttonPrice == nil) {
        _buttonPrice = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonPrice addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonPrice.selected = NO;
        _buttonPrice.tag = 3;
        [_buttonPrice setBackgroundColor:[UIColor whiteColor]];
        [_buttonPrice setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonPrice setTitleColor: DSColorMake(155, 210, 105) forState:UIControlStateSelected];
        [_buttonPrice setContentMode:UIViewContentModeScaleToFill];
        [_buttonPrice setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        _buttonPrice.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonPrice.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        [_buttonPrice addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];

        [_buttonPrice setTitle:@"设计师" forState:UIControlStateNormal];

    }
    return _buttonPrice;
}

- (UIButton *)buttonMore {
    if (_buttonMore == nil) {
        _buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonMore addTarget:self action:@selector(onClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _buttonMore.selected = NO;
        _buttonMore.tag = 4;
        [_buttonMore setBackgroundColor:[UIColor whiteColor]];
        [_buttonMore setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
        [_buttonMore setTitleColor: DSColorMake(155, 210, 105) forState:UIControlStateSelected];
        [_buttonMore setContentMode:UIViewContentModeScaleToFill];
        [_buttonMore setImageEdgeInsets:UIEdgeInsetsMake(11, 62, 11, 0)];
        _buttonMore.titleLabel.font = [UIFont systemFontOfSize:14];
        _buttonMore.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_buttonMore addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];
        [_buttonMore setImage:[UIImage imageNamed:@"下拉箭头"] forState:UIControlStateNormal];
        [_buttonMore setImage:[UIImage imageNamed:@"形状-4"] forState:UIControlStateSelected];
        [_buttonMore setTitle:@"工人" forState:UIControlStateNormal];
    }
    return _buttonMore;
}

- (ViewFilterSingle *)viewFilterArea {
    if (_viewFilterArea == nil) {
        _viewFilterArea = [[ViewFilterSingle alloc] init];
        _viewFilterArea.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterArea.viewHight = FILTERCONTENTHIGHT;
        _viewFilterArea.delegate = self;
    }
    return _viewFilterArea;
}

- (ViewFilterSingle *)viewFilterPrice {
    if (_viewFilterPrice == nil) {
        _viewFilterPrice = [[ViewFilterSingle alloc] init];
        _viewFilterPrice.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterPrice.viewHight = FILTERCONTENTHIGHT;
        _viewFilterPrice.delegate = self;
    }
    return _viewFilterPrice;
}

- (ViewFilterSingle *)viewFilterMore {
    if (_viewFilterMore == nil) {
        _viewFilterMore = [[ViewFilterSingle alloc] init];
        _viewFilterMore.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterMore.viewHight = FILTERCONTENTHIGHT;

        _viewFilterMore.arrayData = [NSMutableArray arrayWithObjects:@"水电工",@"泥工",@"木工",@"油漆工",nil];
        _viewFilterMore.delegate = self;
    }
    return _viewFilterMore;
}

- (ViewFilterSingle *)viewFilterDoubleBlock {
    if (_viewFilterDoubleBlock == nil) {
        _viewFilterDoubleBlock = [[ViewFilterSingle alloc] init];
        _viewFilterDoubleBlock.delegate = self;
        _viewFilterDoubleBlock.frame = CGRectMake(0, FilterViewToolHight, SCREENWIDTH, 0);
        _viewFilterDoubleBlock.viewHight = FILTERCONTENTHIGHT;

         _viewFilterPrice.delegate = self;
    }
    return _viewFilterDoubleBlock;
}

- (UIView *)viewLineF {
    if (_viewLineF == nil) {
        _viewLineF = [[UIView alloc] init];
        _viewLineF.backgroundColor = [UIColor grayColor];
    }
    return _viewLineF;
}

- (UIView *)viewLineT {
    if (_viewLineT == nil) {
        _viewLineT = [[UIView alloc] init];
        _viewLineT.backgroundColor = [UIColor grayColor];
    }
    return _viewLineT;
}

- (UIView *)viewLineR {
    if (_viewLineR == nil) {
        _viewLineR = [[UIView alloc] init];
        _viewLineR.backgroundColor = [UIColor grayColor];
    }
    return _viewLineR;
}

#pragma mark - lifeCycleMethods
- (id)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

- (void)dealloc {
    [self.buttonBlock removeObserver:self forKeyPath:@"titleLabel.text"];
}

- (void)initUI {
    [self addSubview:self.viewFilterArea];
    [self addSubview:self.viewFilterDoubleBlock];
    [self addSubview:self.viewFilterPrice];
    [self addSubview:self.viewFilterMore];
    self.clipsToBounds = NO;
    self.buttonBlock.frame = CGRectMake(0, 0, SCREENWIDTH / 4, FilterViewToolHight);
    self.buttonArea.frame = CGRectMake(SCREENWIDTH / 4, 0, SCREENWIDTH / 4, FilterViewToolHight);
    self.buttonPrice.frame = CGRectMake(SCREENWIDTH/4 * 2, 0, SCREENWIDTH / 4, FilterViewToolHight);
    self.buttonMore.frame = CGRectMake(SCREENWIDTH / 4 * 3, 0, SCREENWIDTH / 4, FilterViewToolHight);
    
    self.viewLineF.frame = CGRectMake(self.buttonBlock.ctRight, 10, 1, FilterViewToolHight - 20);
    self.viewLineT.frame = CGRectMake(self.buttonArea.ctRight, 10, 1, FilterViewToolHight - 20);
    self.viewLineR.frame = CGRectMake(self.buttonPrice.ctRight, 10, 1, FilterViewToolHight - 20);
    
    [self addSubview:self.buttonBlock];
    [self addSubview:self.buttonArea];
    [self addSubview:self.buttonPrice];
    [self addSubview:self.buttonMore];
    [self addSubview:self.viewLineF];
    [self addSubview:self.viewLineT];
    [self addSubview:self.viewLineR];
    
    self.clipsToBounds = YES;
}

- (void)onClickButtonAction:(UIButton *)button {

    switch (button.tag) {
        case 1:
        {
            if (button.selected == NO) {
                    button.selected = YES;
//                [self.viewFilterDoubleBlock show];
//                if (self.localDoubleValue != nil) {
//                    [self.viewFilterDoubleBlock setDefaultValue:self.localDoubleValue];
//                }
            } else {
                button.selected = NO;
//                [self.viewFilterDoubleBlock hidden];
            }
        }
            break;
        case 2:
        {
            if (button.selected == NO) {
                button.selected = YES;
//                [self.viewFilterArea show];
                if (self.localAreaValue != nil) {
                    [self.viewFilterArea setDefaultValue:self.localAreaValue];
                }
            } else {
                button.selected = NO;
//                [self.viewFilterArea hidden];
            }
            
        }
            break;
        case 3:
        {
            if (button.selected == NO) {
                button.selected = YES;
//                [self.viewFilterPrice show];
                if (self.localMoreValue != nil) {
                    [self.viewFilterMore setDefaultValue:self.localMoreValue];
                }
            } else {
                button.selected = NO;
//                [self.viewFilterPrice hidden];
            }
        }
            break;
        case 4:
        {
            if (button.selected == NO) {
                button.selected = YES;
                [self.viewFilterMore show];
                if (self.localMoreValue != nil) {
                
                [button setTitleColor: DSColorMake(155, 210, 105) forState:UIControlStateNormal];

                [self.viewFilterMore setDefaultValue:self.localMoreValue];
                }
            } else {
                button.selected = NO;
                [self.viewFilterMore hidden];
                [button setTitleColor:DSColorFromHex(0x60646f) forState:UIControlStateNormal];
            }
        }
            break;
        default:
            break;
    }
    self.ctHeight = SCREENHEIGHT;
}

- (void)cancelAllFilter {
    self.buttonBlock.selected = NO;
    self.buttonArea.selected = NO;
    self.buttonPrice.selected = NO;
    self.buttonMore.selected = NO;
    
    [self.viewFilterDoubleBlock hidden];
    [self.viewFilterArea hidden];
    [self.viewFilterMore hidden];
    [self.viewFilterPrice hidden];
    self.ctHeight = FilterViewToolHight;

}

#pragma mark - ViewFilterSingleDelegate
- (void)didClickCancelAction:(id) filter {
    //cancel掉所有
    [self cancelAllFilter];
}

- (void)didSelectItem:(id)filter atIndex:(NSInteger)index withValue:(id)value {
    if ([filter isEqual:self.viewFilterArea]) {
        self.localAreaValue = value;
//        NSString *title = [self transationToShortString:value];
        [self resetButton:self.buttonArea SizeBy:value];
    }
    
    if ([filter isEqual:self.viewFilterPrice]) {
        self.localPriceValue = value;
//        NSString *title = [self transationToShortString:value];
        [self resetButton:self.buttonPrice SizeBy:value];
    }

    if ([filter isEqual:self.viewFilterDoubleBlock]) {
        self.localDoubleValue = value;
        NSString *title = [value[@"sub"] length] == 0? value[@"main"]:value[@"sub"];
        title = [self transationToShortString:title];
        [self resetButton:self.buttonBlock SizeBy:title];
    }
    
    if ([filter isEqual:self.viewFilterMore]) {
        self.localMoreValue = value;
//        NSString *title = [value[@"sub"] length] == 0? value[@"main"]:value[@"sub"];
//        title = [self transationToShortString:title];
//        [self resetButton:self.buttonMore SizeBy:title];
        [self resetButton:self.buttonMore SizeBy:value];
    }
    [self cancelAllFilter];
    
}

- (NSString *)transationToShortString:(NSString *)string {
    NSString *stringResult = @"";
    if (string.length > 5) {
        stringResult = [NSString stringWithFormat:@"%@..",[string substringToIndex:4]];
    } else {
        stringResult = string;
    }
    return stringResult;
}

-(void)resetButton:(UIButton *)button SizeBy:(NSString*)str{
    [button setTitle:str forState:UIControlStateNormal];
}

#pragma mark - ********************************** Notification *****************************************
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UIButton *btnChange = (UIButton *)object;
    /// 计算当前按钮文字的宽度
    NSString *strNew = change[@"new"];
    /// 得到文字和图片的大小
    CGSize sizeNewString = [strNew sizeWithFont:btnChange.titleLabel.font];
    CGSize sizeImage = btnChange.imageView.frame.size;
    /// 设置图片和文字
    [btnChange setTitleEdgeInsets:UIEdgeInsetsMake(0, -sizeImage.width + 5, 0, sizeImage.width+5)];
    [btnChange setImageEdgeInsets:UIEdgeInsetsMake(0, sizeNewString.width, 0, -sizeNewString.width - 5)];
}

@end
