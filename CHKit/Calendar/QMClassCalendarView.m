//
//  QMClassCalendarView.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/2.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#define dtScreenWidth   [UIScreen mainScreen].bounds.size.width

#import "QMClassCalendarView.h"
#import "QMCalendarFunction.h"
#import "QMCalendarDayCell.h"

@interface QMClassCalendarView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation QMClassCalendarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
        QMCalendarFunction * calendarFunction =[[QMCalendarFunction alloc]init];
        NSArray * dateArr = [calendarFunction year:2017 withMonth:8];
        [self.dataArray addObjectsFromArray:dateArr];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)dayWithYear:(NSInteger)dayWithYear withMonth:(NSInteger)withMonth dataArray:(NSMutableArray *)dataArray{
    self.dataArray = [NSMutableArray array];
    QMCalendarFunction * calendarFunction =[[QMCalendarFunction alloc]init];
    NSArray * dateArr = [calendarFunction year:dayWithYear withMonth:withMonth];
    [self.dataArray addObjectsFromArray:dateArr];
    [self setLayout];
}

/**
 *  布局界面
 */
- (void)setLayout{
    
    if (!self.collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize =CGSizeMake(dtScreenWidth/7, self.bounds.size.height);
        layout.minimumLineSpacing =0;
        layout.minimumInteritemSpacing =0;
        layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:layout];
        self.collectionView.delegate = self;
        NSInteger count =self.dataArray.count/7;
        NSInteger modCount =self.dataArray.count%7;
        self.collectionView.contentSize =CGSizeMake(dtScreenWidth*count+dtScreenWidth*modCount, self.bounds.size.height);
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.showsVerticalScrollIndicator=NO;
        self.collectionView.bounces =NO;
        self.collectionView.pagingEnabled =YES;
        self.collectionView.showsHorizontalScrollIndicator =NO;
        [self addSubview:self.collectionView];
    }
    [self.collectionView registerClass:[QMCalendarDayCell class] forCellWithReuseIdentifier:NSStringFromClass([QMCalendarDayCell class])];
    [self.collectionView reloadData];
}

- (void)reloadData{
    [self.collectionView reloadData];
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

    CGSize size =CGSizeMake(dtScreenWidth/7, self.bounds.size.height);
    return size;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
