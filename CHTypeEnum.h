//
//  CHTypeEnum.h
//  ChinaMerchants
//
//  Created by 易述宏 on 2017/7/31.
//  Copyright © 2017年 iOS 易述宏. All rights reserved.
//

#ifndef CHTypeEnum_h
#define CHTypeEnum_h

//文章类型(
//101 创业培训 正在报名
//102 创业培训 报名结束
//103 招商项目
//104 乡村旅游
//105 外卖服务
//106 家政信息
//107 中介信息
//108 贴息贷款
//109 家电维修
//110 水电安装
//111贷款政策
//112 贷款流程
//113 贴息流程
//114 信息公示)
typedef enum : NSUInteger {
    HometrainingSignUpType        =   101 ,//创业培训 正在报名
    HometrainingEndSignUpType     =  102 ,//创业培训 报名结束xiang
    HomeProjectType               =  103 ,//招商项目
    HomeVillageTravelType         =  104 ,//乡村旅游
    HomeTakeOutServiceType        =  105,//外卖服务
    HomeHousekeepingInformationType   =  106,//家政信息
    HomeMediationInformationType      =  107,//中介信息
    HomeDiscountLoanType          =  108,//贴息贷款
    HomeApplianceMaintenanceType  = 109,//家电维修
    HomeHydroelectricInstallType  = 110,//家电维修
    HomeLoansPolicyType           = 111,//贷款政策
    HomeLoansFlowType             = 112,//贷款流程
    HomeDiscountFlowType          = 113,//贴息流程
    HomeInformationBillboardType  = 114,//信息公示
}ArticleType;

#endif /* CHTypeEnum_h */
