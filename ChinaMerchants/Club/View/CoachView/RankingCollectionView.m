//
//  RankingCollectionView.m
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/8.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import "RankingCollectionView.h"
#import <Masonry.h>
#import "RankingCollectionViewCell.h"

@interface RankingCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView * collectionView;

@property (strong, nonatomic) NSArray * dataSource;

@property (assign, nonatomic) NSInteger count;

@end

@implementation RankingCollectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [NSArray array];
        self.count =0;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 5, 0, 5) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor =[UIColor whiteColor];
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(self.mas_trailing);
            make.leading.mas_equalTo(self.mas_leading);
            make.top.mas_equalTo(self.mas_top).offset(0);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        
        [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([RankingCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([RankingCollectionViewCell class])];

        self.collectionView.showsVerticalScrollIndicator=NO;
        self.collectionView.showsHorizontalScrollIndicator =NO;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
    }
    return self;
}


- (void)focusImageItemsArray:(NSArray *)items count:(NSNumber *)count{
    
    self.dataSource =[items mutableCopy];
    self.count = [count integerValue];
    [self.collectionView reloadData];
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
//        return self.dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.bounds.size.width/self.count, 90);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    IntelligentModel * intelligentModel =self.dataSource[indexPath.row];
    RankingCollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RankingCollectionViewCell class]) forIndexPath:indexPath];
//    cell.intelligentModel =intelligentModel;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

//    IntelligentModel * intelligentModel =self.dataSource[indexPath.row];
//    if ([self.delegate respondsToSelector:@selector(rankingCollectionViewCell:)]) {
//        [self.delegate rankingCollectionViewCell:intelligentModel];
//    }

}

@end
