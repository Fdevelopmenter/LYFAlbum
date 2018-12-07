//
//  LYFPhotosManager.m
//  LYFAlbum
//
//  Created by 李玉枫 on 2018/12/6.
//  Copyright © 2018 李玉枫. All rights reserved.
//

#import "LYFPhotosManager.h"
#import "LYFAlbumViewController.h"
#import "LYFPhotoManger.h"

@implementation LYFPhotosManager

+(void)showPhotosManager:(UIViewController *)viewController withMaxImageCount:(NSInteger)maxCount withAlbumArray:(void(^)(NSMutableArray<LYFPhotoModel *> *albumArray))albumArray {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (status == PHAuthorizationStatusAuthorized) {
                LYFAlbumViewController *controller = [[LYFAlbumViewController alloc] init];
                controller.confirmAction = ^{
                    albumArray([LYFPhotoManger standardPhotoManger].photoModelList);
                };
                
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
                
                [LYFPhotoManger standardPhotoManger].maxCount = maxCount;
                
                [viewController presentViewController:navigationController animated:YES completion:nil];
            }else{
                UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"访问相册" message:@"您还没有打开相册权限" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"去打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    if ([[UIApplication sharedApplication] canOpenURL:url]) {
                        [[UIApplication sharedApplication] openURL:url];
                    }
                }];
                UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"点击了取消");
                }];
                
                [alertViewController addAction:action1];
                [alertViewController addAction:action2];
                
                //相当于之前的[actionSheet show];
                [viewController presentViewController:alertViewController animated:YES completion:nil];
            }
        });
    }];
}

@end
