//
//  HomeBannerTableViewCell.h
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/8.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeBannerTableViewCell : UITableViewCell <SDCycleScrollViewDelegate>

@property (strong, nonatomic) IBOutlet SDCycleScrollView *bannerView;

@end
