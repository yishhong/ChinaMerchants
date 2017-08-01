//
//  UIImageView+Load.m
//  WYWProject
//
//  Created by Apricot on 2017/7/10.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import "UIImageView+Load.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Load)


- (void)xx_setImageWithURLStr:(NSString *)imageURLStr placeholder:(UIImage *)placeholder{
//#warning 需要判断是不是使用的七牛的图片
    NSURL *imageUrl = nil;
//    if([imageURLStr rangeOfString:@"image.xiaxiangke.com"].location != NSNotFound){
//        NSString * params = [NSString stringWithFormat:@"?imageView2/0/w/%0.0f/h/%0.0f",self.bounds.size.width*2,self.bounds.size.height*2];
//        //        NSString * params = [NSString stringWithFormat:@"?imageView2/0/w/%0.0f",self.bounds.size.width*2];
//        
//        
//        //        NSString *params = @"?imageslim";
//        imageUrl = [NSURL URLWithString:[imageURLStr stringByAppendingString:params]];
//        NSLog(@"ImageURL:::>>>%@",imageUrl.absoluteString);
//    }else{
//    }
//    //    if(!placeholder){
//    //        placeholder = [UIImage imageNamed:@"vp _destination_playList_Iamge"];
//    //    }
    
    imageUrl = [NSURL URLWithString:imageURLStr];

    if(!imageUrl){
        imageUrl = [NSURL URLWithString:@""];
    }
    if(!placeholder){
        placeholder = [UIImage imageNamed:@"vp_topic_Image"];
    }
    
    [self sd_setImageWithURL:imageUrl placeholderImage:placeholder];
    
    //    [self yy_setImageWithURL:imageUrl placeholder:placeholder];
}
- (void)xx_setImageWithURLStr:(NSString *)imageURLStr{
    [self xx_setImageWithURLStr:imageURLStr placeholder:nil];
}

@end
