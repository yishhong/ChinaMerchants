//
//  QMCalendarDayCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "QMCalendarDayCell.h"
#import "Masonry.h"
#import "UIColor+HUE.h"

@implementation QMCalendarDayCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)initView{

    self.dayLabel = [[UILabel alloc] init];
    self.dayLabel.font = [UIFont systemFontOfSize:15];
    self.dayLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.dayLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dayLabel];
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.height.mas_offset(15);
        make.width.mas_equalTo(self);
    }];
}

@end
