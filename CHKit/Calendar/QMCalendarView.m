//
//  QMCalendarView.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#define dtScreenWidth   [UIScreen mainScreen].bounds.size.width

#import "QMCalendarView.h"
#import "QMCalendarDayCell.h"
#import "QMCalendarFunction.h"
#import "UIColor+HUE.h"

@interface QMCalendarView () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIView * weekView;

@end

@implementation QMCalendarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
        QMCalendarFunction * calendarFunction =[[QMCalendarFunction alloc]init];
        NSArray * dateArr = [calendarFunction dayArrayWithYear:2017 withMonth:8];
        [self.dataArray addObjectsFromArray:dateArr];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLayout];
    }
    return self;
}

-(void)dayWithYear:(NSInteger)dayWithYear withMonth:(NSInteger)withMonth dataArray:(NSMutableArray *)dataArray{
    self.dataArray = [NSMutableArray array];
    QMCalendarFunction * calendarFunction =[[QMCalendarFunction alloc]init];
    NSArray * dateArr = [calendarFunction dayArrayWithYear:dayWithYear withMonth:withMonth];
    [self.dataArray addObjectsFromArray:dateArr];
}

/**
 *  布局界面
 */
- (void)setLayout{
    self.weekView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 50)];
    [self addSubview:self.weekView];
    
    [self setSubWeekData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize =CGSizeMake(dtScreenWidth/7, self.bounds.size.height);
    layout.minimumLineSpacing =0;
    layout.minimumInteritemSpacing =0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.weekView.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-CGRectGetHeight(self.weekView.frame)) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[QMCalendarDayCell class] forCellWithReuseIdentifier:NSStringFromClass([QMCalendarDayCell class])];
}

- (void)reloadData{
    [self.collectionView reloadData];
}


- (void)setSubWeekData{
    NSArray *weekData = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    CGFloat width = CGRectGetWidth(self.weekView.frame)/[weekData count];
    CGFloat height= CGRectGetHeight(self.weekView.frame);
    for (int i =0; i<weekData.count; i++) {
        UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        weekLabel.textColor = [UIColor VPTitleColor];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        weekLabel.font = [UIFont systemFontOfSize:14];
        weekLabel.text = weekData[i];
        [self.weekView addSubview:weekLabel];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    NSString * dateString =self.dataArray[indexPath.row];
    QMCalendarDayCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QMCalendarDayCell class]) forIndexPath:indexPath];
    if (![dateString isEqualToString:@""]&&dateString.length<2) {
        cell.dayLabel.text =[NSString stringWithFormat:@"0%@",dateString];
    }else{
        cell.dayLabel.text =dateString;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size =CGSizeMake(dtScreenWidth/7, 40);
    return size;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}


@end
