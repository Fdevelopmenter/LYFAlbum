//
//  LYFPhotoManger.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LYFPhotoModel;

typedef void(^LYFPhotoMangerChoiceCountChange)(NSInteger choiceCount);

@interface LYFPhotoManger : NSObject

/// 可选的的最大数量
@property (nonatomic, assign) NSInteger maxCount;
/// 已选数量
@property (nonatomic, assign) NSInteger choiceCount;
/// 已选图片
@property (nonatomic, strong) NSMutableArray<LYFPhotoModel *> *photoModelList;
/// 选择图片变化
@property (nonatomic, copy) LYFPhotoMangerChoiceCountChange choiceCountChange;

/**
 单例
 
 @return 返回对象
 */
+(LYFPhotoManger*)standardPhotoManger;

@end
