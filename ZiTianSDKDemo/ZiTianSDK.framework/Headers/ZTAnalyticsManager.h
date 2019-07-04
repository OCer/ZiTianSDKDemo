//
//  ZTAnalyticsManager.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/10.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTAnalyticsManager : NSObject

+ (void)setUpWithAppKey:(NSString *)appKey channel:(NSString *)channel scenarioType:(NSUInteger)scenarioType;
+ (void)profileSignIn:(NSString *)uid; // 账号登录
+ (void)profileSignIn:(NSString *)uid provider:(NSString *)provider;
+ (void)profileSignOff; // 账号登出
+ (void)setPlayerLevel:(int)level; // 等级统计
+ (void)pay:(int)money coin:(double)coin payType:(NSString *)payType; //  真实消费统计，统计用户在游戏内的付费，包括购买虚拟币，道具等
+ (void)pay:(int)money item:(NSString *)item number:(int)number price:(double)price payType:(NSString *)payType; // 真实消费统计，充值并购买道具
+ (void)buy:(NSString *)item number:(int)number price:(double)price; // 虚拟消费统计,比如用金币购买某个道具
+ (void)use:(NSString *)item number:(int)number price:(double)price; // 物品消耗统计
+ (void)bonus:(double)coin trigger:(int)trigger; // 额外奖励  赠送虚拟币
+ (void)bonus:(NSString *)item number:(int)number price:(double)price trigger:(int)trigger; // 额外奖励  赠送道具
+ (void)startLevel:(NSString *)level; // 关卡统计  开始关卡
+ (void)finishLevel:(NSString *)level score:(NSString *)score; // 关卡统计  闯关成功
+ (void)failLevel:(NSString *)level score:(NSString *)score; // 关卡统计  闯关失败
+ (void)event:(NSString *)eventId; // 事件统计--计数事件
+ (void)event:(NSString *)eventId label:(NSString *)label;
+ (void)event:(NSString *)eventId attributes:(NSDictionary<NSString *, NSString *> *)attributes; // 事件统计--计数事件  统计点击行为各属性被触发的次数
+ (void)event:(NSString *)eventId attributes:(NSDictionary<NSString *, NSString *> *)attributes duration:(int)duration; // 事件统计--计算事件  统计数值型变量的值的分布

@end
