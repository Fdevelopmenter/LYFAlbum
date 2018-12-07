//
//  LYFAlbumView.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYFAlbumModel;

@interface LYFAlbumView : UIView

/**
 显示相册列表
 
 @param assetCollectionList 相册对象列表
 @param navigationBarMaxY navigationBarMaxY的最大值
 @param complete 返回结果
 */
+(void)showAlbumView:(NSMutableArray<LYFAlbumModel *> *)assetCollectionList navigationBarMaxY:(CGFloat)navigationBarMaxY complete:(void(^)(LYFAlbumModel *albumModel))complete;

@end
