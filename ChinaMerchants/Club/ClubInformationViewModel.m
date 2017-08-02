//
//  ClubInformationViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubInformationViewModel.h"

@interface ClubInformationViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation ClubInformationViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
    }
    return self;
}

-(void)layerUI{
    
    XXCellModel *newClassCellModel = [XXCellModel instantiationWithIdentifier:@"ClubNewClassTableCell" height:80 dataSource:nil action:nil];
    [self.dataSource addObject:newClassCellModel];
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
