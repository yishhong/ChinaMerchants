//
//  RankingCollectionViewCell.m
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/8.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import "RankingCollectionViewCell.h"
#import "UIColor+HUE.h"

@implementation RankingCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.vipImageView.hidden =YES;
    self.headImageView.layer.cornerRadius =30.0f;
    self.headImageView.layer.masksToBounds =YES;
    self.nameLabel.textColor =[UIColor VPTitleColor];
}

//-(void)setIntelligentModel:(IntelligentModel *)intelligentModel{
//
//    _intelligentModel =intelligentModel;
//    [self.headImageView xx_setImageWithURLStr:intelligentModel.HEAD_URL placeholder:[UIImage imageNamed:@"The-defaulf_head"]];
//    self.nameLabel.text =intelligentModel.USER_NAME;
//    if (intelligentModel.USER_STATUS==1) {
//        self.vipImageView.hidden =NO;
//    }else{
//    
//        self.vipImageView.hidden =YES;
//    }
//}

@end
