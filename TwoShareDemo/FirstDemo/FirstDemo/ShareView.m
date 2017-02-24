//
//  ShareView.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/19.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ShareView.h"
#import "Header.h"
#import "ShareModel.h"
#import "ShareManager.h"

static CGFloat const TitleH = 30.0f;
static CGFloat const ScrollH = 120.0f;
static CGFloat const CancelBtnH = 55.0f;
static CGFloat const Padding = 10.0f;

//about target app icon、title
static CGFloat const IconWH = 60.0f;
static CGFloat const AppTitleH = 30.0f;

@interface ShareView()

@property (strong , nonatomic)UIView *listView;
@property (strong , nonatomic)UIView *bgView;

@property (assign , nonatomic) CGFloat listViewH;

@end

@implementation ShareView

+ (instancetype)shareWithListData:(NSArray<NSString *>*)listData
{
    ShareView *shareView = [[ShareView alloc]initWithListData:listData];
    return shareView;
}

- (instancetype)initWithListData:(NSArray<NSString *> *)listData
{
    if (self = [super init]) {
        
        self = [[ShareView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HIGHT)];
        [self creatBgView];
        [self creatListViewWithData:listData];

    }
    return self;
}

- (void)creatBgView
{
    _bgView = [[UIView alloc]init];
    UIColor *color = [UIColor blackColor];
    _bgView.backgroundColor = [color colorWithAlphaComponent:0.3];
    
    [self addSubview:_bgView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenListView)];
    [_bgView addGestureRecognizer:tap];
}

- (void)creatListViewWithData:(NSArray *)data
{
    _listView = [[UIView alloc]init];
    UIColor *color = [UIColor whiteColor];
    _listView.backgroundColor = [color colorWithAlphaComponent:0.4];

    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"Share to";
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    
    UIButton *cancelBtn = [[UIButton alloc]init];
    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [cancelBtn addTarget:self action:@selector(hiddenListView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_listView];
    [_listView addSubview:titleLabel];
    [_listView addSubview:scrollView];
    [_listView addSubview:cancelBtn];
    
    [_listView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        self.listViewH = Padding + TitleH + ScrollH + CancelBtnH;
        make.left.right.equalTo(self);
        make.top.equalTo(self.mas_bottom);
        make.height.offset(self.listViewH);
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(_listView).offset(Padding);
        make.right.equalTo(_listView).offset(-Padding);
        make.height.offset(TitleH);
    }];

    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(titleLabel.mas_bottom);
        make.left.right.equalTo(titleLabel);
        make.height.offset(ScrollH);
    }];
    
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(_listView);
        make.top.equalTo(scrollView.mas_bottom);
        make.height.offset(CancelBtnH);
    }];
    [self showListView];
    [self addAppDataToScrollView:scrollView ListData:data];
}

- (void)addAppDataToScrollView:(UIScrollView *)scrollView
                      ListData:(NSArray *)listData
{
    scrollView.contentSize = CGSizeMake((IconWH + Padding) * listData.count, ScrollH);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (NSInteger i = 0; i < listData.count; i ++)
    {
        ShareModel *model = listData[i];
        
        UIButton *btn = [[UIButton alloc]init];
        [btn setBackgroundImage:[UIImage imageNamed:model.iconName] forState:UIControlStateNormal];
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:12];
        label.text = model.titleStr;
        label.textAlignment = NSTextAlignmentCenter;
        
        [scrollView addSubview:btn];
        [scrollView addSubview:label];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(scrollView).offset(Padding);
            make.left.equalTo(scrollView).offset(Padding + (Padding + IconWH) * i);
            make.width.height.offset(IconWH);
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(btn);
            make.top.equalTo(btn.mas_bottom).offset(Padding);
            make.height.offset(AppTitleH);
            make.width.equalTo(btn);
        }];
        
        btn.btnClick = ^{
            
            [self shareWithModel:model Type:i];
        };
    }
}

- (void)shareWithModel:(ShareModel *)model Type:(NSInteger)type
{
    switch (type) {
        case targetTypeCustom:
        {
            NSLog(@"targetTypeCustom");
        }
            break;
        case targetTypeWeibo:
        {
            NSLog(@"targetTypeWeibo");
        }
            break;
            
        default:
            break;
    }
}

- (void)showListView
{
    [UIView animateWithDuration:1 animations:^{
        _listView.transform = CGAffineTransformMakeTranslation(0, -self.listViewH);
    }];
}

- (void)hiddenListView
{    
    [UIView animateWithDuration:1 animations:^{
        _listView.transform = CGAffineTransformMakeTranslation(0, self.listViewH);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
