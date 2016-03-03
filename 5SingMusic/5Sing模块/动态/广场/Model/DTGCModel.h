//
//  DTGCModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTGCModel : NSObject
@property (nonatomic,strong)NSNumber *category;
@property (nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSNumber *createtime;
@property (nonatomic,strong)NSString *dtID;
@property (nonatomic,strong)NSDictionary *user;
+ (id)initWithDict:(NSDictionary *)dict;
@end
