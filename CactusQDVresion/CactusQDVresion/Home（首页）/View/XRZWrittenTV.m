//
//  XRZWrittenTV.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZWrittenTV.h"
#import "XRZWrittenCell.h"

@implementation XRZWrittenTV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
//        [self registerNib:[UINib nibWithNibName:@"XRZWrittenCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
        [self registerClass:[XRZWrittenCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRZWrittenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.delegate = self;
//    cell.btn1.layer.masksToBounds = YES;
//    cell.btn1.layer.cornerRadius = cell.btn1.height / 2;
//    cell.btn1.layer.borderWidth = 1;
//    cell.btn1.layer.borderColor = HWColor(63, 203, 125).CGColor;
//    self.refuseBtn = cell.btn1;
//    
//    cell.btn2.layer.masksToBounds = YES;
//    cell.btn2.layer.cornerRadius = 14;
//    self.accountBtn = cell.btn2;
//
//
//    
//    cell.icon.layer.masksToBounds = YES;
//    cell.icon.layer.cornerRadius = cell.icon.height / 2;
//    
//    
//    
//    self.changeCell = cell;
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, ScreenW, 25);
    view.backgroundColor = HWColor(240, 240, 240);
    
    UILabel *cutdown = [[UILabel alloc]init];
    cutdown.frame = CGRectMake(10, 0, ScreenW,25);
    [view addSubview:cutdown];
    cutdown.font = [UIFont systemFontOfSize:14];
    cutdown.textColor = [UIColor blackColor];
    NSArray *array = @[@"今天",@"昨天"];
    cutdown.text = array[section];
    return view;
}
- (void)skip{
    
    XRZLog(@"qwer");
    [self.tiaozhuan SkipController];
    
}




@end
