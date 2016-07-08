//
//  XRZStarvTV.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZStarvTV.h"
#import "XRZStarvCell.h"

@implementation XRZStarvTV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
//        [self registerNib:[UINib nibWithNibName:@"XRZStarvCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell1"];
        [self registerClass:[XRZStarvCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        XRZStarvCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

        cell.SystemNotifition.image = [UIImage imageNamed:@"-平台消息_系统通知"];
        return cell;
    }
    XRZStarvCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.SystemNotifition.image = [UIImage imageNamed:@"平台消息_活动推送"];
    
    cell.name.text = @"活动推送";
    
    cell.desc.text = @"活动消提醒";

    return cell;

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    XRZStarvCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSString *str = cell.name.text;
//    
//    [self.tiaozhuanDelegate skipInterface:str];
    
}
@end
