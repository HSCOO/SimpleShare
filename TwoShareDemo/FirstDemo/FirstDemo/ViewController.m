//
//  ViewController.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ViewController.h"
#import "ShareManager.h"
#import "Header.h"
#import "ShareModel.h"
#import "ShareView.h"
#import "ListModel.h"

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
        ListModel *model = [ListModel modelWithDic:dic];
        [dataArr addObject:model];
    }
    
    __weak typeof(self) weakSelf = self;
    btn.btnClick = ^{
        
        //创建分享列表
        ShareView *view = [ShareManager getShareViewWithData:dataArr];
        [weakSelf.view addSubview:view];
        
        //列表点击事件，分享
        view.blo = ^(targetType type){
        
            ShareModel *model = [[ShareModel alloc]init];
            model.shareImage = [[NSBundle mainBundle] pathForResource:@"tree" ofType:@"png"];
            model.urlSchems = @"seconddemo://";
            model.shareText = @"This is share";
            model.shareURL = @"https://www.vecteezy.com/vector-art/81839-set-of-flat-autumn-vector-trees";
            
            [ShareManager shareWithModel:model Type:type];
        };
    };
}


@end
