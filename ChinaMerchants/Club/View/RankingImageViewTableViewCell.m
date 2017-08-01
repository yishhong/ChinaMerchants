//
//  RankingImageViewTableViewCell.m
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/8.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import "RankingImageViewTableViewCell.h"
#import "RankingCollectionView.h"
#import <Masonry.h>
#import "UITableViewCell+DataSource.h"
#import "XXCellModel.h"

@interface RankingImageViewTableViewCell ()<RankingCollectionViewDelegate>

@property(strong, nonatomic)RankingCollectionView *rankingCollectionView;

@end

@implementation RankingImageViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        self.rankingCollectionView = [[RankingCollectionView alloc] init];
        self.rankingCollectionView.delegate =self;
        self.rankingCollectionView.tag =10;
        [self addSubview:self.rankingCollectionView];
        [self.rankingCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(self.contentView.mas_trailing);
            make.leading.mas_equalTo(self.contentView.mas_leading);
            make.top.mas_equalTo(self.mas_top).offset(0);
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
        }];
    }
    return self;
}

- (void)xx_configCellWithEntity:(id)entity{

    XXCellModel * cellModel =entity;
    NSArray * imageArray =cellModel.dataSource;
    [self.rankingCollectionView focusImageItemsArray:imageArray count:@(5)];
}

//-(void)rankingCollectionViewCell:(IntelligentModel*)model{
//
//    [self xx_cellClickAtView:self.rankingCollectionView data:model];
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
