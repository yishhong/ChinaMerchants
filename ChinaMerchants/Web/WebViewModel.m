//
//  WebViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/4.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "WebViewModel.h"

@interface WebViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation WebViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
    }
    return self;
}

@end
