//
//  PHBModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHBModel : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *photo;
@property (nonatomic,strong)NSArray *songs;
+ (id)initWithDict:(NSDictionary *)dict;
@end
