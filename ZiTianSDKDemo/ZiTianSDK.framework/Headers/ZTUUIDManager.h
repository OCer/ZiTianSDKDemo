//
//  ZTUUIDManager.h
//  ZiTianSDK
//
//  Created by Cer on 2019/6/19.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTUUIDManager : NSObject

+ (instancetype)sharedManager;

- (NSString *)getUUID;

@end
