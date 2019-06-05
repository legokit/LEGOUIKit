//
//  LGNavigationUtils.h
//  FilmCamera
//
//  Created by 杨庆人 on 2019/5/31.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#ifndef LGNavigationUtils_h
#define LGNavigationUtils_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


#define NavigationMargan (IS_IPHONE_X ? 40.0 : 0)

#define NavigationHeightWithoutMargan (IS_IPHONE_X ? 70 : 64)

#define NavigationHeight (NavigationMargan + NavigationHeightWithoutMargan)




#endif /* LGNavigationUtils_h */
