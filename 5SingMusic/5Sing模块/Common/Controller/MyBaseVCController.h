//
//  MyBaseVCController.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyBaseVCController : UIViewController
@property (nonatomic,strong) UIViewController *myParentVC;//父容器的VC
-(void)refreshMyView;
-(void)configMyViewWith:(id)model;
@end
