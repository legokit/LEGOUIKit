


//
//  LEGONavigationController.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/5/31.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "LGNavigationController.h"

@interface LGNavigationController ()


@end

@implementation LGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = NO;
    self.navigationBar.hidden = YES;
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarChangeNoti:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]  removeObserver:self name:UIApplicationWillChangeStatusBarFrameNotification object:nil];
    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
}

- (void)statusBarChangeNoti:(NSNotification *)notifycation {
    
    [self setNeedsStatusBarAppearanceUpdate];
    LGNavigationView *navigationView = (LGNavigationView *)self.topViewController.navigationView;
    if (!navigationView) return ;
    
    if (navigationView.frame.size.width != self.topViewController.view.frame.size.width) {
        navigationView.frame = CGRectMake(0, 0, self.topViewController.view.frame.size.width , NavigationHeight);
    }
    
    UIDevice *device = [UIDevice currentDevice] ;
    if (device.orientation == UIDeviceOrientationPortrait || device.orientation == UIDeviceOrientationPortraitUpsideDown) {
        if (navigationView.leftButton && IS_IPHONE_X) {
            LGNavigationButton *leftButton = navigationView.leftButton;
            leftButton.frame = CGRectMake(leftButton.frame.origin.x + 20, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        }
    }
    else if (device.orientation == UIDeviceOrientationLandscapeLeft || device.orientation == UIDeviceOrientationLandscapeRight) {
        if (navigationView.rightButton && IS_IPHONE_X) {
            LGNavigationButton *rightButton = navigationView.rightButton;
            rightButton.frame = CGRectMake(rightButton.frame.origin.x - 20, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        }
    }
    else{
        
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0 ) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
//        // 屏蔽调用rootViewController的滑动返回手势
//        if (self.viewControllers.count<=1||self.visibleViewController==self.viewControllers.firstObject) {
//            return NO;
//        }
//    }
//    return YES;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


