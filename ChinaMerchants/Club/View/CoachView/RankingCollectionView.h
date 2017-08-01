//
//  RankingCollectionView.h
//  iOS_FitnessApp
//
//  Created by  易述宏 on 2017/3/8.
//  Copyright © 2017年 iOS 周宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RankingCollectionViewDelegate <NSObject>

//-(void)rankingCollectionViewCell:(IntelligentModel*)model;

@end

@interface RankingCollectionView : UIView

- (void)focusImageItemsArray:(NSArray *)items count:(NSNumber *)count;

@property (strong, nonatomic)id <RankingCollectionViewDelegate>delegate;

@end
