//
//  DetailRankController.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQDetailBaseController.h"

@interface DetailRankController : TQDetailBaseController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSString *Type;
@property (nonatomic,strong) NSString *index;
@property (nonatomic,strong) UITableView *songsTableView;
@property (nonatomic,strong) NSMutableArray *songsArray;

@end
