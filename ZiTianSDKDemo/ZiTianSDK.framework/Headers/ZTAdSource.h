//
//  ZTAdSource.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/10.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger
{
    ZTAdAgentTypeAll = 0, // 所有可用的平台，如果是加载广告，则随机出现
    ZTAdAgentTypeGDT,
    ZTAdAgentTypeBUD,
    ZTAdAgentTypeGoogle,
    ZTAdAgentTypeOneWay  // 不再支持
} ZTAdAgentType; // 广告平台

@interface ZTAdSource : NSObject // 广告平台

@property(nonatomic, assign, readonly) ZTAdAgentType agent; // 广告平台
@property(nonatomic, copy, readonly) NSString *appID;       // 平台分配的ID
@property(nonatomic, copy, readonly) NSString *appKey;      // 平台分配的key

+ (instancetype)sourceWithAgent:(ZTAdAgentType)agent appID:(NSString *)appID appKey:(NSString *)appKey;
- (instancetype)initWithAgent:(ZTAdAgentType)agent appID:(NSString *)appID appKey:(NSString *)appKey;

+ (BOOL)isEqualSource:(ZTAdSource *)source andOtherSource:(ZTAdSource *)otherSource;
- (BOOL)isEqualSource:(ZTAdSource *)source;

+ (NSString *)getAgentStringWithAgentType:(ZTAdAgentType)agent;
- (NSString *)getAgentString;

@end
