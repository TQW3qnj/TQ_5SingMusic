//
//  TJItems.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJCommonView.h"
@interface TJItems : TJCommonView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *myTableVIew;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
