//
//  LYFAlbumCollectionViewCell.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

typedef void(^LYFAlbumCollectionViewCellAction)(PHAsset *asset);

@interface LYFAlbumCollectionViewCell : UICollectionViewCell

/// 行数
@property (nonatomic, assign) NSInteger row;
/// 相片
@property (nonatomic, strong) PHAsset *asset;
/// 选中事件
@property (nonatomic, copy) LYFAlbumCollectionViewCellAction selectPhotoAction;
/// 是否被选中
@property (nonatomic, assign) BOOL isSelect;

#pragma mark - 加载图片
-(void)loadImage:(NSIndexPath *)indexPath;

@end
