//
//  ShareView.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^voidBloInteger)(NSInteger);

@interface ShareView : UIView

@property (copy , nonatomic) voidBloInteger blo;

+ (instancetype)shareViewWithData:(NSArray<NSString *>*)data;
- (instancetype)initWithData:(NSArray<NSString *>*)data;


@end
