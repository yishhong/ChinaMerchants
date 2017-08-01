//
//  WYWLineTableViewCell.m
//  WYWProject
//
//  Created by  易述宏 on 2017/6/29.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import "WYWLineTableViewCell.h"
#import "UIColor+HUE.h"

@implementation WYWLineTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor =[UIColor controllerBackgroundColor];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
