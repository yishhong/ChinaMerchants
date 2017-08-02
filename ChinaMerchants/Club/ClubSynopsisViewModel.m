//
//  ClubSynopsisViewModel.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/1.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "ClubSynopsisViewModel.h"
#import "BannerModel.h"

@interface ClubSynopsisViewModel ()
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation ClubSynopsisViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
    }
    return self;
}

-(void)layerUI{
    
    BannerModel * bannerModel =[[BannerModel alloc]init];
    bannerModel.imgurl =@"http://m.tuniucdn.com/filebroker/cdn/olb/e3/64/e364837fe8694c7a7ba4639a062b454a_w370_h255_c1_t0.jpg";
    BannerModel * bannerModel1 =[[BannerModel alloc]init];
    bannerModel1.imgurl =@"http://pic2.cxtuku.com/00/13/20/b8690e62ca93.jpg";
    
    BannerModel * bannerModel2 =[[BannerModel alloc]init];
    bannerModel2.imgurl =@"http://pic2.16pic.com/00/16/43/16pic_1643836_b.jpg";
    
    NSArray * bannerArr =@[bannerModel,bannerModel1,bannerModel2];
    //banner图
    XXCellModel *bannerCellModel = [XXCellModel instantiationWithIdentifier:@"HomeBannerTableViewCell" height:160 dataSource:bannerArr action:nil];
    [self.dataSource addObject:bannerCellModel];
    
    XXCellModel *clubNameCellModel = [XXCellModel instantiationWithIdentifier:@"ClubNameTableCell" height:100 dataSource:nil action:nil];
    [self.dataSource addObject:clubNameCellModel];
    //线条
    XXCellModel *lineCellModel = [XXCellModel instantiationWithIdentifier:@"WYWLineTableViewCell" height:1 dataSource:nil action:nil];
    [self.dataSource addObject:lineCellModel];
    
    //地址
    XXCellModel *addressCellModel = [XXCellModel instantiationWithIdentifier:@"ClubAddressTableCell" height:70 dataSource:nil action:nil];
    [self.dataSource addObject:addressCellModel];
    [self.dataSource addObject:lineCellModel];

    //教练
    XXCellModel *coachCellModel = [XXCellModel instantiationWithIdentifier:@"ClubCoachTableCell" height:50 dataSource:nil action:nil];
    [self.dataSource addObject:coachCellModel];
    
    //教练头像
    XXCellModel *coachImageCellModel = [XXCellModel instantiationWithIdentifier:@"RankingImageViewTableViewCell" height:90 dataSource:nil action:nil];
    [self.dataSource addObject:coachImageCellModel];
    [self.dataSource addObject:lineCellModel];
    
    //课程表
    XXCellModel *coachSectionCellModel = [XXCellModel instantiationWithIdentifier:@"ClubSectionTableCell" height:50 dataSource:@"课程表" action:nil];
    [self.dataSource addObject:coachSectionCellModel];
    
    XXCellModel *classImageCellModel = [XXCellModel instantiationWithIdentifier:@"ClubClassImageTableCell" height:260 dataSource:nil action:nil];
    [self.dataSource addObject:classImageCellModel];
    [self.dataSource addObject:lineCellModel];
    
    //俱乐部视频
    XXCellModel *videoSectionCellModel = [XXCellModel instantiationWithIdentifier:@"ClubSectionTableCell" height:50 dataSource:@"俱乐部视频" action:nil];
    [self.dataSource addObject:videoSectionCellModel];
    
    XXCellModel *videoCellModel = [XXCellModel instantiationWithIdentifier:@"ClubVideoTableCell" height:120 dataSource:nil action:nil];
    [self.dataSource addObject:videoCellModel];


}

- (NSInteger)numberOfRows{
    
    return self.dataSource.count;
}

- (XXCellModel *)cellModelForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.dataSource[indexPath.row];
}

@end
