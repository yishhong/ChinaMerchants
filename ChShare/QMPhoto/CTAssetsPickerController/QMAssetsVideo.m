//
//  QMAssetsVideo.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "QMAssetsVideo.h"

@interface QMAssetsVideo ()<CTAssetsPickerControllerDelegate>

@property (nonatomic, copy) AssetsVideoBlock pickerBlock;
@property (nonatomic, strong) NSMutableArray *selectVideos;

@end

@implementation QMAssetsVideo

-(void)showAssetsVideoWithController:(UIViewController *)viewController amount:(NSInteger)amount isReserve:(BOOL)isReserve withBlock:(AssetsVideoBlock)block{

    self.maxNumber = amount;
    if(block){
        self.pickerBlock = nil;
        self.pickerBlock = block;
    }
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        if (status != PHAuthorizationStatusAuthorized){
            self.pickerBlock(status,nil);
            return ;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // init picker
            CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
            // 设置delegate
            
            picker.delegate = self;
            picker.showsSelectionIndex = YES;
            if(isReserve){
                picker.selectedAssets = [self.selectVideos mutableCopy];
            }else{
                [self.selectVideos removeAllObjects];
            }
            picker.alwaysEnableDoneButton = YES;
            //是否显示取消按钮
            picker.showsCancelButton = YES;
            picker.assetCollectionSubtypes = @[@(PHAssetCollectionSubtypeSmartAlbumVideos)];
            // Optionally present picker as a form sheet on iPad
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                picker.modalPresentationStyle = UIModalPresentationFormSheet;
            // present picker
            [viewController presentViewController:picker animated:YES completion:nil];
        });
    }];
}

//选中视频
- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(PHAsset *)asset{
    NSInteger max = self.maxNumber;
    if (picker.selectedAssets.count < max){
        
        return YES;
    }
    //初步部分提示用户
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意"
                                                                   message:[NSString stringWithFormat:@"最多选择%zd个视频", max]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [picker presentViewController:alert animated:YES completion:nil];
    return NO;
}

//选择完成
- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    self.selectVideos = [assets mutableCopy];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    [options setSynchronous:NO];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    options.networkAccessAllowed = YES;
    //创建队列
    dispatch_group_t group = dispatch_group_create();
    
    NSMutableArray * imageArray = [NSMutableArray array];
    //数组提前占位
    for (PHAsset * _  in assets) {
        [imageArray addObject:[NSNull null]];
    }
    for (NSInteger i = 0; i < assets.count; i++) {
        PHAsset *asset = assets[i];
        CGSize size = CGSizeMake(asset.pixelWidth / [UIScreen mainScreen].scale, asset.pixelHeight / [UIScreen mainScreen].scale);
        dispatch_group_enter(group);
        // 请求图片
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            if (result) {
                imageArray[i] = result;
                dispatch_group_leave(group);
            }
        }];
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //通过block 返回这个数组
        self.pickerBlock(PHAuthorizationStatusAuthorized,imageArray);
    });
}

-(void)removeImage:(NSInteger)index{
    
    [self.selectVideos removeObjectAtIndex:index];
}

@end
