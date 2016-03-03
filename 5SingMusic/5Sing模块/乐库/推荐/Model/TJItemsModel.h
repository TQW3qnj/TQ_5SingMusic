//
//  TJItemsModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJItemsModel : NSObject
@property (nonatomic,strong)NSString *ImgUrl;
@property (nonatomic,strong)NSString *Title;
@property (nonatomic,strong)NSString *Url;
+ (id)initWithDict:(NSDictionary *)dict;

@end
