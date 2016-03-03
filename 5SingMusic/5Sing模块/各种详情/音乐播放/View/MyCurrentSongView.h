//
//  MyCurrentSongView.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyCommonView.h"
@interface MyCurrentSongView : MyCommonView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *SongArray;
@property (nonatomic,strong) UITableView *SongsTableView;
@property (nonatomic,strong) UIView *numView;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UIButton *changeBtn;
-(void)ConfigMyViewWithArray:(NSArray *)array;
@end
