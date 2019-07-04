//
//  ZTGoogleViewController.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTGoogleViewController.h"
#import "ZTGoogleTableView.h"
#import <ZiTianSDK/ZTAdLoadTask.h>

@interface ZTGoogleViewController ()

@end

@implementation ZTGoogleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"谷歌"];
    
    ZTGoogleTableView *tableView = [[ZTGoogleTableView alloc] initWithFrame:[[self view] bounds] style:UITableViewStyleGrouped];
    [[self view] addSubview:tableView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ZTAdSource *source_Google = [ZTAdSource sourceWithAgent:ZTAdAgentTypeGoogle appID:@"ca-app-pub-3940256099942544~1458002511" appKey:nil];
        
        ZTAdPlace *rewardedVideoPlace_Google = [ZTAdPlace placeWithType:ZTAdTypeRewardedVideo placementID:@"ca-app-pub-3940256099942544/1712485313" positionName:nil];
        ZTAdPlace *interstitialPlace_Google = [ZTAdPlace placeWithType:ZTAdTypeInterstitial placementID:@"ca-app-pub-3940256099942544/4411468910" positionName:nil];
        ZTAdPlace *bannerPlace_Google = [ZTAdPlace placeWithType:ZTAdTypeBanner placementID:@"ca-app-pub-3940256099942544/2934735716" positionName:nil];
        
        ZTAdLoadTask *task = [ZTAdLoadTask sharedManager];
        [task loadPlace:rewardedVideoPlace_Google withAgent:ZTAdAgentTypeGoogle];
        [task loadPlace:interstitialPlace_Google withAgent:ZTAdAgentTypeGoogle];
        [task loadPlace:bannerPlace_Google withAgent:ZTAdAgentTypeGoogle];
        [task loadSource:source_Google];
    });
    
    return;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[ZTAdLoadTask sharedManager] closeAllBannerWithAgent:ZTAdAgentTypeAll];
    
    return;
}

@end
