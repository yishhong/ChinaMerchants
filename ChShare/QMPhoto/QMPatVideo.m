//
//  QMPatVideo.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "QMPatVideo.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface QMPatVideo ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, copy) PatVideoBlock  patVideoBlock;

@end

@implementation QMPatVideo

-(void)patVideoWithController:(UIViewController *)vc block:(PatVideoBlock)patVideoBlock{
    
    if(patVideoBlock){
        if(self.patVideoBlock){
            self.patVideoBlock = nil;
        }
        self.patVideoBlock = patVideoBlock;
    }
    
    UIImagePickerControllerSourceType  sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断相机是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //判断是否有访问相机权限
        NSString *mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        switch (authorizationStatus) {
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:{
                if(self.patVideoBlock){
                    self.patVideoBlock(YES, authorizationStatus, nil);
                }
                return;
            }break;
            default:
                break;
        }
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.delegate = self;
        self.imagePickerController.allowsEditing = YES;
        self.imagePickerController.mediaTypes =[[NSArray alloc]initWithObjects:(NSString *)kUTTypeMovie, nil];
        self.imagePickerController.sourceType = sourceType;
        self.imagePickerController.videoMaximumDuration=6.0f;
        self.imagePickerController.videoQuality=UIImagePickerControllerQualityTypeMedium;
        self.imagePickerController.cameraCaptureMode =UIImagePickerControllerCameraCaptureModeVideo;
        [vc presentViewController:self.imagePickerController animated:YES completion:nil];
    }else{
        if(self.patVideoBlock){
            self.patVideoBlock(NO,AVAuthorizationStatusNotDetermined,nil);
        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.movie"]){
        NSString *key = nil;
        if (picker.allowsEditing){
            key = UIImagePickerControllerMediaURL;
        }
        else{
            key = UIImagePickerControllerMediaURL;
        }
        NSString * videoPath =[info objectForKey:key];
        if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
            if (videoPath != nil){
                //这里可以处理视频
                if(self.patVideoBlock){
                    self.patVideoBlock(YES, AVAuthorizationStatusAuthorized, videoPath);
                }
            }
        }
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc{
    self.imagePickerController.delegate = nil;
    self.patVideoBlock = nil;
}

@end
