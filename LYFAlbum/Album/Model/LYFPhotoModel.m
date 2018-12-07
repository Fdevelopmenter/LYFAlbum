//
//  LYFPhotoModel.m
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import "LYFPhotoModel.h"

@implementation LYFPhotoModel

-(void)setAsset:(PHAsset *)asset {
    _asset = asset;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        // 同步获得图片, 只会返回1张图片
        options.synchronous = YES;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
        options.resizeMode = PHImageRequestOptionsResizeModeFast;
        
        /// 当选择后获取原图
        [[PHCachingImageManager defaultManager] requestImageForAsset:self.asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            self.highDefinitionImage = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.getPictureAction) {
                    self.getPictureAction();
                }
            });
        }];
    });
}

@end
