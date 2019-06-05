#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "LEGOUIKit.h"
#import "UIColor+HYDColor.h"
#import "UIImage+BigBitEditer.h"
#import "UIImage+Exif.h"
#import "UIImage+fixOrientation.h"
#import "UIImage+Rotate.h"
#import "UIImage+shareAdjust.h"
#import "LGNavigation.h"
#import "LGNavigationController.h"
#import "LGNavigationUtils.h"
#import "LGNavigationView+NavigationItem.h"
#import "LGNavigationView+StausBarClick.h"
#import "LGNavigationView.h"
#import "UIView+LGNavigationExt.h"
#import "UIViewController+LBNavigationView.h"

FOUNDATION_EXPORT double LEGOUIKitVersionNumber;
FOUNDATION_EXPORT const unsigned char LEGOUIKitVersionString[];

