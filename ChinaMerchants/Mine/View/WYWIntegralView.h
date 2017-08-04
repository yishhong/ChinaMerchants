//
//  WYWIntegralView.h
//  WYWProject
//
//  Created by  易述宏 on 2017/7/6.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYWIntegralItemLayout:UICollectionViewFlowLayout

@end

typedef void(^WYWIntegralViewItemTappedBlock)(NSInteger index);

@interface WYWIntegralView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *reformerData;

@property (nonatomic, copy) WYWIntegralViewItemTappedBlock tappedBlock;

@end
