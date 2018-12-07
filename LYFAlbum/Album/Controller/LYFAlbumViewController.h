//
//  LYFAlbumViewController.h
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LYFAlbumViewControllerConfirmAction)(void);

@interface LYFAlbumViewController : UIViewController

/// 确定事件
@property (nonatomic, copy) LYFAlbumViewControllerConfirmAction confirmAction;

@end
