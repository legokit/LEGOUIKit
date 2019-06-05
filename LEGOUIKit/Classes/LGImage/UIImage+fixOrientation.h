//
//  UIImage+fixOrientation.h
//
//  Created by 黄亚栋 on 2017/11/8.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef enum{
    shotOriginal = 0,
    shotLeft,
    shotRight,
    shotDown,
}ShotDirection;

typedef  enum{
    position_back = 0,
    position_front,
}DevicePositon;

@interface UIImage (fixOrientation)

-(UIImage *)fixOrientation;

-(UIImage *)fixOrientationWithPosition:(DevicePositon)position withShotDirection:(ShotDirection)shotDirection;

@end
