//
//  ClubNewClassTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubNewClassTableCell.h"
#import "UIColor+HUE.h"
#import "UIImageView+Load.h"
#import "XXCellModel.h"

@implementation ClubNewClassTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textColor =[UIColor whiteColor];
    self.descLabel.textColor =[UIColor whiteColor];
    self.newsClassButton.layer.masksToBounds =YES;
    self.newsClassButton.layer.cornerRadius=15.0f;
    [self.newsClassButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.newsClassButton setBackgroundColor:[UIColor VPRedColor]];
    [self.newsImageView xx_setImageWithURLStr:@"http://pic2.16pic.com/00/16/43/16pic_1643836_b.jpg" placeholder:nil];
}

-(void)xx_configCellWithEntity:(id)entity{

    
}

- (IBAction)newsClassAction:(UIButton *)sender {
    
    [self xx_cellClickAtView:sender];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
