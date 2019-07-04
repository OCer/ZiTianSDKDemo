//
//  ZTGDTTableView.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTGDTTableView.h"
#import "BaseTableViewCell.h"
#import <ZiTianSDK/ZTAdLoadTask.h>

@implementation ZTGDTTableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self data] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [BaseTableViewCell cellWithTableView:tableView Identifier:@"cell"];
    [[cell textLabel] setText:[[self data] objectAtIndex:[indexPath row]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  // 当用户点击某个表格时调用
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *text = [[self data] objectAtIndex:[indexPath row]];
    ZTAdType type = ZTAdTypeUnknown;
    NSString *positionName = nil;
    
    if ([text isEqualToString:@"插屏"])
    {
        type = ZTAdTypeInterstitial;
        positionName = @"interstitial";
    }
    else if ([text isEqualToString:@"插屏2.0"])
    {
        type = ZTAdTypeInterstitial;
        positionName = @"interstitial2";
    }
    else if ([text isEqualToString:@"banner"])
    {
        type = ZTAdTypeBanner;
        positionName = @"top";
    }
    else if ([text isEqualToString:@"banner2.0"])
    {
        type = ZTAdTypeBanner;
        positionName = @"bottom";
    }
    else if ([text isEqualToString:@"激励视频"])
    {
        type = ZTAdTypeRewardedVideo;
    }
    else if ([text isEqualToString:@"开屏"])
    {
        type = ZTAdTypeSplash;
        positionName = @"splash";
    }
    else if ([text isEqualToString:@"自定义开屏"])
    {
        type = ZTAdTypeSplash;
        positionName = @"splashDIY";
    }
    
    [[ZTAdLoadTask sharedManager] showAdWithAgent:ZTAdAgentTypeGDT type:type positionName:positionName showBlock:^(NSError *error) {
        if (error)
        {
            NSLog(@"广告显示失败 = %@", error);
        }
        else
        {
            NSLog(@"广告显示成功");
        }
    } dismissedBlock:^(BOOL isReward, BOOL isClicked) {
        NSLog(@"广告关闭 -- isReward = %d  isClicked = %d", isReward, isClicked);
    }];
    
    return;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section // 设置分组头部视图的高度
{
    return 60;
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
        [self setData:[NSMutableArray arrayWithObjects:@"插屏", @"插屏2.0", @"banner", @"banner2.0", @"激励视频", @"开屏", @"自定义开屏", nil]];
    }
    
    return self;
}

@end
