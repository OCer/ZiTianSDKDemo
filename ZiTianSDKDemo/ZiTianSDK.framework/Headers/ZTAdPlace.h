//
//  ZTAdPlace.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/12.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIView;

typedef enum : NSUInteger
{
    ZTAdTypeUnknown = 0,
    ZTAdTypeSplash,
    ZTAdTypeBanner,
    ZTAdTypeInterstitial,
    ZTAdTypeRewardedVideo,
    ZTAdTypeWall, // 暂不支持
    ZTAdTypeDraw  // 暂不支持
} ZTAdType;

@interface ZTAdPlace : NSObject // 广告位

@property(nonatomic, assign, readonly) ZTAdType type;        // 广告类型
@property(nonatomic, copy, readonly) NSString *positionName; // 广告位名字
@property(nonatomic, copy, readonly) NSString *placementID;  // 广告位ID

// 以下配置是可选的，并且只有支持的时候该设置才会生效
@property(nonatomic, assign) NSTimeInterval refresh;           // banner刷新时间，范围是15s-120s，默认是30s，如果为0则不刷新
@property(nonatomic, assign) NSTimeInterval timeInterval;      // 2次开屏间隔，默认是10s
@property(nonatomic, assign) NSUInteger dayLimit;              // 每日广告限制，默认是0，即无限制（仅计算广告展示成功次数，基于广告平台、广告类型、广告位名字和日期来计算）
@property(nonatomic, assign) NSTimeInterval fetchDelay;        // 开屏请求超时，默认是3s，最小是2s，最大是5s，非法值都会被替换回默认值
@property(nonatomic, assign) NSUInteger weight; // 广告权重，取值0-100，默认是0，即无权重；权重越大，优先级越高；非法值都会被替换回默认值；权重并不是总是生效的，只有一定的几率会使用权重，当使用权重的时候，权重高的优先显示出来
@property(nonatomic, assign, getter=isGps) BOOL gps;           // 开启GPS定位来获取相关位置的广告，默认关闭
@property(nonatomic, assign, getter=isTop) BOOL top;           // banner显示位置，默认是NO，即底部
@property(nonatomic, assign, getter=isVersion2) BOOL version2; // 2.0版本，目前只有广点通的banner、插屏支持；2.0和1.0的广告位不通用
@property(nonatomic, strong) UIView *bottomView;               // 开屏底部显示自定义view；需设置好高度，并保证高度不超屏幕的25%
@property(nonatomic, strong) UIView *skipView;                 // 开屏自定义跳过view；需设置好frame，并需要自己实现倒计时和点击事件

+ (instancetype)placeWithType:(ZTAdType)type placementID:(NSString *)placementID positionName:(NSString *)positionName;
- (instancetype)initWithType:(ZTAdType)type placementID:(NSString *)placementID positionName:(NSString *)positionName;

+ (BOOL)isEqualPlace:(ZTAdPlace *)place andOtherPlace:(ZTAdPlace *)otherPlace;
- (BOOL)isEqualPlace:(ZTAdPlace *)place;

+ (NSString *)getTypeStringWithType:(ZTAdType)type;
- (NSString *)getTypeString;

@end
