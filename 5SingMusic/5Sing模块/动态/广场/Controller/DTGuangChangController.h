//
//  DTGuangChangController.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBaseVCController.h"
@interface DTGuangChangController : MyBaseVCController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *btnArray;
@property (nonatomic,strong) NSString *urlStr;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *DTTableView;
@property (nonatomic,assign) BOOL isFirstAppear;
@end
