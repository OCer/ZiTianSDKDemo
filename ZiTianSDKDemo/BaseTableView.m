//
//  BaseTableView.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BaseTableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return NO;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        [self setDelegate:self];
        [self setDataSource:self];
        
        [self setEstimatedSectionFooterHeight:0];
        [self setEstimatedSectionHeaderHeight:0];
        
#ifdef __IPHONE_11_0
//        if (@available(iOS 11.0, *))
//        {
//            if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)])
//            {
//                [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
//                [self setEstimatedSectionFooterHeight:0];
//                [self setEstimatedSectionHeaderHeight:0];
//            }
//        }
#endif
    }
    
    return self;
}

- (UIViewController *)viewController
{
    for (UIView *next = [self superview]; next; next = [next superview])
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

@end
