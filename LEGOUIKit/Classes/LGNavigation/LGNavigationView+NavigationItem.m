//
//  LGNavigationView+NavigationItem.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "LGNavigationView+NavigationItem.h"
#import <objc/runtime.h>
#import "LGNavigation.h"
#import <Masonry/Masonry.h>

#define tag_num(n) (n + 1000)

typedef NS_ENUM(NSInteger, NavigationItemPlaceType) {
    ItemPlaceTypeLeft,
    ItemPlaceTypeRight
};
@interface LGNavigationView ()
@property (nonatomic, strong) NSMutableDictionary *callbackDic;
@end

@implementation LGNavigationView (NavigationItem)

static const char kCallbackDic;

- (NSMutableDictionary *)callbackDic {
    return objc_getAssociatedObject(self, &kCallbackDic);
}

- (void)setCallbackDic:(NSMutableDictionary *)callbackDic {
    objc_setAssociatedObject(self, &kCallbackDic, callbackDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (__kindof UIView *)addCustomView:(__kindof UIView *)customView
                     clickCallBack:(itemCallback)callback {
    customView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
    [customView addGestureRecognizer:tap];
    [self addSubview:customView];

    if (callback) {
        if (self.callbackDic == nil) {
            self.callbackDic = [[NSMutableDictionary alloc] init];
        }
        customView.tag = tag_num(self.callbackDic.allKeys.count);
        [self.callbackDic setObject:[callback copy] forKey:@(customView.tag)];
    }

    return customView;
}

- (void)addTitleView:(UIView *)titleView {
    [self addSubview:titleView];
    CGFloat button_h = NavigationHeightWithoutMargan;
    CGFloat y = NavigationMargan;
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(button_h);
        make.top.offset(y);
    }];
    self.titleView = titleView;
}

- (LGNavigationButton *)addLeftButtonWithTitle:(NSString *)title
                                 clickCallBack:(itemCallback)callback {
    return [self createButtonWithTitle:title image:nil placeType:ItemPlaceTypeLeft callback:callback];
}

- (LGNavigationButton *)addLeftButtonWithTitle:(NSString *)title
                                         image:(UIImage *)image
                                 clickCallBack:(itemCallback)callback {
    return [self createButtonWithTitle:title image:image placeType:ItemPlaceTypeLeft callback:callback];
}

- (LGNavigationButton *)addLeftButtonWithImage:(UIImage *)image
                                 clickCallBack:(itemCallback)callback {
    return [self createButtonWithTitle:nil image:image placeType:ItemPlaceTypeLeft callback:callback];
}

- (LGNavigationButton *)addRightButtonWithTitle:(NSString *)title
                                  clickCallBack:(itemCallback)callback {
    return [self createButtonWithTitle:title image:nil placeType:ItemPlaceTypeRight callback:callback];
}

- (LGNavigationButton *)addRightButtonWithTitle:(NSString *)title
                                          image:(UIImage *)image
                                  clickCallBack:(itemCallback)callback {
    return [self createButtonWithTitle:title image:image placeType:ItemPlaceTypeRight callback:callback];
}

- (LGNavigationButton *)addRightButtonWithImage:(UIImage *)image
                                  clickCallBack:(itemCallback)callback {
    return [self createButtonWithTitle:nil image:image placeType:ItemPlaceTypeRight callback:callback];
}

- (LGNavigationButton *)createButtonWithTitle:(NSString *)title
                                        image:(UIImage *)image
                                    placeType:(NavigationItemPlaceType)placeType
                                     callback:(itemCallback)callback {
    LGNavigationButton *button = [LGNavigationButton buttonWithTitle:title image:image];
    if (ItemPlaceTypeLeft == placeType) {
        if (self.leftButton) {
            [self.leftButton removeFromSuperview];
        }
        CGFloat x = 0;
        if (image && !title) {
            x = -7.5;  // back，close
        }
        button.frame = CGRectMake(x, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
        self.leftButton = button;
    }
    else if (ItemPlaceTypeRight == placeType) {
        if (self.rightButton) {
            [self.rightButton removeFromSuperview];
        }
        button.frame = CGRectMake(self.bounds.size.width - button.frame.size.width, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
        self.rightButton = button;
    }
    button.callback = callback;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

- (void)buttonClick:(LGNavigationButton *)sender {
    !sender.callback ? :sender.callback(sender);
}

- (void)viewClick:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    if (self.callbackDic == nil) {
        self.callbackDic = [[NSMutableDictionary alloc] init];
    }
    itemCallback callback = self.callbackDic[@(view.tag)];
    !callback ? :callback(view);
}

@end
