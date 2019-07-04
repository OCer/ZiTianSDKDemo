//
//  ZTGDTViewController.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTGDTViewController.h"
#import "ZTGDTTableView.h"
#import <ZiTianSDK/ZTAdLoadTask.h>

@interface ZTGDTViewController ()

@end

@implementation ZTGDTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"广点通"];
    
    ZTGDTTableView *tableView = [[ZTGDTTableView alloc] initWithFrame:[[self view] bounds] style:UITableViewStyleGrouped];
    [[self view] addSubview:tableView];
    
    // 自定义底部view
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake(50, 50, 100, 100)];
    [imageView setImage:[UIImage imageNamed:@"user"]];
    UIView *logo = [[UIView alloc] init];
    [logo setBackgroundColor:[UIColor whiteColor]];
    [logo setFrame:CGRectMake(0, 0, 0, 150)];
    [logo addSubview:imageView];
    
    // 自定义跳过按钮
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [skipButton setTitle:@"跳过" forState:UIControlStateNormal];
    [skipButton setBackgroundColor:[UIColor purpleColor]];
    [skipButton setShowsTouchWhenHighlighted:YES];
    [skipButton setFrame:CGRectMake(100, 100, 100, 50)];
    [skipButton addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 加载广告数据（并不需要每次都初始化，可以放到AppDelegate里只初始化一次）
        ZTAdSource *source_GDT = [ZTAdSource sourceWithAgent:ZTAdAgentTypeGDT appID:@"1105344611" appKey:nil];
        
        ZTAdPlace *rewardedVideoPlace_GDT = [ZTAdPlace placeWithType:ZTAdTypeRewardedVideo placementID:@"8020744212936426" positionName:nil];
        ZTAdPlace *interstitialPlace_GDT = [ZTAdPlace placeWithType:ZTAdTypeInterstitial placementID:@"2030814134092814" positionName:@"interstitial"];
        ZTAdPlace *interstitialPlace_GDT_2 = [ZTAdPlace placeWithType:ZTAdTypeInterstitial placementID:@"1050652855580392" positionName:@"interstitial2"];
        [interstitialPlace_GDT_2 setVersion2:YES];
        ZTAdPlace *bannerPlace1_GDT = [ZTAdPlace placeWithType:ZTAdTypeBanner placementID:@"4090812164690039" positionName:@"top"];
        [bannerPlace1_GDT setTop:YES];
        ZTAdPlace *bannerPlace2_GDT = [ZTAdPlace placeWithType:ZTAdTypeBanner placementID:@"1080958885885321" positionName:@"bottom"];
        [bannerPlace2_GDT setVersion2:YES];
        [bannerPlace2_GDT setDayLimit:3000];
        ZTAdPlace *splashPlace1_GDT = [ZTAdPlace placeWithType:ZTAdTypeSplash placementID:@"9040714184494018" positionName:@"splash"];
        [splashPlace1_GDT setFetchDelay:5];
        ZTAdPlace *splashPlace2_GDT = [ZTAdPlace placeWithType:ZTAdTypeSplash placementID:@"9040714184494018" positionName:@"splashDIY"];
        [splashPlace2_GDT setFetchDelay:5];
        [splashPlace2_GDT setBottomView:logo];
        [splashPlace2_GDT setSkipView:skipButton];
        
        ZTAdLoadTask *task = [ZTAdLoadTask sharedManager];
        [task loadPlace:rewardedVideoPlace_GDT withAgent:ZTAdAgentTypeGDT];
        [task loadPlace:interstitialPlace_GDT withAgent:ZTAdAgentTypeGDT];
        [task loadPlace:interstitialPlace_GDT_2 withAgent:ZTAdAgentTypeGDT];
        [task loadPlace:bannerPlace1_GDT withAgent:ZTAdAgentTypeGDT];
        [task loadPlace:bannerPlace2_GDT withAgent:ZTAdAgentTypeGDT];
        [task loadPlace:splashPlace1_GDT withAgent:ZTAdAgentTypeGDT];
        [task loadPlace:splashPlace2_GDT withAgent:ZTAdAgentTypeGDT];
        [task loadSource:source_GDT];
    });
    
    return;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[ZTAdLoadTask sharedManager] closeAllBannerWithAgent:ZTAdAgentTypeAll]; // 退出的时候需要关闭banner
    
    return;
}

- (void)skip
{
    NSLog(@"点击跳过按钮");
    
    return;
}

@end
