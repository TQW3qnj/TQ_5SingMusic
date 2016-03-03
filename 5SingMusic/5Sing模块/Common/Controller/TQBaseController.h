//
//  TQBaseController.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TQBaseController : UIViewController<UIScrollViewDelegate>
@property (nonatomic,strong) UIView *navView;
@property (nonatomic,strong) NSMutableArray *btnTitleArray; //导航栏中间按钮标题数组
@property (nonatomic,strong) NSString *leftBtnType; //导航栏左按钮类型
@property (nonatomic,strong) NSMutableArray *btnArray;//导航栏中间按钮数组
@property (nonatomic,strong) UIScrollView *myScrollView;//显示页面的scrollView
@property (nonatomic,strong) NSMutableArray *vcClassArray;//用来创建存放在scrollView里的 vc的类型数组
@property (nonatomic,strong) NSMutableArray *VCArray;
@end
