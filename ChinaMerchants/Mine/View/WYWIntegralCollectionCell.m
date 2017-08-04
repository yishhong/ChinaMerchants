//
//  WYWIntegralCollectionCell.m
//  WYWProject
//
//  Created by  易述宏 on 2017/7/6.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import "WYWIntegralCollectionCell.h"
#import "Masonry.h"
#import "UIColor+HUE.h"

@implementation WYWIntegralCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [UIColor VPDetailColor];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(20);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(12);
    }];
    
    self.numberLabel = [[UILabel alloc]init];
    self.numberLabel.backgroundColor = [UIColor clearColor];
    self.numberLabel.textColor = [UIColor VPTitleColor];
    self.numberLabel.font = [UIFont systemFontOfSize:15];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(21);
    }];
}


@end
