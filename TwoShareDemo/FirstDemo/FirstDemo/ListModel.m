//
//  ListModel.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ListModel.h"


@implementation ListModel

+ (instancetype)modelWithDic:(NSDictionary *)dic
{
    ListModel *model = [[ListModel alloc]initWithDic:dic];
    return model;
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    [self setValuesForKeysWithDictionary:dic];
    return self;
}

@end
