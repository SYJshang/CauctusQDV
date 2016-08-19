//
//  XRZTableVC.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/13.
//  Copyright © 2016年 muios. All rights reserved.
//

#import "XRZTableVC.h"
#import "XRWorkerCell.h"


@interface XRZTableVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableVC;

@end

@implementation XRZTableVC

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //tableView
        UITableView *mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        [self addSubview:mainTableView];
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        [mainTableView registerClass:[XRWorkerCell class] forCellReuseIdentifier:@"cell"];
        self.tableVC = mainTableView;
        
            }
    return self;
}

#pragma mark - table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    XRWorkerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[XRWorkerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
      
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

}




@end
