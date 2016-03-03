//
//  TQProfileController.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQBaseController.h"
#import "UNLoginView.h"
@interface TQProfileController : TQBaseController
@property (nonatomic,strong) UNLoginView *unLoginView;
@property (nonatomic,strong) UIView *loginedView;
@end
