//
//  UIViewController+LBNavigationView.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/5/31.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "UIViewController+LBNavigationView.h"
#import <objc/runtime.h>

@implementation UIViewController (LBNavigationView)

@dynamic navigationView;

- (LGNavigationView *)navigationView {
    LGNavigationView *navView = objc_getAssociatedObject(self, _cmd);
    if (nil == navView) {
        navView = [[LGNavigationView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , NavigationHeight)];
        
        if (!self.navigationController) {
            NSAssert(NO, @"attention: this controller's navigationcontroller is null: %@",self);
        }
        
        [self willChangeValueForKey:NSStringFromClass([LGNavigationView class])];
        objc_setAssociatedObject(self, @selector(navigationView), navView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:NSStringFromClass([LGNavigationView class])];
        [self.view addSubview:navView];
    }
    return navView;
}

- (BOOL)disableSlidingBackGesture {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setDisableSlidingBackGesture:(BOOL)disableSlidingBackGesture {
    objc_setAssociatedObject(self, @selector(disableSlidingBackGesture), @(disableSlidingBackGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self dealSlidingGestureDelegate];
}

- (void)dealSlidingGestureDelegate {
    LGNavigationController *navController = (LGNavigationController *)self.navigationController ;
    if (nil == navController) {
        return ;
    }
    if (navController.interactivePopGestureRecognizer.delegate != navController) {
        navController.interactivePopGestureRecognizer.delegate = navController ;
    }
    if (!navController.interactivePopGestureRecognizer.enabled) {
        navController.interactivePopGestureRecognizer.enabled = YES ;
    }
}

@end
