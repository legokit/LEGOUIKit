//
//  LGNavigationView.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "LGNavigationView.h"
#import "LGNavigation.h"
#import <Masonry/Masonry.h>

@interface LGNavigationView ()
@property (nonatomic, weak) UIViewController *viewController;
@end
@implementation LGNavigationView

- (UILabel *)titleLabel
{
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel ;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:self.titleLabel];
        CGFloat button_h = NavigationHeightWithoutMargan;
        CGFloat y = NavigationMargan;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo(button_h);
            make.top.offset(y);
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutNavigationSubViews];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    __weak typeof(self)weakSelf = self;
    self.viewController.view.didAddsubView = ^(UIView *view) {
        if (![view isEqual:weakSelf]) {
            [weakSelf.viewController.view bringSubviewToFront:weakSelf];
        }
    };
    self.didAddsubView = ^(UIView *view) {
        [weakSelf bringSubviewToFront:weakSelf.titleLabel];
        if (weakSelf.titleView) {
            [weakSelf bringSubviewToFront:weakSelf.titleView];
        }
    };
}

- (UIViewController *)viewController
{
    if (nil == _viewController) {
        _viewController = [self currentViewController] ;
        if (nil == _viewController) {
        }
    }
    return _viewController ;
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


- (void)layoutNavigationSubViews {
    if (self.titleLabel && self.titleLabel.superview) {
        CGFloat button_h = NavigationHeightWithoutMargan;
        CGFloat y = NavigationMargan;
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo(button_h);
            make.top.offset(y);
        }];
    }
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle {
    self.titleLabel.attributedText = attributedTitle;
}

@end


@implementation LGNavigationButton

+ (instancetype)buttonWithTitle:(NSString *)title image:(UIImage *)image {
    LGNavigationButton *button  = [LGNavigationButton buttonWithType:UIButtonTypeCustom];
    UIFont *font = [UIFont systemFontOfSize:16];
    CGFloat button_w = 0;
    CGFloat button_h = NavigationHeightWithoutMargan;
    CGFloat y = NavigationMargan;
    if (image) {
        CGFloat imageHeight = button_h;
        button_w += imageHeight;
    }
    if (title) {
        CGFloat title_w = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}].width;
        button_w += title_w ;
    }
    [button setFrame:CGRectMake(0, y, button_w, button_h)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return button ;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(highlightButtonDidBeTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(highlightButtonDidBeTouchUpInside:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
    }
    return self;
}

- (void)highlightButtonDidBeTouchDown:(UIButton *)button {
    self.alpha = 0.3f;
}

- (void)highlightButtonDidBeTouchUpInside:(UIButton *)button {
    self.alpha = 1;
}


- (void)setHighlighted:(BOOL)highlighted {
    if (self.selected) {
        [super setHighlighted:NO];
    }
    else {
        [super setHighlighted:highlighted];
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    bounds = CGRectMake(self.bounds.origin.x - 20, self.bounds.origin.y - 10, self.bounds.size.width + 2 * 20, self.bounds.size.height + 2 * 10);
    return CGRectContainsPoint(bounds, point);
}

@end

