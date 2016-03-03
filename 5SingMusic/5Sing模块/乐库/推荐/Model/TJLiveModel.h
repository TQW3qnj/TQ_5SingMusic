//
//  TJLiveModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJLiveModel : NSObject
@property (nonatomic,strong)NSNumber *audience;
@property (nonatomic,strong)NSString *imgPath;
@property (nonatomic,strong)NSString *nickName;
@property (nonatomic,strong)NSString *type;
@property (nonatomic,strong)NSString *roomId;
@property (nonatomic,strong)NSString *week;
@property (nonatomic,strong)NSString *time;
+ (id)initWithDict:(NSDictionary *)dict;
@end
