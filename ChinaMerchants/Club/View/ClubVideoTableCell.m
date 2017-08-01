//
//  ClubVideoTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubVideoTableCell.h"
#import "XXCellModel.h"
#import "UIColor+HUE.h"
#import "UIImageView+Load.h"

@implementation ClubVideoTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.videImageView xx_setImageWithURLStr:@"http://pic2.16pic.com/00/16/43/16pic_1643836_b.jpg" placeholder:nil];
    self.titleLabel.textColor =[UIColor VPTitleColor];
    self.studyLabel.textColor =[UIColor VPDetailColor];
    
}

-(void)xx_configCellWithEntity:(id)entity{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
