//
//  UIColor+HUE.m
//  HotelBusiness
//
//  Created by  易述宏 on 16/7/21.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UIColor+HUE.h"

@implementation UIColor (HUE)

+ (UIColor *)navigationBarTintColor{
    return [UIColor whiteColor];
}

+ (UIColor *)navigationTintColor{
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"MainColor"]];
//    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"navgationColor"]];
    return [UIColor colorWithRed:78.0f/255.0f green:181.0f/225.0f blue:131.0f/225.0f alpha:1.0f];
}

+ (UIColor *)navigationTitleColor{
    return [self colorWithRed:11.00f/255.00f green:30.00f/255.00f blue:48.00f/255.00f alpha:1.0f];
}

+ (UIColor *)navigationBottonLineView{
    return  [UIColor colorWithRed:177.0/255.0 green:177.0/255.0 blue:177.0/255.0 alpha:1.0];
}

+ (UIColor *)tabBarTintColor{
    return [UIColor whiteColor];
}

+ (UIColor *)tabTintColor{
    return [self navigationTintColor];
}

+ (UIColor *)textColor{
    return [self navigationBarTintColor];
}

+ (UIColor *)septalLineColor{
    return [UIColor colorWithRed:193.0f/255.0f green:193.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
}

+ (UIColor *)controllerBackgroundColor{
    return [UIColor colorWithRed:240.0f/255.0f green:243.0f/255.0f blue:246.0f/255.0f alpha:1.0f];
}

+ (UIColor *)blackTextColor{
    return [UIColor colorWithRed:10.0f/255.0f green:30.0f/255.0f blue:48.0f/255.0f alpha:1.0f];
}

+(UIColor *)VPRedColor{

    return [UIColor colorWithRed:242.0f/255.0f green:48.0f/225.0f blue:48.0f/225.0f alpha:1.0f];
}

+(UIColor *)VPDetailColor{

    return [UIColor colorWithRed:168.0f/225.0f green:168.0f/225.0 blue:168.0f/225.0f alpha:1.0f];
}

+(UIColor *)VPTitleColor{

    return [UIColor colorWithRed:35.0f/255.0f green:38.0f/225.0f blue:38.0f/225.0f alpha:1.0f];

}

+(UIColor *)VPContentColor{

    return [UIColor colorWithRed:104.0f/255.0f green:104.0f/225.0f blue:104.0f/225.0f alpha:1.0f];

}

+(UIColor *)VPBackgroundColor{

    return [UIColor colorWithRed:226.4f/255.0f green:199.7f/225.0f blue:200.8f/225.0f alpha:1.0f];

}

+(UIColor *)orderColor{

    return [UIColor colorWithRed:255.4f/255.0f green:85.0f/225.0f blue:0.0f/225.0f alpha:1.0f];
}

@end
