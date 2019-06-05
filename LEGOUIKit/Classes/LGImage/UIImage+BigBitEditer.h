//
//  UIImage+bigBitEditer.h
//  AboutEditerImageToMemory
//
//  Created by 黄亚栋 on 2018/9/19.
//  Copyright © 2018年 黄亚栋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    Scale9To16 = 0,
    Scale3To4,
    Scale1To1,
    Scale2To3,
    Scale3To2,
}ShotScale;

@interface UIImage (BigBitEditer)
- (UIImage *)createThumbnailImageWithSize:(CGSize)size;
- (UIImage *)createThumbnailImageWithURL:(NSURL *)url withSize:(CGSize)size;
- (UIImage *)createThumbnailImageWithData:(NSData *)data withSize:(CGSize)size;
- (UIImage *)changeImageOrientation;
- (UIImage *)cropImgeWithShotScale:(ShotScale)shotScale;

+ (UIImage *)createThumbnailImageWithData:(NSData *)data withSize:(CGSize)size;
+ (UIImage *)createThumbnailImageWithData:(NSData *)data;
@end
