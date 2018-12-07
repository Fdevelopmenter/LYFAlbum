//
//  LYFPhotosManager.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYFPhotoModel.h"

@interface LYFPhotosManager : NSObject

/**
 显示相册
 
 @param viewController 跳转的控制器
 @param maxCount 最大选择图片数量
 @param albumArray 返回的图片数组
 */
+(void)showPhotosManager:(UIViewController *)viewController withMaxImageCount:(NSInteger)maxCount withAlbumArray:(void(^)(NSMutableArray<LYFPhotoModel *> *albumArray))albumArray;

@end
