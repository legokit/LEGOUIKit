//
//  UIImage+shareAdjust.m
//  FilmCamera
//
//  Created by 黄亚栋 on 2019/4/30.
//  Copyright © 2019 The last stand. All rights reserved.
//

#import "UIImage+shareAdjust.h"

@implementation UIImage (shareAdjust)

- (UIImage *)adjustImgaeSize_Fit:(CGSize)size {
    
    CGFloat scale = MAX((self.size.width / size.width), (self.size.height / size.height));
    CGFloat newWidth = self.size.width / scale;
    CGFloat newHeight = self.size.height / scale;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
    [self drawInRect:CGRectMake((size.width-newWidth)/2, (size.height-newHeight)/2, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
