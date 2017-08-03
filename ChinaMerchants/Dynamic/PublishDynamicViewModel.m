//
//  PublishDynamicViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "PublishDynamicViewModel.h"

@interface PublishDynamicViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSMutableArray * imageArray;
@end

@implementation PublishDynamicViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
        self.imageArray =[NSMutableArray array];
    }
    return self;
}

-(void)layerUI{
    
    
    //线
    XXCellModel *lineCellModel = [XXCellModel instantiationWithIdentifier:@"WYWLineTableViewCell" height:15 dataSource:nil action:nil];
    [self.dataSource addObject:lineCellModel];
    
    
//    [self.dataSource addObject:lineCellModel];
//
//    //内容
//    XXCellModel *conentCellModel = [XXCellModel instantiationWithIdentifier:@"PublishConentTableCell" height:50 dataSource:nil action:nil];
//    [self.dataSource addObject:conentCellModel];
    
    //图片
    XXCellModel *imageCellModel = [XXCellModel instantiationWithIdentifier:@"PublishImageTableCell" height:100 dataSource:self.imageArray  action:nil];
    [self.dataSource addObject:imageCellModel];
    
}

- (NSInteger)numberOfRows{
    
    return self.dataSource.count;
}

- (XXCellModel *)cellModelForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.dataSource[indexPath.row];
}

@end
