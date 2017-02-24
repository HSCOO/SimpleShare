//
//  UIButton+Click.h
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/20.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Click)(void);

@interface UIButton (Click)

@property (copy, nonatomic)Click btnClick;

@end
