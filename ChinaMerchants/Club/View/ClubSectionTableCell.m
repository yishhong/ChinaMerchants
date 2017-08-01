//
//  ClubSectionTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubSectionTableCell.h"
#import "XXCellModel.h"
#import "UIColor+HUE.h"

@implementation ClubSectionTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.textColor =[UIColor VPTitleColor];
}

-(void)xx_configCellWithEntity:(id)entity{

    XXCellModel * cellModel =entity;
    NSString * name =cellModel.dataSource;
    self.nameLabel.text=name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
