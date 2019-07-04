//
//  ZTBUViewController.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTBUViewController.h"
#import "ZTBUTableView.h"
#import <ZiTianSDK/ZTAdLoadTask.h>

@interface ZTBUViewController ()

@end

@implementation ZTBUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"穿山甲"];
    
    ZTBUTableView *tableView = [[ZTBUTableView alloc] initWithFrame:[[self view] bounds] style:UITableViewStyleGrouped];
    [[self view] addSubview:tableView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ZTAdSource *source_BUD = [ZTAdSource sourceWithAgent:ZTAdAgentTypeBUD appID:@"5000546" appKey:nil];
        
        ZTAdPlace *rewardedVideoPlace_BUD = [ZTAdPlace placeWithType:ZTAdTypeRewardedVideo placementID:@"900546421" positionName:nil];
        ZTAdPlace *interstitialPlace_BUD = [ZTAdPlace placeWithType:ZTAdTypeInterstitial placementID:@"900546957" positionName:nil];
        ZTAdPlace *bannerPlace_BUD = [ZTAdPlace placeWithType:ZTAdTypeBanner placementID:@"900546859" positionName:nil];
        ZTAdPlace *splashPlace_BUD = [ZTAdPlace placeWithType:ZTAdTypeSplash placementID:@"800546808" positionName:nil];
        
        ZTAdLoadTask *task = [ZTAdLoadTask sharedManager];
        [task loadPlace:rewardedVideoPlace_BUD withAgent:ZTAdAgentTypeBUD];
        [task loadPlace:interstitialPlace_BUD withAgent:ZTAdAgentTypeBUD];
        [task loadPlace:bannerPlace_BUD withAgent:ZTAdAgentTypeBUD];
        [task loadPlace:splashPlace_BUD withAgent:ZTAdAgentTypeBUD];
        [task loadSource:source_BUD];
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
