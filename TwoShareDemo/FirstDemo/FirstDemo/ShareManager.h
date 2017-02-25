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


+ (__kindof ShareView *)shareWithData:(NSArray<NSString *> *)data;

+ (void)shareWithModel:(ShareModel *)model Type:(NSInteger)type;


@end
