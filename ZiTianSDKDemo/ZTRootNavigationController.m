//
//  ZTRootNavigationController.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "ZTRootNavigationController.h"

@implementation ZTRootNavigationController

- (BOOL)shouldAutorotate
{
    return [[self visibleViewController] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [[self visibleViewController] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self visibleViewController] preferredInterfaceOrientationForPresentation];
}

- (BOOL)prefersStatusBarHidden
{
    return [[self visibleViewController] prefersStatusBarHidden];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [[self visibleViewController] preferredStatusBarStyle];
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return [[self visibleViewController] preferredStatusBarUpdateAnimation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setToolbarHidden:YES animated:NO];
    
    return;
}

@end
