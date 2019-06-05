//
//  LGNavigationView+NavigationItem.h
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "LGNavigationView.h"


@interface LGNavigationView (NavigationItem)


/**
 添加自定义view，不更改布局信息
 */
- (UIView *)addCustomView:(__kindof UIView *)customView
            clickCallBack:(itemCallback)callback;

/**
 添加titleView，内部自动适配 iPhone X
 */
- (void)addTitleView:(UIView *)titleView;

/**
 添加左部按钮
 */
- (LGNavigationButton *)addLeftButtonWithTitle:(NSString *)title
                                 clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addLeftButtonWithTitle:(NSString *)title
                                         image:(UIImage *)image
                                 clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addLeftButtonWithImage:(UIImage *)image
                                 clickCallBack:(itemCallback)callback;

/**
 添加右部按钮
 */
- (LGNavigationButton *)addRightButtonWithTitle:(NSString *)title
                                  clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addRightButtonWithTitle:(NSString *)title
                                          image:(UIImage *)image
                                  clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addRightButtonWithImage:(UIImage *)image
                                  clickCallBack:(itemCallback)callback;



@end

