//
//  UIImage+bigBitEditer.m
//  AboutEditerImageToMemory
//
//  Created by 黄亚栋 on 2018/9/19.
//  Copyright © 2018年 黄亚栋. All rights reserved.
//

#import "UIImage+BigBitEditer.h"

@implementation UIImage (BigBitEditer)

//Creat thumbnail image
- (UIImage *)createThumbnailImageWithSize:(CGSize)size {

    CFAbsoluteTime startTime5 = CFAbsoluteTimeGetCurrent();
    NSData *imageData = UIImagePNGRepresentation(self);
    CFAbsoluteTime linkTime5 = (CFAbsoluteTimeGetCurrent() - startTime5);
    NSLog(@"20202020020 linkTime5 %f",linkTime5 * 1000);
    
    NSDictionary *optionRef = @{
                                (__bridge NSString *)kCGImageSourceShouldCache : @NO
                                };
    CGImageSourceRef myImageSource = CGImageSourceCreateWithData((CFDataRef)imageData, (CFDictionaryRef)optionRef);
    NSDictionary *option = @{
                             (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize : @(fmax(size.width, size.height)),
                             (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                             (__bridge NSString *)kCGImageSourceShouldCacheImmediately : @YES, //等到在屏幕上渲染时再解码
                             (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES
                             };
    CGImageRef myImage = CGImageSourceCreateThumbnailAtIndex(myImageSource, 0, (CFDictionaryRef)option);

    CFAbsoluteTime startTime6 = CFAbsoluteTimeGetCurrent();
    UIImage *image = [UIImage imageWithCGImage:myImage scale:1.0 orientation:UIImageOrientationUp];
    CFAbsoluteTime linkTime6 = (CFAbsoluteTimeGetCurrent() - startTime6);
    NSLog(@"20202020020 linkTime6 %f",linkTime6 * 1000);
    
    CGImageRelease(myImage);
    CFRelease(myImageSource);
    return image;
}

- (UIImage *)createThumbnailImageWithURL:(NSURL *)url withSize:(CGSize)size {

    NSDictionary *optionRef = @{
                                (__bridge NSString *)kCGImageSourceShouldCache : @NO
                                   };
    CGImageSourceRef myImageSource = CGImageSourceCreateWithURL((CFURLRef)url, (CFDictionaryRef)optionRef);
    NSDictionary *option = @{
                             (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize : @(fmax(size.width, size.height)),
                             (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                             (__bridge NSString *)kCGImageSourceShouldCacheImmediately : @YES,
                             (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES
                             };
    CGImageRef myImage = CGImageSourceCreateThumbnailAtIndex(myImageSource, 0, (CFDictionaryRef)option);
    
    CFAbsoluteTime startTime6 = CFAbsoluteTimeGetCurrent();
    UIImage *image = [UIImage imageWithCGImage:myImage scale:1.0 orientation:UIImageOrientationUp];
    CFAbsoluteTime linkTime6 = (CFAbsoluteTimeGetCurrent() - startTime6);
    NSLog(@"20202020020 linkTime6 %f",linkTime6 * 1000);
    
    CGImageRelease(myImage);
    CFRelease(myImageSource);
    return image;
}

- (UIImage *)createThumbnailImageWithData:(NSData *)data withSize:(CGSize)size {
    
    NSDictionary *optionRef = @{
                                (__bridge NSString *)kCGImageSourceShouldCache : @NO
                                };
    CGImageSourceRef myImageSource = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)optionRef);
    NSDictionary *option = @{
                             (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize : @(fmax(size.width, size.height)),
                             (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                             (__bridge NSString *)kCGImageSourceShouldCacheImmediately : @YES,
                             (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES
                             };
    CGImageRef myImage = CGImageSourceCreateThumbnailAtIndex(myImageSource, 0, (CFDictionaryRef)option);
    
    CFAbsoluteTime startTime6 = CFAbsoluteTimeGetCurrent();
    UIImage *image = [UIImage imageWithCGImage:myImage scale:1.0 orientation:UIImageOrientationUp];
    CFAbsoluteTime linkTime6 = (CFAbsoluteTimeGetCurrent() - startTime6);
    NSLog(@"20202020020 linkTime9 %f",linkTime6 * 1000);
    
    CGImageRelease(myImage);
    CFRelease(myImageSource);
    
    return image;
}


+ (UIImage *)createThumbnailImageWithData:(NSData *)data withSize:(CGSize)size {
    
    NSDictionary *optionRef = @{
                                (__bridge NSString *)kCGImageSourceShouldCache : @NO
                                };
    CGImageSourceRef myImageSource = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)optionRef);
    NSDictionary *option = @{
                             (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize : @(fmax(size.width, size.height)),
                             (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                             (__bridge NSString *)kCGImageSourceShouldCacheImmediately : @YES,
                             (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES
                             };
    CGImageRef myImage = CGImageSourceCreateThumbnailAtIndex(myImageSource, 0, (CFDictionaryRef)option);
    
    CFAbsoluteTime startTime6 = CFAbsoluteTimeGetCurrent();
    UIImage *image = [UIImage imageWithCGImage:myImage scale:1.0 orientation:UIImageOrientationUp];
    CFAbsoluteTime linkTime6 = (CFAbsoluteTimeGetCurrent() - startTime6);
    NSLog(@"20202020020 linkTime9 %f",linkTime6 * 1000);
    
    CGImageRelease(myImage);
    CFRelease(myImageSource);
    
    return image;
}

+ (UIImage *)createThumbnailImageWithData:(NSData *)data {
    NSDictionary *optionRef = @{
                                (__bridge NSString *)kCGImageSourceShouldCache : @NO
                                };
    CGImageSourceRef myImageSource = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)optionRef);
    NSDictionary *option = @{
                             (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize : @(300),
                             (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
                             (__bridge NSString *)kCGImageSourceShouldCacheImmediately : @YES,
                             (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES
                             };
    CGImageRef myImage = CGImageSourceCreateThumbnailAtIndex(myImageSource, 0, (CFDictionaryRef)option);
    
    CFAbsoluteTime startTime6 = CFAbsoluteTimeGetCurrent();
    UIImage *image = [UIImage imageWithCGImage:myImage scale:1.0 orientation:UIImageOrientationUp];
//    UIImage *image = [UIImage imageWithCGImage:myImage];
    CFAbsoluteTime linkTime6 = (CFAbsoluteTimeGetCurrent() - startTime6);
    NSLog(@"20202020020 linkTime9 %f",linkTime6 * 1000);
    
    CGImageRelease(myImage);
    CFRelease(myImageSource);
    
    return image;
    
}


//Chaneg mirror image
- (UIImage *)changeImageOrientation {

    UIImage *image = [[UIImage alloc]init];
    
    switch (self.imageOrientation) {
        case UIImageOrientationUp:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationUpMirrored];
            break;
        case UIImageOrientationDown:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationDownMirrored];
            break;
        case UIImageOrientationUpMirrored:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationUp];
            break;
        case UIImageOrientationDownMirrored:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationDown];
            break;
        case UIImageOrientationLeft:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationRightMirrored];
            break;
        case UIImageOrientationLeftMirrored:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationRight];
            break;
        case UIImageOrientationRight:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationLeftMirrored];
            break;
        case UIImageOrientationRightMirrored:
            image = [[UIImage alloc]initWithCGImage:self.CGImage scale:1.0 orientation:UIImageOrientationLeft];
            break;
        default:
            break;
    }
    
    return image;
}

//crop image
- (UIImage *)cropImgeWithShotScale:(ShotScale)shotScale {
    
    CGSize imageSize = self.size;
    CGRect imageRect = [self cropRectWithScale:shotScale andImgaeSize:imageSize];
    CGImageRef cgimage = CGImageCreateWithImageInRect(self.CGImage,imageRect);
    UIImage *ruseltImage = [[UIImage alloc]initWithCGImage:cgimage scale:1.0 orientation:self.imageOrientation];
    CGImageRelease(cgimage);
    return ruseltImage;
}

- (CGRect)cropRectWithScale:(ShotScale)shotScale andImgaeSize:(CGSize)imageSize{
    CGFloat scale = 1.0;
    CGRect imageRect = CGRectZero;

    switch (shotScale) {
        case Scale3To4:
            scale = 3.0f / 4;
            break;
        case Scale1To1:
            scale = 1 / 1;
            break;
        case Scale9To16:
            scale = 9.0f / 16;
            break;
        case Scale2To3:
            scale = 2.0f / 3;
            break;
        case Scale3To2:
            scale = 3.0f / 2;
            break;
        default:
            scale = 1 / 1;
            break;
    }
    
    if (imageSize.height > imageSize.width / scale) {
        CGSize size = CGSizeMake(imageSize.width, imageSize.width / scale);
        imageRect = CGRectMake(0, (imageSize.height - size.height)/2, size.width, size.height);
    }else {
        CGSize size = CGSizeMake(imageSize.height * scale, imageSize.height);
        imageRect = CGRectMake((imageSize.width - size.width)/2, 0, size.width, size.height);
    }
    
    return imageRect;
}

@end
