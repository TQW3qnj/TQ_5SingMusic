//
//  MSNewController.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBaseVCController.h"
@interface MSNewController : MyBaseVCController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView * msTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,assign)BOOL isFirstAppear;
@end
