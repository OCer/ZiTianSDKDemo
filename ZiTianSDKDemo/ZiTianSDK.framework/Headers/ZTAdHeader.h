//
//  ZTAdHeader.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/17.
//  Copyright © 2019 Cer. All rights reserved.
//

#ifndef ZTAdHeader_h
#define ZTAdHeader_h

typedef enum : NSUInteger
{
    ZTAdShowErrorCodeFailed = 0, // 显示失败，可能是网络问题等
    ZTAdShowErrorCodeNotReady,   // 没有加载好的广告
    ZTAdShowErrorCodeDayLimit,   // 每日广告限制
    ZTAdShowErrorCodeTime,       // 广告显示间隔限制
    ZTAdShowErrorCodeValid,      // 广告已过期
    ZTAdShowErrorCodeConfig      // 广告配置有问题
} ZTAdShowErrorCode; // 显示失败的原因类型

typedef void (^ZTAdShowBlock)(NSError *error);     // 广告显示回调，error为nil时是显示成功
typedef void (^ZTAdDismissedBlock)(BOOL isReward, BOOL isClicked); // 广告关闭回调，isReward为YES时是有奖励；isClicked为YES时是点击过广告

#endif /* ZTAdHeader_h */
