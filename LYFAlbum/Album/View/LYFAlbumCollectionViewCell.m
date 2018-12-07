//
//  LYFAlbumCollectionViewCell.m
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import "LYFAlbumCollectionViewCell.h"
#import "LYFPhotoManger.h"

#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface LYFAlbumCollectionViewCell()

/// 相片
@property (nonatomic, strong) UIImageView *photoImageView;
/// 选中按钮
@property (nonatomic, strong) UIButton *selectButton;
/// 半透明遮罩
@property (nonatomic, strong) UIView *translucentView;

@end

@implementation LYFAlbumCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self photoImageView];
        [self translucentView];
        [self selectButton];
    }
    
    return self;
}

#pragma mark - Set方法
-(void)setIsSelect:(BOOL)isSelect {
    _isSelect = isSelect;
    
    self.translucentView.hidden = !isSelect;
    [self.selectButton setBackgroundImage:isSelect ? [UIImage imageNamed: @"selectImage_select"] : nil forState:UIControlStateNormal];
    
    if ([LYFPhotoManger standardPhotoManger].maxCount == [LYFPhotoManger standardPhotoManger].choiceCount) {
        self.translucentView.hidden = NO;
        if (isSelect) {
            _translucentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        } else {
            _translucentView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
        }
    } else {
        _translucentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    }
}

#pragma mark - 加载图片
-(void)loadImage:(NSIndexPath *)indexPath {
    CGFloat imageWidth = (kScreenWidth - 20.f) / 5.5;
    self.photoImageView.image = nil;
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    // 同步获得图片, 只会返回1张图片
    options.synchronous = NO;
    
    [[PHCachingImageManager defaultManager] requestImageForAsset:self.asset targetSize:CGSizeMake(imageWidth * [UIScreen mainScreen].scale, imageWidth * [UIScreen mainScreen].scale) contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        if (self.row == indexPath.row) {
            self.photoImageView.image = result;
        }
    }];
}

#pragma mark - 点击事件
-(void)selectPhoto:(UIButton *)button {
    if (self.selectPhotoAction) {
        self.selectPhotoAction(self.asset);
    }
}

#pragma mark - Get方法
-(UIImageView *)photoImageView {
    if (!_photoImageView) {
        _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (kScreenWidth - 20.f) / 3.f, (kScreenWidth - 20.f) / 3.f)];
        _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImageView.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_photoImageView];
    }
    
    return _photoImageView;
}

-(UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _selectButton.layer.borderWidth = 1.f;
        _selectButton.layer.cornerRadius = 12.5f;
        _selectButton.layer.masksToBounds = YES;
        [_selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_selectButton addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_selectButton];
        _selectButton.frame = CGRectMake((kScreenWidth - 20.f) / 3.f - 29, 3, 25, 25);
    }
    
    return _selectButton;
}

-(UIView *)translucentView {
    if (!_translucentView) {
        _translucentView = [[UIView alloc] init];
        _translucentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        
        [self.contentView addSubview:_translucentView];
        _translucentView.frame = CGRectMake(0, 0, (kScreenWidth - 20.f) / 3.f, (kScreenWidth - 20.f) / 3.f);
        _translucentView.hidden = YES;
    }
    
    return _translucentView;
}

@end
