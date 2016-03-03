//
//  GeDanModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeDanModel : NSObject
@property (nonatomic,strong)NSString *listId;
@property (nonatomic,strong)NSString *listName;
@property (nonatomic,strong)NSNumber *playcount;
@property (nonatomic,strong)NSString *url;

+ (id)initWithDict:(NSDictionary *)dict;
@end
