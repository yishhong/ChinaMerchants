//
//  QMClassCalendarView.h
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QMClassCalendarViewDelegate <NSObject>

- (void)calendarSelectDay:(NSInteger)day withMonth:(NSInteger)month withyear:(NSInteger)year;

@end

@interface QMClassCalendarView : UIView

@property (nonatomic, weak) id<QMClassCalendarViewDelegate>delegate;
/**
 *
 */
@property (nonatomic, strong) UICollectionView *collectionView;

/**
 *  数据源
 */
@property (nonatomic, strong) NSMutableArray * dataArray;
/**
 *  值的字典（通过年月入获取）
 */
@property (nonatomic, strong) NSDictionary *valueDict;
/**
 *  布局界面
 */
- (void)setLayout;
/**
 *  更新数据
 */
- (void)reloadData;

/**
 根据年月获取数据
 
 @param dayWithYear 年
 @param withMonth 月
 @param dataArray 签到、签退、未签到、迟到
 */
-(void)dayWithYear:(NSInteger)dayWithYear withMonth:(NSInteger)withMonth dataArray:(NSMutableArray *)dataArray;

@end
