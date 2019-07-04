//
//  BaseDetailViewController.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "BaseDetailViewController.h"

@implementation BaseDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backController"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [[self navigationItem] setLeftBarButtonItem:item animated:NO];
    [[[self navigationController] interactivePopGestureRecognizer] setDelegate:nil]; 
    
    return;
}

- (void)back
{
    [[self navigationController] popViewControllerAnimated:YES];
    
    return;
}

- (BOOL)hidesBottomBarWhenPushed
{
    if([[self navigationController] visibleViewController] != [[[self navigationController] viewControllers] firstObject])
    {
        return YES;
    }

    return NO;
}

@end
