//
//  QMAssetsVideo.h
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CTAssetsPickerController/CTAssetsPickerController.h>

typedef void(^AssetsVideoBlock)(PHAuthorizationStatus status ,NSArray *images);

@interface QMAssetsVideo : NSObject

/**
 *  最大的数值 默认为1
 */
@property (nonatomic, assign) NSInteger maxNumber;

- (void)showAssetsVideoWithController:(UIViewController *)viewController amount:(NSInteger)amount isReserve:(BOOL)isReserve withBlock:(AssetsVideoBlock)block;
/**
 *  删除视频
 *
 *  @param index 图片的坐标
 */
- (void)removeImage:(NSInteger)index;

@end
