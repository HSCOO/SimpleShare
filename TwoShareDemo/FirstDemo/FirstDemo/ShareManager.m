//
//  ShareManager.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/23.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ShareManager.h"
#import "ShareView.h"

@implementation ShareManager

+ (ShareView *)shareWithData:(NSArray<NSString *> *)data
{
    return [ShareView shareViewWithData:data];
}

+ (void)shareWithModel:(ShareModel *)model Type:(NSInteger)type
{
    switch (type) {
        case targetTypeCustom:
        {
            NSLog(@"targetTypeCustom");
        }
            break;
        case targetTypeWeibo:
        {
            NSLog(@"targetTypeWeibo");
        }
            break;
            
        default:
            break;
    }
}

@end
