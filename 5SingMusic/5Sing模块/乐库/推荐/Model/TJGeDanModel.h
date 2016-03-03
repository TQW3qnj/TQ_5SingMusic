//
//  TJGeDanModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJGeDanModel : NSObject
@property (nonatomic,strong)NSString *SongListId;
@property (nonatomic,strong)NSString *Title;
@property (nonatomic,strong)NSNumber *PlayCount;
@property (nonatomic,strong)NSString *Picture;

+ (id)initWithDict:(NSDictionary *)dict;

@end
