//
//  ViewController.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ViewController.h"
#import "ShareView.h"
#import "Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 60,(SCREEN_WIDTH - 10) / 2, 40)];
    [btn setTitle:@"Share" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor magentaColor]];
    [self.view addSubview:btn];
    
    __weak typeof(self) weakSelf = self;
    btn.btnClick = ^{
        
        NSArray *arr = @[@"sinaweibo@3x",@"sinaweibo"];
        [weakSelf.view addSubview:[ShareView shareWithListData:arr]];
    };
}


@end
