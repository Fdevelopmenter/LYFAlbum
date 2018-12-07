//
//  LYFAlbumTableViewCell.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYFAlbumModel;

@interface LYFAlbumTableViewCell : UITableViewCell

/// 相册
@property (nonatomic, strong) LYFAlbumModel *albumModel;
/// 行数
@property (nonatomic, assign) NSInteger row;

/// 加载图片
-(void)loadImage:(NSIndexPath *)index;

@end
