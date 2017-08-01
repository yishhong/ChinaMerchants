//
//  ClubAddressTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubAddressTableCell.h"
#import "XXCellModel.h"
#import "UIColor+HUE.h"

@implementation ClubAddressTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.addressLabel.textColor =[UIColor VPTitleColor];
    [self.takePhoneButton setTitleColor:[UIColor VPDetailColor] forState:UIControlStateNormal];
    self.takePhoneButton.layer.cornerRadius =1.0f;
    self.takePhoneButton.layer.masksToBounds =YES;
    self.takePhoneButton.layer.borderColor =[UIColor controllerBackgroundColor].CGColor;
    self.takePhoneButton.layer.borderWidth =1.0f;
}

-(void)xx_configCellWithEntity:(id)entity{

}

- (IBAction)takePhoneAction:(UIButton *)sender {
    
    [self xx_cellClickAtView:sender];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
