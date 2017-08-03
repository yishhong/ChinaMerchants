//
//  PublishImageTableCell.m
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/8/3.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#import "PublishImageTableCell.h"
#import "UITableViewCell+DataSource.h"
#import "XXCellModel.h"
#import "QMImagePicker.h"
#import "QMAssetsPicker.h"
#import "QMPhotoCollectionPreviewController.h"
#import "UIAlertController+Camera.h"
#import "RootController.h"
#import "BaseNavigationController.h"
#import "PublishImageCollectionCell.h"


#define MAXImageCount 9

@interface PublishImageTableCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) QMImagePicker *imagePicker;
@property (strong, nonatomic) QMAssetsPicker *assetsPicker;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) QMPhotoCollectionPreviewController * photoCollectionPerview;

@end

@implementation PublishImageTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageArray = [NSMutableArray array];
    // Initialization code
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor =[UIColor redColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PublishImageCollectionCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([PublishImageCollectionCell class])];
    
}

- (void)xx_configCellWithEntity:(id)entity{
    XXCellModel *cellModel = entity;
    self.imageArray = cellModel.dataSource;
    if([self.imageArray count]==0){
        [self.imageArray addObject:@{@"type":@0,@"image":[UIImage imageNamed:@"icon_xc"]}];
    }
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.imageArray count]>MAXImageCount?MAXImageCount:[self.imageArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PublishImageCollectionCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PublishImageCollectionCell class]) forIndexPath:indexPath];
    [cell xx_configCellWithEntity:self.imageArray[indexPath.row]];
    return cell;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *imageInfo = [self.imageArray objectAtIndex:indexPath.row];
    if(![imageInfo[@"type"] isEqual:@(0)]){
        [self showIndex:indexPath.row];
        return;
    }
    
    UIAlertController * alertController = [UIAlertController selectCameraOrPhotoBlock:^(NSInteger index) {
        if(index==0){
            //相机
            [self pickImageFromCamera];
        }else{
            //相册
            [self pickImageFromAlbum];
        }
    }];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}



- (void)pickImageFromCamera{
    
    if(!self.imagePicker){
        self.imagePicker = [[QMImagePicker alloc] init];
    }
    [self.imagePicker imagePickerWithController:[UIApplication sharedApplication].keyWindow.rootViewController block:^(BOOL isSourceTypeAvailable, AVAuthorizationStatus authorizationStatus, UIImage *image) {
        if(isSourceTypeAvailable){
            if(authorizationStatus == AVAuthorizationStatusAuthorized){
                if(image){
                    //转换图片
                    [self.imageArray insertObject:@{@"type":@1,@"image":image} atIndex:0];
                    [self.collectionView reloadData];
                    
//                    self.lb_title.text = [NSString  stringWithFormat:@"已选%zd张,最多可选9张",[self.imageArray count]>MAXImageCount?MAXImageCount:[self.imageArray count]-1];
                    
                    //                    [self.viewModel selectPhotoImage:image];
                    //                    [self.tableView reloadData];
                }
            }else{
                UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"相机授权" message:@"没有权限访问您的相机，请在“设置－隐私－相机”中允许使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
                [alterView show];
            }
        }else{
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:@"您的设置暂不支持相机功能" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
        }
    }];
    
}

-(void)pickImageFromAlbum{
    //利用第三方的相册选择
    if(!self.assetsPicker){
        self.assetsPicker = [[QMAssetsPicker alloc] init];
    }
    //    self.assetsPicker.maxNumber = [self.viewModel selectImageCount];
    [self.assetsPicker showAssetsPickerWithController:[UIApplication sharedApplication].keyWindow.rootViewController amount:9-[self.imageArray count]+1 isReserve:NO withBlock:^(PHAuthorizationStatus status, NSArray *images) {
        if(status != PHAuthorizationStatusAuthorized){
            //提示用户
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"相册授权" message:@"没有权限访问您的相册，请在“设置－隐私－相册”中允许使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alterView show];
            return ;
        }else{
            NSInteger i = 0;
            for (UIImage *image in images) {
                [self.imageArray insertObject:@{@"type":@1,@"image":image} atIndex:i];
                i++;
            }
            [self.collectionView reloadData];
//            self.lb_title.text = [NSString  stringWithFormat:@"已选%zd张,最多可选9张",[self.imageArray count]>MAXImageCount?MAXImageCount:[self.imageArray count]-1];
            
            //            [self.viewModel selectPhotoImage:image];
            //            [self.tableView reloadData];
        }
    }];
    //    [self.assetsPicker showAssetsPickerWithController:self withBlock:^(PHAuthorizationStatus status, NSArray *images) {
    //
    //        //这里获取取到的图片数据
    ////        [self.viewModel addImages:images];
    //        //这里后续修改成刷新指定行的数据
    ////        [self.tableView reloadData];
    //    }];
}



- (void)showIndex:(NSInteger)index{
    //    预览
    if(self.photoCollectionPerview){
        self.photoCollectionPerview = nil;
    }
    QMPhotoCollectionPreviewController *photoCollectionPerview = [QMPhotoCollectionPreviewController instantiation];
    self.photoCollectionPerview = photoCollectionPerview;
    __weak typeof(PublishImageTableCell) * weakSelf = self;
    
    self.photoCollectionPerview.selectedIndex = index;
    self.photoCollectionPerview.totalCount= ^NSInteger{
        if([weakSelf.imageArray count]==1){
            return 0;
        }
        return [weakSelf.imageArray count]>MAXImageCount?MAXImageCount:[weakSelf.imageArray count]-1;
    };
    self.photoCollectionPerview.imageForIndex = ^ id (NSInteger index){
        if(index>[weakSelf.imageArray count]){
            return nil;
        }
        return [weakSelf.imageArray objectAtIndex:index][@"image"];
    };
    
    self.photoCollectionPerview.removeImageAtIndex = ^(NSInteger index){
        
        if([weakSelf.imageArray count]==1){
            return ;
        }
        [weakSelf.imageArray removeObjectAtIndex:index];
        
        [weakSelf.collectionView reloadData];
    };
    RootController *tabBarVC = (RootController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    BaseNavigationController * navigationVC = [tabBarVC.viewControllers objectAtIndex:0];
    [navigationVC pushViewController:self.photoCollectionPerview animated:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
