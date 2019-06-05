//
//  LGNavigationView.h
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGNavigationButton;

typedef void(^itemCallback)(__kindof UIView * _Nullable view);

NS_ASSUME_NONNULL_BEGIN

@interface LGNavigationView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) LGNavigationButton *leftButton;
@property (nonatomic, strong) LGNavigationButton *rightButton;

- (void)setTitle:(NSString *)title;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle;

@end

@interface LGNavigationButton : UIButton
@property (nonatomic, copy) itemCallback callback;
+ (instancetype)buttonWithTitle:(NSString *)title image:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
