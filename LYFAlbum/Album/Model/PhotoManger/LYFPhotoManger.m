//
//  LYFPhotoManger.m
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import "LYFPhotoManger.h"
#import "LYFPhotoModel.h"

@implementation LYFPhotoManger

+(LYFPhotoManger*)standardPhotoManger {
    static LYFPhotoManger *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LYFPhotoManger alloc] init];
    });
    
    return manager;
}

#pragma mark - Set方法
-(void)setMaxCount:(NSInteger)maxCount {
    _maxCount = maxCount;
    
    self.photoModelList = [NSMutableArray array];
    self.choiceCount = 0;
}

-(void)setChoiceCount:(NSInteger)choiceCount {
    _choiceCount = choiceCount;
    
    if (self.choiceCountChange) {
        self.choiceCountChange(choiceCount);
    }
}

@end
