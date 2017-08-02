//
//  StudySignRecordViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "StudySignRecordViewModel.h"

@interface StudySignRecordViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation StudySignRecordViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
    }
    return self;
}

@end
