//
//  MyInspiration.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyCommonView.h"

@interface MyInspiration : MyCommonView
@property (nonatomic,strong)NSString *myInspir;
@property (nonatomic,strong) UIScrollView *myScrollView;
@property (nonatomic,strong)UILabel *myInspirLabel;

-(void)configMyViewWithStr:(NSString *)str;
@end
