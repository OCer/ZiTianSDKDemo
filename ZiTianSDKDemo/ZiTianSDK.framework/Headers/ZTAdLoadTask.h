//
//  ZTAdLoadTask.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/12.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZTAdPlace.h"
#import "ZTAdSource.h"
#import "ZTAdHeader.h"

@interface ZTAdLoadTask : NSObject

/**
 是否启用广告，默认是启用；当禁用的时候会关闭所有已打开的广告（不会走dismissedBlock回调），停止重新请求之前的失败预加载（转为启用时会马上去请求），但是不会清空配置和预加载
 */
@property(nonatomic, assign, getter=isEnable) BOOL enable;

+ (instancetype)sharedManager;

/**
 加载广告平台

 @param source 平台对象；appID和appKey一致就会认为是同一个source对象
 @return 新加载平台，返回YES；如果已存在该平台，并且新加载的平台与旧平台不一致则认为是更新，会清空该平台之前的所有配置和广告，返回YES；如果是同一个source对象，不做处理，返回NO
 */
- (BOOL)loadSource:(ZTAdSource *)source;

/**
 加载广告位配置

 @param place 配置对象；type和positionName一致就会认为是同一个配置对象
 @param agent 平台
 @return 新加载配置，返回YES；如果已存在该配置，并且新配置的placementID与旧配置的不一样，则新配置会替换旧配置，并且清空之前该配置的广告，返回YES；如果完全相同，则不做任何处理，直接忽略掉，返回NO（所以在不修改配置的情况下修改ZTAdPlace里的参数，需要自己把place保存起来，而不是创建一个新对象去加载）
 */
- (BOOL)loadPlace:(ZTAdPlace *)place withAgent:(ZTAdAgentType)agent;

/**
 显示广告

 @param agent 平台；如果为ZTAdAgentTypeAll，则从所有已加载的平台随机取一个
 @param type 广告类型；如果为ZTAdTypeUnknown，则从所有类型随机选一个
 @param positionName 广告位名称；如果为nil则匹配任何广告位名称
 @param showBlock 显示回调，每个广告只会调一次；banner也只是第一次回回调，后续自动刷新的banner不回调；如果是配置改变等原因，则无回调
 @param dismissedBlock 关闭回调，每个广告只会调一次；banner不回调；如果因为配置改变等原因导致的非正常关闭，则无回调
 */
- (void)showAdWithAgent:(ZTAdAgentType)agent type:(ZTAdType)type positionName:(NSString *)positionName showBlock:(ZTAdShowBlock)showBlock dismissedBlock:(ZTAdDismissedBlock)dismissedBlock;

/**
 关闭一个正在显示的广告；调用该方法关闭广告会导致dismissedBlock不触发

 @param agent 平台；如果为ZTAdAgentTypeAll，则从所有已加载的平台随机取一个
 @param type 广告类型；如果为ZTAdTypeUnknown，则从所有类型随机选一个
 @param positionName 广告位名称；如果为nil则匹配任何广告位名称
 */
- (void)closeAdWithAgent:(ZTAdAgentType)agent type:(ZTAdType)type positionName:(NSString *)positionName;

/**
 关闭所有正在显示的广告；调用该方法关闭广告会导致dismissedBlock不触发
 @param agent 平台；如果为ZTAdAgentTypeAll，则关闭所有已加载的平台广告
 */
- (void)closeAllAdWithAgent:(ZTAdAgentType)agent;

/**
 关闭所有已打开的banner
 @param agent 平台；如果为ZTAdAgentTypeAll，则关闭所有已加载的平台banner广告
 */
- (void)closeAllBannerWithAgent:(ZTAdAgentType)agent;

@end

// 初始化SDK和广告位
// 更新配置
// 预加载广告 -- 带数量
// 广告回调
// 广告显示失败原因
// 广告过期处理（表现为展示失败）
// 广告间隔（频率，不能一直加载）
// 开启GPS定位，默认关闭。
// 开屏增加logo显示 bottomView
// 自定义开屏跳过按钮
// 广告请求超时 fetchDelay
// 关闭一个广告 -- 类型
// 关闭所有广告 -- 类型
// 关闭打开的广告
// banner刷新
// 退出控制器或删除view导致广告被删除的问题 -- 需要手动关闭（banner打开后，如果有自动刷新就会一直自动刷新，需要手动关闭）
// 每日广告限制
// 广告权重（权重并不是总是生效的，只有一定的几率会使用权重，当使用权重的时候，权重高的优先显示出来）

// 视频配置（暂时用不上）
// 增加广告支持类型
// 增加原生广告的支持
// 更新SDK版本 增加新版支持
