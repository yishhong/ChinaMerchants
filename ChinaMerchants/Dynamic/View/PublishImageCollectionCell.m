//
//  PublishImageCollectionCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "PublishImageCollectionCell.h"

@implementation PublishImageCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.pictureImage.contentMode = UIViewContentModeScaleAspectFill;
    self.pictureImage.layer.masksToBounds = YES;
}

- (void)xx_configCellWithEntity:(id)entity{
    NSDictionary *imageDict = entity;
    self.pictureImage.image = imageDict[@"image"];
}

@end
