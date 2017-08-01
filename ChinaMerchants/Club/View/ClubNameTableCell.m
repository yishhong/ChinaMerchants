//
//  ClubNameTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubNameTableCell.h"
#import "UIColor+HUE.h"

@implementation ClubNameTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.textColor =[UIColor VPTitleColor];
    self.descLabel.textColor =[UIColor VPDetailColor];
}

-(void)xx_configCellWithEntity:(id)entity{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
