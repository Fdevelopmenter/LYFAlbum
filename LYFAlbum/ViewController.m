//
//  ViewController.m
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import "ViewController.h"
#import "LYFPhotosManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)openAlbum:(UIButton *)sender {
    [LYFPhotosManager showPhotosManager:self withMaxImageCount:10 withAlbumArray:^(NSMutableArray<LYFPhotoModel *> *albumArray) {
        NSLog(@"%@", albumArray);
    }];
}

@end
