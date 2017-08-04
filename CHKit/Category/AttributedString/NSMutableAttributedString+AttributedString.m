
//
//  NSMutableAttributedString+AttributedString.m
//  VillagePlay
//
//  Created by  易述宏 on 2016/11/30.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "NSMutableAttributedString+AttributedString.h"
#import <UIKit/UIKit.h>
#import "UIColor+HUE.h"

@implementation NSMutableAttributedString (AttributedString)

- (NSMutableAttributedString *)attributedString:(NSString *)string{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
//    long number = -3;
//    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
//    [attributedString addAttribute:NSKernAttributeName value:(__bridge id)num range:NSMakeRange(0,1)];
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} range:NSMakeRange(0,1)];
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} range:NSMakeRange(attributedString.length-3,3)];
    [attributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor VPRedColor]} range:NSMakeRange(0,attributedString.length)];
//    不需要处理最后的文字大小 只需要处理文字间的间距
//    [attributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.6196 green:0.6196 blue:0.6196 alpha:1.0],NSFontAttributeName:[UIFont systemFontOfSize:11]} range:NSMakeRange(attributedString.length-1,1)];
//    CFRelease(num);
    return attributedString;
}

-(NSMutableAttributedString *)priceAttributedString:(NSString *)priceString font:(CGFloat)font range:(NSRange)range color:(UIColor *)color{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:priceString];
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} range:range];
    [attributedString addAttributes:@{NSForegroundColorAttributeName:color} range:NSMakeRange(0,attributedString.length)];
    return attributedString;
}

-(NSMutableAttributedString *)glineAttributedString:(NSString *)glineString{

    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:glineString attributes:attribtDic];
    return attribtStr;
}

- (NSMutableAttributedString *)attributedString:(NSString *)contentString paragraph:(CGFloat)paragraph headIndent:(CGFloat)headIndent{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:paragraph];//调整行间距
    [paragraphStyle setFirstLineHeadIndent:headIndent];//首行
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentString length])];
    return attributedString;
}

- (NSMutableAttributedString *)rangeAttributedString:(NSString *)allString changeColorString:(NSString *)changeColorString{

    NSRange range;
    range = [allString rangeOfString:changeColorString];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:allString];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:[UIColor VPOrderColor]
     
                          range:NSMakeRange(range.location, range.length)];
    return AttributedStr;
}

- (NSMutableAttributedString *)changeColorString:(NSString *)changeColorString location:(NSInteger)location length:(NSInteger)length{

    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:changeColorString];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:[UIColor VPOrderColor]
     
                          range:NSMakeRange(location, length)];
    return AttributedStr;
}


@end
