//
//  ShareModel.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/23.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ShareModel.h"

@implementation ShareModel

+ (instancetype)modelWithDic:(NSDictionary *)dic
{
    ShareModel *model = [[ShareModel alloc]initWithDic:dic];
    return model;
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    [self setValuesForKeysWithDictionary:dic];
    return self;
}


@end
