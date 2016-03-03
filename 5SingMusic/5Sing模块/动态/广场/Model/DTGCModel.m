//
//  DTGCModel.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DTGCModel.h"

@implementation DTGCModel
- (id)initWithDict:(NSDictionary *)dict{
    if ([super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

//类方法更好一点
+ (id)initWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
       if ([key isEqualToString:@"id"]) {
            self.dtID = value;
       }
}

@end
