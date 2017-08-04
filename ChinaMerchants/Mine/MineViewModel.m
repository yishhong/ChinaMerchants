//
//  MineViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "MineViewModel.h"

@interface MineViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSArray * mineArray;
@end

@implementation MineViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
        self.mineArray =@[@{@"image":@"login_icon",
                            @"title":@"我的动态"},
                          @{@"image":@"login_icon",
                            @"title":@"转介绍"},
                          @{@"image":@"login_icon",
                            @"title":@"商城"}];
    }
    return self;
}

-(void)layerUI{
    
   //头部
    XXCellModel *mineHeadCellModel = [XXCellModel instantiationWithIdentifier:@"MineLoginTableCell" height:180 dataSource:nil action:nil];
    [self.dataSource addObject:mineHeadCellModel];
    
    XXCellModel *integralCellModel = [XXCellModel instantiationWithIdentifier:@"WYWIntegralTableCell" height:80 dataSource:nil action:nil];
    [self.dataSource addObject:integralCellModel];
    //线条
    XXCellModel *lineCellModel = [XXCellModel instantiationWithIdentifier:@"WYWLineTableViewCell" height:15 dataSource:nil action:nil];
    [self.dataSource addObject:lineCellModel];
    
    for (NSDictionary * info in self.mineArray) {
     
        XXCellModel *mineCellModel = [XXCellModel instantiationWithIdentifier:@"MineTableCell" height:49 dataSource:info action:nil];
        [self.dataSource addObject:mineCellModel];
    }
    [self.dataSource addObject:lineCellModel];
    
    //设置
    XXCellModel *settingCellModel = [XXCellModel instantiationWithIdentifier:@"MineTableCell" height:49 dataSource:@{@"image":@"login_icon",
                               @"title":@"设置"} action:nil];
    [self.dataSource addObject:settingCellModel];
}

- (NSInteger)numberOfRows{
    
    return self.dataSource.count;
}

- (XXCellModel *)cellModelForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.dataSource[indexPath.row];
}

@end
