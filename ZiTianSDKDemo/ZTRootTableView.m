//
//  ZTRootTableView.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTRootTableView.h"
#import "BaseTableViewCell.h"
#import "ZTGDTViewController.h"
#import "ZTBUViewController.h"
#import "ZTGoogleViewController.h"

@implementation ZTRootTableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self data] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [BaseTableViewCell cellWithTableView:tableView Identifier:@"cell"];
    [[cell textLabel] setText:[[self data] objectAtIndex:[indexPath row]]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  // 当用户点击某个表格时调用
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *text = [[self data] objectAtIndex:[indexPath row]];
    
    if ([text isEqualToString:@"广点通"])
    {
        ZTGDTViewController *GDTVC = [[ZTGDTViewController alloc] init];
        [[[self viewController] navigationController] pushViewController:GDTVC animated:YES];
    }
    else if ([text isEqualToString:@"穿山甲"])
    {
        ZTBUViewController *BUVC = [[ZTBUViewController alloc] init];
        [[[self viewController] navigationController] pushViewController:BUVC animated:YES];
    }
    else if ([text isEqualToString:@"谷歌"])
    {
        ZTGoogleViewController *googleVC = [[ZTGoogleViewController alloc] init];
        [[[self viewController] navigationController] pushViewController:googleVC animated:YES];
    }
    
    return;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section // 设置分组头部视图的高度
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section  // 设置分组尾部视图的高度
{
    return CGFLOAT_MIN;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        [self setRowHeight:40];
        [self setData:[NSMutableArray arrayWithObjects:@"广点通", @"穿山甲", @"谷歌", nil]];
    }
    
    return self;
}

@end
