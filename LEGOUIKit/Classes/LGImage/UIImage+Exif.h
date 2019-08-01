//
//  UIImage+Exif.h
//  FilmCamera
//
//  Created by 杨庆人 on 2019/5/30.
//  Copyright © 2019年 The last stand. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Exif)

- (NSData *)setImageMetaInfo:(NSDictionary *)imageInfo;

+ (NSData *)setImageMetaInfo:(NSDictionary *)imageInfo imageData:(NSData *)imageData;

+ (NSDictionary *)getImageMetaInfoByImage:(UIImage *)image;

+ (NSDictionary *)getImageMetaInfoByImageData:(NSData *)imageData;

- (NSDictionary *)mergeInfo:(NSDictionary *)imageInfo ISO:(NSString *)ISO name:(NSString *)name;

- (NSDictionary *)mergeInfo:(NSDictionary *)imageInfo GPS:(NSDictionary *)GPS ISO:(NSString *)ISO name:(NSString *)name;



@end
