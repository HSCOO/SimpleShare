//
//  DisplayShareViewController.m
//  SecondDemo
//
//  Created by OnlyStu on 2017/2/25.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "DisplayShareViewController.h"
#import "Header.h"

static NSString *const NO_VALUE = @"No value";

@interface DisplayShareViewController ()


@end

@implementation DisplayShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self displayShareView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)displayShareView
{
    UITextView *textView = [[UITextView alloc]init];
    UIImageView *imageView = [[UIImageView alloc]init];
    UIButton *urlBtn = [[UIButton alloc]init];
    
    [self.view addSubview:textView];
    [self.view addSubview:imageView];
    [self.view addSubview:urlBtn];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(self.view).offset(60);
        make.right.equalTo(imageView.mas_left).offset(-10);
        make.height.offset(100);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(textView);
        make.right.equalTo(self.view).offset(-60);
        make.width.height.offset(100);
    }];
    
    [urlBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textView);
        make.right.equalTo(imageView);
        make.top.equalTo(textView.mas_bottom);
        make.height.offset(30);
    }];
    
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"my" create:YES];
    
    if (pasteboard.items.count > 0)
    {
        NSData *textData = pasteboard.items[0][@"text"];
        NSString *text = [[NSString alloc] initWithData:textData encoding:NSUTF8StringEncoding];
        if (![text isEqualToString:NO_VALUE])
        {
            textView.text = text;
            textView.font = [UIFont systemFontOfSize:17];
            textView.layer.borderWidth = 0.5;
            textView.layer.borderColor = [UIColor blackColor].CGColor;
        }
        
        NSData *URLData = pasteboard.items[1][@"URL"];
        NSString *URLStr = [[NSString alloc] initWithData:URLData encoding:NSUTF8StringEncoding];
        if (![URLStr isEqualToString:NO_VALUE])
        {
            [urlBtn setTitle:URLStr forState:UIControlStateNormal];
            [urlBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    
        NSData *imageData = pasteboard.items[2][@"image"];
        NSString *imageStr = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
        
        if (![imageStr isEqualToString:NO_VALUE])
        {
            imageView.image = [UIImage imageWithData:imageData];
        }
    }
}



@end
