//
//  ShareManager.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/23.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,targetType)
{
    targetTypeCustom = 0,
    targetTypeWeibo,
    targetTypeWeixin
};


@interface ShareManager : NSObject

@end
