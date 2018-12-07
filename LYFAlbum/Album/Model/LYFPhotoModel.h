//
//  LYFPhotoModel.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

typedef void(^LYFPhotoModelAction)(void);

@interface LYFPhotoModel : NSObject

/// 相片
@property (nonatomic, strong) PHAsset *asset;
/// 高清图
@property (nonatomic, strong) UIImage *highDefinitionImage;
/// 获取图片成功事件
@property (nonatomic, copy) LYFPhotoModelAction getPictureAction;

@end
