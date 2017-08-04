//
//  WYWIntegralView.m
//  WYWProject
//
//  Created by  易述宏 on 2017/7/6.
//  Copyright © 2017年 Apricot. All rights reserved.
//
#define kGridItemWidth   (dtScreenWidth/3)
#define kGridItemHeight  kGridItemWidth

#define dtScreenWidth    ([UIScreen mainScreen].bounds.size.width)

#import "WYWIntegralView.h"
#import "UIColor+HUE.h"
#import "WYWHomeGirdItemModel.h"
#import "WYWIntegralCollectionCell.h"


@implementation WYWIntegralItemLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.itemSize = CGSizeMake(kGridItemWidth, 80);
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsZero;
    }
    
    return self;
}

@end

@interface WYWIntegralView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation WYWIntegralView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withLayout:nil];
}

- (id)initWithFrame:(CGRect)frame withLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithFrame:frame]) {
        
        self.layout = layout;
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    if (!_collectionView) {
        if (!self.layout) {
            self.layout =  [[WYWIntegralItemLayout alloc] init];
        }
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor =self.backgroundColor;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollEnabled =NO;
        [self addSubview:_collectionView];
        
        [self.collectionView registerClass:[WYWIntegralCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([WYWIntegralCollectionCell class])];
    }
    
}


#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.reformerData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYWHomeGirdItemModel *model = self.reformerData[indexPath.row];
    WYWIntegralCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WYWIntegralCollectionCell class]) forIndexPath:indexPath];
    cell.numberLabel.text =model.number;
    cell.titleLabel.text =model.title;
    return cell;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (self.tappedBlock) {
        self.tappedBlock(indexPath.row);
    }
}


#pragma mark -- Setter && Getter
- (NSMutableArray *)reformerData
{
    if (!_reformerData) {
        _reformerData = [@[] mutableCopy];
    }
    return _reformerData;
}

@end
