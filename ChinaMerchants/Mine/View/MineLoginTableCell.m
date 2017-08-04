//
//  MineLoginTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/4.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "MineLoginTableCell.h"
#import "UIColor+HUE.h"
#import "UIImageView+Load.h"
#import "XXCellModel.h"

@implementation MineLoginTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headImageView.layer.cornerRadius =35.0f;
    [self.loginButton setTintColor:[UIColor VPTitleColor]];
}

-(void)xx_configCellWithEntity:(id)entity{

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)loginAction:(UIButton *)sender {
    [self xx_cellClickAtView:sender];
}

@end
