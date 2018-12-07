//
//  LYFAlbumTableView.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYFAlbumModel;

typedef void(^LYFAlbumTableViewSelectAction)(LYFAlbumModel *albumModel);

@interface LYFAlbumTableView : UITableView

/// 相册数组
@property (nonatomic, strong) NSMutableArray<LYFAlbumModel *> *assetCollectionList;
/// 选择的相册
@property (nonatomic, copy) LYFAlbumTableViewSelectAction selectAction;

@end
