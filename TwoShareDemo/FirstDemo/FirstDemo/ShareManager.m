//
//  ShareManager.m
//  FirstDemo
//
//  Created by OnlyStu on 2017/2/23.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "ShareManager.h"
#import "ShareView.h"
#import "ShareModel.h"

static NSString *const NO_VALUE = @"No value";

@implementation ShareManager

+ (ShareView *)getShareViewWithData:(NSArray<NSString *> *)data
{
    return [ShareView shareViewWithData:data];
}

+ (void)shareWithModel:(ShareModel *)model Type:(NSInteger)type
{
    
    switch (type) {
        case targetTypeCustom:
        {
            NSURL *url = [NSURL URLWithString:model.urlSchems];
            if ([[UIApplication sharedApplication] canOpenURL:url])
            {
                UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"my" create:YES];            
                if (pasteboard.items.count > 0)
                {
                    pasteboard.items = [NSArray array];
                }
               
                NSArray *items = [ShareManager getDataArrFromModel:model Pasteboard:pasteboard];
                [pasteboard setItems:items options:@{UIPasteboardOptionLocalOnly:@YES}];
        
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
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

//保存到剪切板,必须组成Json格式
+ (NSArray *)getDataArrFromModel:(ShareModel *)model
                      Pasteboard:(UIPasteboard *)pasteboard
{
    ShareManager *manager = [[ShareManager alloc]init];
    
    NSString *tempText = model.shareText ? model.shareText : NO_VALUE;
    NSString *tempURL = model.shareURL ? model.shareURL : NO_VALUE;
    
    NSMutableDictionary *textDic = [manager addToItemsValue:tempText
                                                     forKey:@"text"
                                             withPasteboard:pasteboard];
    
    NSMutableDictionary *URLDic = [manager addToItemsValue:tempURL
                                                    forKey:@"URL"
                                            withPasteboard:pasteboard];
    
    
    UIImage *image = [UIImage imageWithContentsOfFile:model.shareImage];
    NSMutableDictionary *imageDic = [NSMutableDictionary dictionary];
    if (image)
    {
        NSData *imageData = UIImagePNGRepresentation(image);
        imageDic = [manager addToItemsValue:imageData
                                     forKey:@"image"
                             withPasteboard:pasteboard];
    }
    else
    {
        imageDic = [manager addToItemsValue:NO_VALUE
                                     forKey:@"image"
                             withPasteboard:pasteboard];
    }

    NSArray *arr = [NSArray arrayWithObjects:textDic,URLDic,imageDic, nil];
    
    return arr;
}

- (NSMutableDictionary *)addToItemsValue:(nonnull NSObject *)value
                 forKey:(nonnull NSString *)key
         withPasteboard:(nonnull UIPasteboard *)pasteboard
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
    [dic setValue:value forKey:key];
    
    return dic;
}

@end
