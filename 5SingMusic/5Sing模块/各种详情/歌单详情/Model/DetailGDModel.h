//
//  DetailGDModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailGDModel : NSObject
@property (nonatomic,strong)NSString *C;//描述
@property (nonatomic,strong)NSString *L;//类型
@property (nonatomic,strong)NSString *ID;//
@property (nonatomic,strong)NSString *P;//图片
@property (nonatomic,strong)NSDictionary *user;
+ (id)initWithDict:(NSDictionary *)dict;
@end
