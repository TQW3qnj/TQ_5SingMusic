//
//  TJAdvertModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJAdvertModel : NSObject
@property (nonatomic,strong)NSString *LinkUrl;
@property (nonatomic,strong)NSString *imgUrl;
@property (nonatomic,strong)NSString *BehaviorType;
+ (id)initWithDict:(NSDictionary *)dict;
@end
