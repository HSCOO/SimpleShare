//
//  ShareModel.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/23.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareModel : NSObject

@property (copy , nonatomic ,readonly) NSString * iconName;
@property (copy , nonatomic ,readonly) NSString * titleStr;

@property (copy , nonatomic ) NSString * urlSchems;
@property (copy , nonatomic ) NSString * shareImage;
@property (copy , nonatomic ) NSString * shareText;
@property (copy , nonatomic ) NSString * shareURL;

+ (instancetype)modelWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
