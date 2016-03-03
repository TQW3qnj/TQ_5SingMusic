//
//  TQMSModel.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TQMSModel : NSObject
@property (nonatomic,strong)NSString *I;
@property (nonatomic,strong)NSNumber *ID;
@property (nonatomic,strong)NSString *M;
@property (nonatomic,strong)NSString *NN;
@property (nonatomic,strong)NSNumber *FCRQ;
@property (nonatomic,strong)NSNumber *YCRQ;
@property (nonatomic,strong)NSDictionary *Song;
+ (id)initWithDict:(NSDictionary *)dict;
@end
