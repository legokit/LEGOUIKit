//
//  UIViewController+LBNavigationView.h
//  FilmCamera
//
//  Created by 杨庆人 on 2019/5/31.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGNavigation.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LBNavigationView)
/**
 * 当前的导航条（首次调用该 getter 方法则添加到当前 ViewController）
 */
@property (nonatomic, strong) LGNavigationView *navigationView;


/**
 * 当前控制器 是否 禁止侧滑返回
 */
@property (nonatomic, assign) BOOL disableSlidingBackGesture;


@end

NS_ASSUME_NONNULL_END
