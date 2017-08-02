//
//  QMCalendarFunction.m
//  HotelBusiness
//
//  Created by Apricot on 16/8/9.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "QMCalendarFunction.h"

@interface QMCalendarFunction ()
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDateComponents *nowDateComponents;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;

@end

@implementation QMCalendarFunction
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.calendar = [NSCalendar currentCalendar];
    }
    return self;
}

- (void)nowDate{
    if(!self.nowDateComponents){
        NSDate *firstDay = [NSDate date];
        self.nowDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:firstDay];
//        self.year = dateComponents.year;
//        self.month = dateComponents.month;
//        self.day = dateComponents.day;
    }
}

- (NSDate *)futureYear:(NSInteger)yearTime{
    NSDate *futureDate = nil;
    if(!self.nowDateComponents){
        [self nowDate];
    }
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = self.nowDateComponents.year+yearTime;
    dayComponents.month = self.nowDateComponents.month;
    dayComponents.day = self.nowDateComponents.day;
    futureDate = [self.calendar dateFromComponents:dayComponents];
    return futureDate;
}

- (NSDate *)futureMonth:(NSInteger)monthTime{
    NSDate *futureDate = nil;
    if(!self.nowDateComponents){
        [self nowDate];
    }
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = self.nowDateComponents.year;
    dayComponents.month = self.nowDateComponents.month+monthTime;
    dayComponents.day = self.nowDateComponents.day;
    futureDate = [self.calendar dateFromComponents:dayComponents];
    return futureDate;
}

- (NSDate *)transformDateWithYear:(NSInteger)year withMonth:(NSInteger)month{
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = year;
    dayComponents.month = month;
    dayComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:dayComponents];
    return date;
}

-(NSArray *)nowBeginToEndInEndDate:(NSDate *)enddate{
    return [self beginTime:[NSDate date] endTime:enddate];
}

-(NSArray *)beginTime:(NSDate *)beginDate endTime:(NSDate *)endDate{
    NSMutableArray *dateArray = [NSMutableArray array];
    NSDateComponents *beginDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:beginDate];
    NSDateComponents *endDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:endDate];
    //年
    NSInteger beginYear = beginDateComponents.year;
    NSInteger endYear  = endDateComponents.year;
    
    for (NSInteger year = beginYear; year <= endYear; year++) {
        NSInteger beginMonth = 1;
        NSInteger endMonth = 12;

        if (year == beginYear) {
            beginMonth = beginDateComponents.month;
        }
        if (year == endYear){
            endMonth = endDateComponents.month;
        }
        for (NSInteger month = beginMonth; month <= endMonth; month++) {
            NSMutableDictionary *monthDict = [NSMutableDictionary dictionary];
            monthDict[@"year"] = @(year);
            monthDict[@"month"] = @(month);
            NSArray *array = [self dayArrayWithYear:year withMonth:month];
            monthDict[@"days"] = array;
            [dateArray addObject:monthDict];
        }
    }
    return dateArray;
}

- (NSArray *)yearAndMonthWithDate:(NSDate *)endDate{
    NSDate *beginDate = [NSDate date];
    NSDateComponents *beginDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:beginDate];
    NSDateComponents *endDateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:endDate];
    //年
    NSInteger beginYear = beginDateComponents.year;
    NSInteger endYear  = endDateComponents.year;
    
    NSMutableArray *dateArray = [NSMutableArray array];
    
    for (NSInteger year = beginYear; year <= endYear; year++) {
        NSMutableDictionary *yearDict = [NSMutableDictionary dictionary];
        yearDict[@"year"] = @(year);
        NSInteger beginMonth = 1;
        NSInteger endMonth = 12;
        
        if (year == beginYear) {
            beginMonth = beginDateComponents.month;
        }
//        if (year == endYear){
//            endMonth = endDateComponents.month;
//        }
        NSMutableArray * monthArray = [NSMutableArray array];
        for (NSInteger month = beginMonth; month <= endMonth; month++) {
            [monthArray addObject:@(month)];
        }
        yearDict[@"month"] = monthArray;
        [dateArray addObject:yearDict];
    }
    return dateArray;
}

- (NSArray *)dayArrayWithYear:(NSInteger)year withMonth:(NSInteger)month{
    //获取指定月年份的数据
    NSMutableArray *array = [NSMutableArray array];
    
    self.calendar.firstWeekday = 1;
    self.calendar.minimumDaysInFirstWeek = 1;
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = year;
    dayComponents.month = month;
    dayComponents.day = 1;
    
    NSDate *firstDay = [self.calendar dateFromComponents:dayComponents];
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:firstDay];
    
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDay];
    NSInteger frontBlankCount = dateComponents.weekday - self.calendar.firstWeekday;
    if(frontBlankCount < 0){
        frontBlankCount +=7;
    }
    //空白
    for (int i = 0; i<frontBlankCount; i++) {
        [array addObject:@""];
    }
    for (int i = 0; i<range.length; i++) {
        NSString *day = [NSString stringWithFormat:@"%d",i+1];
        [array addObject:day];
    }
    return array;
}

- (NSArray *)year:(NSInteger)year withMonth:(NSInteger)month{

    //获取指定月年份的数据
    NSMutableArray *array = [NSMutableArray array];
    
    self.calendar.firstWeekday = 1;
    self.calendar.minimumDaysInFirstWeek = 1;
    NSDateComponents * dayComponents = [[NSDateComponents alloc] init];
    dayComponents.year = year;
    dayComponents.month = month;
    dayComponents.day = 1;
    
    NSDate *firstDay = [self.calendar dateFromComponents:dayComponents];
    NSDateComponents *dateComponents = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:firstDay];
    
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDay];
    NSInteger frontBlankCount = dateComponents.weekday - self.calendar.firstWeekday;
    if(frontBlankCount < 0){
        frontBlankCount +=7;
    }
//    //空白
//    for (int i = 0; i<frontBlankCount; i++) {
//        [array addObject:@""];
//    }
    for (int i = 0; i<range.length; i++) {
        NSString *day = [NSString stringWithFormat:@"%d",i+1];
        [array addObject:day];
    }
    return array;
}

- (NSInteger)getWeekWithDayArray:(NSArray *)dayArray{
    //获取指定数据模型里有多少个周
    NSInteger weeks = dayArray.count/7;
    NSInteger days = dayArray.count %7;
    if(days >0){
        weeks++;
    }
    return weeks;
}

/**
 *  获取一天的时间
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)getDayTime{

    NSMutableArray * timeArray =[[NSMutableArray alloc]init];
    for (int i=1; i<=24; i++) {
        NSString *timeString =[NSString stringWithFormat:@"%d:00",i];
        [timeArray addObject:timeString];
    }
    return timeArray;
}

@end
