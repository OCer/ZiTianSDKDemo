//
//  AppDelegate.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "AppDelegate.h"
#import "ZTRootNavigationController.h"
#import "ZTRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] init];
    [self setWindow:window];
    [window setFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor whiteColor]];
    
//    // 统一设置UINavigationBar颜色
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBackgroundImage:[Tools getLinearGradientImage:kRGB255(107, 127, 255) and:kRGB255(145, 62, 245) directionType:ZTLinearGradientDirectionLevel option:CGSizeMake(kScreenWidth, kNavigationBarHeight)] forBarMetrics:UIBarMetricsDefault];
//    [bar setTintColor:[UIColor whiteColor]]; // 设置按钮的颜色
//    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}]; // 设置标题颜色
//    [bar setBarTintColor:[UIColor whiteColor]]; // UINavigationBar颜色
    
    ZTRootViewController *root = [[ZTRootViewController alloc] init];
    ZTRootNavigationController *rootNav = [[ZTRootNavigationController alloc] initWithRootViewController:root];
    [window setRootViewController:rootNav];
    [window makeKeyAndVisible];
    return YES;
}

@end
