//
//  StudyClassSummaryViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "StudyClassSummaryViewModel.h"

@interface StudyClassSummaryViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation StudyClassSummaryViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
    }
    return self;
}

@end