//
//  LYFAlbumModel.m
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import "LYFAlbumModel.h"

@implementation LYFAlbumModel

-(void)setCollection:(PHAssetCollection *)collection {    
    _collection = collection;
    
    if ([collection.localizedTitle isEqualToString:@"All Photos"]) {
        self.collectionTitle = @"全部相册";
    } else {
        self.collectionTitle = collection.localizedTitle;
    }
    
    self.collectionTitle = collection.localizedTitle;
    
    // 获得某个相簿中的所有PHAsset对象
    self.assets = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
    
    if (self.assets.count > 0) {
        self.firstAsset = self.assets[0];
    }
    self.collectionNumber = [NSString stringWithFormat:@"%ld", self.assets.count];
}

#pragma mark - Get方法
-(NSMutableArray<NSNumber *> *)selectRows {
    if (!_selectRows) {
        _selectRows = [NSMutableArray array];
    }
    
    return _selectRows;
}

@end
