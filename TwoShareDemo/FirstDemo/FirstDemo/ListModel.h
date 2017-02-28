//
//  ListModel.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/27.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

//tip:分享列表的模型

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (copy , nonatomic ,readonly) NSString * iconName;
@property (copy , nonatomic ,readonly) NSString * titleStr;

+ (instancetype)modelWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
