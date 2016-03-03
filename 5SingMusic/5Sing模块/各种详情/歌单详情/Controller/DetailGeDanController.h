//
//  DetailGeDanController.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQDetailBaseController.h"
#import "GeDanHeaderView.h"
@interface DetailGeDanController : TQDetailBaseController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSString *GeDanID;
@property (nonatomic,strong) UITableView *songsTableView;
@property (nonatomic,strong) NSMutableArray *songsArray;
@property (nonatomic,strong) GeDanHeaderView *HeaderView;
@end
