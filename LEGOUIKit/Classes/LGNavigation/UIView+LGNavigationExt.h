//
//  UIView+LGNavigationExt.h
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LGNavigationExt)

/**
 * 获取当前view所在的控制器
 */
- (UIViewController *)currentViewController;

/**
 * addSubview之后的回调
 */
@property (nonatomic, copy) void(^didAddsubView)(UIView *view);

@end

NS_ASSUME_NONNULL_END
