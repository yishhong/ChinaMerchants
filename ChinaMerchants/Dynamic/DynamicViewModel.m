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

@end
