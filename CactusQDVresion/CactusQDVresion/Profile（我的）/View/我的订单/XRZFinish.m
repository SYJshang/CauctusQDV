//
//  XRZFinish.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZFinish.h"
#import "XRZFinishCell.h"
#import "XRZFillInController.h"
#import "sys/utsname.h"


@implementation XRZFinish


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
//        [self registerNib:[UINib nibWithNibName:@"XRZFinishCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"finish"];
    [self registerClass:[XRZFinishCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XRZFinishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 10)];
    view.backgroundColor = [UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1.0];
    
    [cell.stsatBtn.layer setMasksToBounds:YES];
    [cell.stsatBtn.layer setCornerRadius:10];
    [cell.contentView addSubview:view];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *localPhoneModel = [self deviceVersion];
    if ([localPhoneModel isEqualToString:@"iPhone 5S"] && [localPhoneModel isEqualToString:@"iPhone 5"]) {
        return 135;
    }
    return 145;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XRZFinishCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *str = cell.title.text;
    
    [self.tiaozhuanDelegate skipInterface:str];

}
- (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //CLog(@"%@",deviceString);
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    //CLog(@"NOTE: Unknown device type: %@", deviceString);
    
    return deviceString;
}



@end
