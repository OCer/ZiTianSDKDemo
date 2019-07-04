//
//  ZTCrashManager.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/10.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTCrashManager : NSObject

+ (void)setUpWithAppKey:(NSString *)appKey channel:(NSString *)channel;


/**
 自定义标签，用于标明App的某个“场景”。在发生Crash时会显示该Crash所在的“场景”。

 @param tag 标签，以最后设置的标签为准，标签id需大于0。
 */
+ (void)setUserSceneTag:(int)tag;

/**
 * 上报自定义错误
 *
 * @param category  错误的分类
 * @param type      错误类型的名称
 * @param msg       错误原因
 * @param traceback 错误堆栈
 */
+ (void)reportException:(int)category type:(NSString *)type msg:(NSString *)msg traceback:(NSString *)traceback;

/**
 * 上报自定义错误
 *
 * @param category  错误的分类
 * @param type      错误类型的名称
 * @param msg       错误原因
 * @param traceback 错误堆栈
 * @param quitProgram 退出程序
 */
+ (void)reportException:(int)category type:(NSString *)type msg:(NSString *)msg traceback:(NSString *)traceback quitProgram:(BOOL)quitProgram;

@end
