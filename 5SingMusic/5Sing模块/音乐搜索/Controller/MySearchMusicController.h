//
//  MySearchMusicController.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySearchMusicController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSMutableArray *songsArray;
@property (nonatomic,strong) UITableView *songsTableView;
@end
