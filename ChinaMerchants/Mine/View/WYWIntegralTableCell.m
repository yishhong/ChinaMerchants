//
//  WYWIntegralTableCell.m
//  WYWProject
//
//  Created by  易述宏 on 2017/7/6.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import "WYWIntegralTableCell.h"
#import "WYWIntegralView.h"
#import "XXCellModel.h"
#import "WYWHomeGirdItemModel.h"


@interface WYWIntegralTableCell ()

@property (strong, nonatomic)WYWIntegralView * integralView;
@property(strong, nonatomic) NSMutableArray * categoryArray;

@end

@implementation WYWIntegralTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.categoryArray =[NSMutableArray array];
        WYWHomeGirdItemModel *integralModel =[[WYWHomeGirdItemModel alloc]init];
        integralModel.number =@"125";
        integralModel.title =@"粉丝";
        [self.categoryArray addObject:integralModel];
        
        WYWHomeGirdItemModel *couponModel =[[WYWHomeGirdItemModel alloc]init];
        couponModel.number =@"125";
        couponModel.title =@"关注";
        [self.categoryArray addObject:couponModel];
        
        WYWHomeGirdItemModel *recordModel =[[WYWHomeGirdItemModel alloc]init];
        recordModel.number =@"125";
        recordModel.title =@"积分";
        [self.categoryArray addObject:recordModel];

        [self addSubview:self.integralView];
        self.integralView.reformerData =[self.categoryArray mutableCopy];
        [self.integralView.collectionView reloadData];
    }
    return self;
}

- (void)xx_configCellWithEntity:(id)entity{
    
    XXCellModel * cellModel =entity;
    
}

- (WYWIntegralView *)integralView
{
    if (!_integralView) {
        WYWIntegralView *integralView = [[WYWIntegralView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 80)];
        integralView.backgroundColor = [UIColor whiteColor];
        integralView.tappedBlock = ^(NSInteger index){
            
            [self xx_cellClickAtView:self data:@(index)];
        };
        _integralView = integralView;
    }
    return _integralView;
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
