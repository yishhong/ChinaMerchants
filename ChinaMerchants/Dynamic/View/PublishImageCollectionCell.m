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
    if ([imageDict[@"video"] length]>0&&[imageDict[@"video"] isEqualToString:@"public.movie"]) {
        NSData * data =[NSData dataWithContentsOfFile:imageDict[@"image"]];
        self.pictureImage.image =[UIImage imageWithData:data];
    }else{
        self.pictureImage.image = imageDict[@"image"];
    }
}

@end
