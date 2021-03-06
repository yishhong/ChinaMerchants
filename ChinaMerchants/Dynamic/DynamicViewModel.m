//
//  DynamicViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "DynamicViewModel.h"

@interface DynamicViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation DynamicViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
    }
    return self;
}


-(void)layerUI{
    
    //banner图
    XXCellModel *bannerCellModel = [XXCellModel instantiationWithIdentifier:@"HomeBannerTableViewCell" height:160 dataSource:nil action:nil];
    //线条
    XXCellModel *lineCellModel = [XXCellModel instantiationWithIdentifier:@"WYWLineTableViewCell" height:1 dataSource:nil action:nil];
    [self.dataSource addObject:lineCellModel];
    
    
    
}

- (NSInteger)numberOfRows{
    
    return self.dataSource.count;
}

- (XXCellModel *)cellModelForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.dataSource[indexPath.row];
}

@end
