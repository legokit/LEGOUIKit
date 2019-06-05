//
//  LGNavigationView+StausBarClick.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/6/1.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "LGNavigationView+StausBarClick.h"
#import <objc/runtime.h>
#import "LGNavigation.h"

@interface LGNavigationView ()
@property (nonatomic, copy) stausbarClickCallback callback;
@property (nonatomic, assign) BOOL isPlaying;

@end
@implementation LGNavigationView (StausBarClick)

static const char stausbarClickBlockKey;
static const char stausbarClickPlayingKey;

- (stausbarClickCallback)callback {
    return objc_getAssociatedObject(self, &stausbarClickBlockKey);
}

- (void)setCallback:(stausbarClickCallback)callback {
    objc_setAssociatedObject(self, &stausbarClickBlockKey, callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)isPlaying {
    NSNumber *playing = objc_getAssociatedObject(self, &stausbarClickPlayingKey);
    return [playing boolValue];
}

- (void)setIsPlaying:(BOOL)isPlaying {
    objc_setAssociatedObject(self, &stausbarClickPlayingKey, @(isPlaying), OBJC_ASSOCIATION_ASSIGN);
}


- (void)addStausBarClickCallback:(stausbarClickCallback)callback {
    self.callback = callback;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    if (self.isPlaying) return;
    self.isPlaying = YES;
    CGFloat max_h = [UIApplication sharedApplication].statusBarFrame.size.height > 0 ? [UIApplication sharedApplication].statusBarFrame.size.height : (IS_IPHONE_X ? 44 : 20);
    if ([tap locationInView:self].y <= max_h) {
        !self.callback ? :self.callback();
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.isPlaying = NO;
    });
}



@end
