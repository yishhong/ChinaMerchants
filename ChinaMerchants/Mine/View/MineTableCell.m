//
//  MineTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/4.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "MineTableCell.h"
#import "UIColor+HUE.h"
#import "XXCellModel.h"

@implementation MineTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textColor =[UIColor VPTitleColor];
    self.linevIEW.backgroundColor =[UIColor septalLineColor];
}

-(void)xx_configCellWithEntity:(id)entity{

    XXCellModel * cellModdel =entity;
    NSDictionary * info =cellModdel.dataSource;
    self.mineImageView.image =[UIImage imageNamed:info[@"image"]];
    self.titleLabel.text =info[@"title"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
