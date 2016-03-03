//
//  TJAdvertView.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCommonView.h"

@interface TJAdvertView : MyCommonView<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *outScrollView;
@property (nonatomic,strong)UIScrollView *inScrollView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,assign) CGFloat xOld;
@end
