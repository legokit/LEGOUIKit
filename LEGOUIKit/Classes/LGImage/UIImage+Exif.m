//
//  UIImage+Exif.m
//  FilmCamera
//
//  Created by 杨庆人 on 2019/5/30.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import "UIImage+Exif.h"
#import <SDWebImage/SDWebImage.h>

@implementation UIImage (Exif)

- (NSData *)setImageMetaInfo:(NSDictionary *)imageInfo {
    // 转成data
    NSData *imageData = [self sd_imageData];
    if (imageInfo == nil) {
        return imageData;
    }
    
    // 获取imageSource和imageInfo
    CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
    
    // 写回图片
    CFStringRef UTI = CGImageSourceGetType(imageSource);
    NSMutableData *newImageData = [NSMutableData data];
    CGImageDestinationRef destination = CGImageDestinationCreateWithData((__bridge CFMutableDataRef)newImageData, UTI, 1,NULL);
    CGImageDestinationAddImageFromSource(destination, imageSource, 0, (__bridge CFDictionaryRef)imageInfo);
    BOOL success = CGImageDestinationFinalize(destination);
    if (success) {
        NSLog(@"保存exif信息成功");
    }
    else {
        NSLog(@"保存exif信息失败");
    }
    return newImageData;
}

+ (NSDictionary *)getImageMetaInfoByImage:(UIImage *)image {
    NSData *imageData = [image sd_imageData];
    return [self.class getImageMetaInfoByImageData:imageData];
}

+ (NSDictionary *)getImageMetaInfoByImageData:(NSData *)imageData {
    // 获取imageSource和imageInfo
    CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)imageData, NULL);
    NSDictionary *imageInfo = (__bridge NSDictionary*)CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
    if (imageInfo == nil) {
        imageInfo = [NSDictionary dictionary];
    }
    return imageInfo;
}

- (NSDictionary *)mergeInfo:(NSDictionary *)imageInfo ISO:(NSString *)ISO name:(NSString *)name {
    return [self mergeInfo:imageInfo GPS:nil ISO:ISO name:name];
}


- (NSDictionary *)mergeInfo:(NSDictionary *)imageInfo GPS:(NSDictionary *)GPS ISO:(NSString *)ISO name:(NSString *)name {
    
    if (imageInfo == nil) {
        imageInfo = [[NSMutableDictionary alloc] init];
    }
    NSString *kExif = (NSString*)kCGImagePropertyExifDictionary;
    NSString *kTIFF = (NSString*)kCGImagePropertyTIFFDictionary;
    
    NSMutableDictionary *originalInfo = [imageInfo mutableCopy];

    // 纠正宽高和方向
    [originalInfo setObject:@(1) forKey:(NSString *)kCGImagePropertyOrientation];
    [originalInfo setObject:[NSNumber numberWithFloat:fabs(self.size.width)] forKey:(NSString *)kCGImagePropertyPixelWidth];
    [originalInfo setObject:[NSNumber numberWithFloat:fabs(self.size.height)] forKey:(NSString *)kCGImagePropertyPixelHeight];
    NSMutableDictionary *exif = nil;
    if ([originalInfo.allKeys containsObject:kExif]) {
        exif = originalInfo[kExif];
    }
    else {
        exif = [[NSMutableDictionary alloc] init];
    }
    [exif setObject:[NSNumber numberWithFloat:fabs(self.size.width)] forKey:(NSString *)kCGImagePropertyExifPixelXDimension];
    [exif setObject:[NSNumber numberWithFloat:fabs(self.size.height)] forKey:(NSString *)kCGImagePropertyExifPixelYDimension];
    [originalInfo setObject:exif forKey:kExif];

    NSMutableDictionary *info = [imageInfo mutableCopy];

    // 合并最外层
    [info addEntriesFromDictionary:[[UIImage getImageMetaInfoByImage:self] mutableCopy]];

    // 合并两者的exif
    exif = nil;
    if ([info.allKeys containsObject:kExif]) {
        exif = [originalInfo[kExif] mutableCopy];
    }
    else {
        exif = [[NSMutableDictionary alloc] init];
    }
    if ([originalInfo.allKeys containsObject:kExif]) {
        [exif addEntriesFromDictionary:originalInfo[kExif]];
    }
    info[kExif] = exif;

    // 合并两者的TIFF
    NSMutableDictionary *TIFF = nil;
    if ([info.allKeys containsObject:kTIFF]) {
        TIFF = [info[kTIFF] mutableCopy];
    }
    else {
        TIFF = [[NSMutableDictionary alloc] init];
    }
    if ([originalInfo.allKeys containsObject:kTIFF]) {
        [TIFF addEntriesFromDictionary:originalInfo[kTIFF]];
    }
    info[kTIFF] = TIFF;



    // GPS
    if (GPS) {
        [info setObject:GPS forKey:(NSString*)kCGImagePropertyGPSDictionary];
    }

    // FIMO
    [TIFF setObject:@"FIMO" forKey:(NSString *)kCGImagePropertyTIFFSoftware];
    [TIFF setObject:[NSString stringWithFormat:@"Shot with FIMO %@.",name] forKey:(NSString *)kCGImagePropertyTIFFImageDescription];
    [info setObject:TIFF forKey:kTIFF];

    // ISO
    if (ISO) {
        [exif setObject:@[@([ISO integerValue])] forKey:(NSString *)kCGImagePropertyExifISOSpeedRatings];
        [info setObject:exif forKey:kExif];
    }

    return info;
}

@end
