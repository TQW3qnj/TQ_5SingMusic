//
//  TQDetailBaseController.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBaseVCController.h"
#import "DetailNavView.h"
@interface TQDetailBaseController : MyBaseVCController
@property (nonatomic,strong) NSString *midTitle;
@property (nonatomic,strong) DetailNavView  *navView;
-(void)refreshMyTitle;
@end
