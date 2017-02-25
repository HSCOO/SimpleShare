//
//  ShareView.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareView : UIView

+ (instancetype)shareViewWithData:(NSArray<NSString *>*)data;
- (instancetype)initWithData:(NSArray<NSString *>*)data;


@end
