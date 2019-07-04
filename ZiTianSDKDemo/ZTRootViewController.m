//
//  ZTRootViewController.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTRootViewController.h"
#import "ZTRootTableView.h"
#import <ZiTianSDK/ZTConfig.h>

@implementation ZTRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"ZiTianSDKDemo"];
    
    ZTRootTableView *tableView = [[ZTRootTableView alloc] initWithFrame:[[self view] bounds] style:UITableViewStyleGrouped];
    [[self view] addSubview:tableView];
    
    // 设置SDK的log级别
#ifdef DEBUG
    [ZTConfig setLogLevel:ZTLogLevelAll];
#else
    [ZTConfig setLogLevel:ZTLogLevelNone];
#endif
    
    NSLog(@"ZiTianSDK = V%@", [ZTConfig SDKVersion]);
    
    return;
}

@end
