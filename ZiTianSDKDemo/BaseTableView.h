//
//  BaseTableView.h
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView

@property(nonatomic, strong) NSMutableArray *data;

- (UIViewController *)viewController;

@end
