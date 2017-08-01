//
//  ClubCoachTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubCoachTableCell.h"
#import "UIColor+HUE.h"
#import "XXCellModel.h"

@implementation ClubCoachTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.coachLabel.textColor =[UIColor VPTitleColor];
    [self.lookButton setTitleColor:[UIColor VPDetailColor] forState:UIControlStateNormal];
}
- (IBAction)lookAction:(UIButton *)sender {
    
    [self xx_cellClickAtView:sender];
}

-(void)xx_configCellWithEntity:(id)entity{

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
