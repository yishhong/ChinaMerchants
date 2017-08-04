//
//  QMPatVideo.h
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

/**
 选择相机的回调
 
 @param isSourceTypeAvailable 是否可用相机
 @param authorizationStatus 权限
 @param videoPath 视频地址
 */
typedef void(^PatVideoBlock)(BOOL isSourceTypeAvailable,AVAuthorizationStatus authorizationStatus, NSString *videoPath);

@interface QMPatVideo : NSObject

/**
 录制视频
 
 @param vc 当前的控制器
 @param patVideoBlock 选择相机的回调
 */
- (void)patVideoWithController:(UIViewController *)vc block:(PatVideoBlock)patVideoBlock;

@end
