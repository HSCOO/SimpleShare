//
//  UIButton+Click.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/20.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "UIButton+Click.h"
#import <objc/message.h>

static const void *clickKey = &clickKey;

@implementation UIButton (Click)

-(void)setBtnClick:(Click)btnClick
{
 
    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
  
    objc_setAssociatedObject(self, clickKey, btnClick, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (Click)btnClick
{
    return objc_getAssociatedObject(self, clickKey);
}

- (void)click
{
    if (self.btnClick) {
        self.btnClick();
    }
}


@end
