//
//  UIScrollView+Empty.h
//  IOS_JJD
//
//  Created by Apricot on 2017/4/27.
//  Copyright © 2017年 HNTH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

@interface UIResponder (Empty)<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

/**
 *  isShowType 显示的类型 1 为空数据及 -1为无网络
 */
@property (nonatomic, assign) NSNumber * showViewType;

/**
 *  显示无数据以及网络错误的页面
 *
 *  @param code    code码
 *  @param message 错误信息
 */
- (void)isShowViewType:(NSInteger)code message:(NSString *)message;

@end
