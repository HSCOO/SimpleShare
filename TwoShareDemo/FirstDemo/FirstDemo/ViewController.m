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
#import "ShareModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 60,(SCREEN_WIDTH - 20), 40)];
    [btn setTitle:@"Share" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor magentaColor]];
    [self.view addSubview:btn];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ListData" ofType:@"plist"];
    NSArray *plistArr = [[NSArray alloc]initWithContentsOfFile:plistPath];
    
    NSMutableArray *dataArr = [NSMutableArray array];
    for (NSDictionary *dic in plistArr)
    {
        ShareModel *model = [ShareModel modelWithDic:dic];
        [dataArr addObject:model];
    }
    
    __weak typeof(self) weakSelf = self;
    btn.btnClick = ^{
        
        [weakSelf.view addSubview:[ShareView shareWithListData:dataArr]];
    };
}


@end
