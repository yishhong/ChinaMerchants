//
//  HomeBannerTableViewCell.m
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/8.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import "HomeBannerTableViewCell.h"
#import "XXCellModel.h"
#import "UITableViewCell+DataSource.h"
#import "UIColor+HUE.h"
#import "BannerModel.h"

@implementation HomeBannerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)tapAddress:(UIButton *)button{
    //地址事件触发
    [self xx_cellClickAtView:button];
}

- (void)xx_configCellWithEntity:(id)entity{
    
    [self.bannerView adjustWhenControllerViewWillAppera];
    XXCellModel *cellModel = entity;
    NSMutableArray * dataArray =cellModel.dataSource;
    NSMutableArray *bannerImages =[NSMutableArray array];
    for (BannerModel * banner in dataArray) {
        
        [bannerImages addObject:banner.imgurl];
    }
    self.bannerView.imageURLStringsGroup = bannerImages;
    self.bannerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    self.bannerView.pageDotColor =[UIColor whiteColor];
    self.bannerView.autoScrollTimeInterval =8.0f;
    self.bannerView.currentPageDotColor = [UIColor blackColor];
    self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.bannerView.delegate = self;
    self.bannerView.placeholderImage = [UIImage imageNamed:@"picture_dtr"];
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [self xx_cellClickAtView:cycleScrollView data:@(index)];
}

/**
 *  点击banner图
 *
 *  @param index <#index description#>
 */
-(void)didselectIndex:(NSInteger)index{
    
    NSLog(@"%ld",(long)index);
}

//- (void)xx_configCellWithEntity:(id)entity{
//
//}


@end
