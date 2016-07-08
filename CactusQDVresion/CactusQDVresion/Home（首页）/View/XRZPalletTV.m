//
//  XRZPalletTV.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZPalletTV.h"
#import "XRZPallerCell.h"

@implementation XRZPalletTV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"XRZPallerCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pallerCell"];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRZPallerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pallerCell"];
    
    cell.icon.layer.masksToBounds = YES;
    cell.icon.layer.cornerRadius = 37.5;
    
    cell.message.layer.masksToBounds = YES;
    cell.message.layer.cornerRadius = 10;

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
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
    NSArray *array = @[@"今天",@"昨天",@"2016年5月5号"];
    cutdown.text = array[section];
    return view;
}


@end
