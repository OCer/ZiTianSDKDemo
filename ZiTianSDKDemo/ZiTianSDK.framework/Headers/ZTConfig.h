//
//  ZTConfig.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/10.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZTDefine.h"

@interface ZTConfig : NSObject

+ (void)setLogLevel:(ZTLogLevel)logLevel;      // 设置控制台log级别
+ (void)logViewShowOrHidden:(BOOL)isShow;      // 显示/隐藏logView
+ (BOOL)isShowLogView;                         // logView的显示状态
+ (BOOL)logViewIsAvailable;                    // logView的可用状态
+ (void)setLogViewAvailable:(BOOL)isAvailable; // 设置logView的可用状态
+ (void)logViewClear;                          // logView清空log
+ (NSString *)SDKVersion;

@end
