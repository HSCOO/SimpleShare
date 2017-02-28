//
//  ShareManager.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/23.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShareModel;
@class ShareView;
typedef NS_ENUM(NSInteger,targetType)
{
    targetTypeCustom = 0,
    targetTypeWeibo,
    targetTypeWeixin
};

@interface ShareManager : NSObject

/**
 * 创建分享列表
 */
+ (ShareView *)getShareViewWithData:(NSArray<NSString *> *)data;

/**
 * 根据分享模型和类型分享
 */
+ (void)shareWithModel:(ShareModel *)model Type:(NSInteger)type;


@end
