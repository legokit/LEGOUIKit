//
//  UIView+LGNavigationExt.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "UIView+LGNavigationExt.h"
#import <objc/runtime.h>

@implementation UIView (LGNavigationExt)

- (void (^)(UIView *))didAddsubView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDidAddsubView:(void (^)(UIView *))didAddsubView {
    objc_setAssociatedObject(self, @selector(didAddsubView), didAddsubView, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //方法交换。当有视图加到这个view上时，得到通知
        Class viewClass = [UIView class];
        
        SEL originalSelector = @selector(addSubview:);
        SEL swizzledSelector = @selector(easyAddSubview:);
        
        Method originalMethod = class_getInstanceMethod(viewClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(viewClass, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(viewClass,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(viewClass,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


- (void)easyAddSubview:(UIView *)view {
    [self easyAddSubview:view];
    if (self.didAddsubView) {
        self.didAddsubView(view);
    }
}


- (UIViewController *)currentViewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return [self topViewController];
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


@end
