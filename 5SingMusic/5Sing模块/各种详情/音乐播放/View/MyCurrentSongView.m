//
//  MyCurrentSongView.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyCurrentSongView.h"
#import "MyCurrentSongCell.h"
#import "SongModel.h"
@implementation MyCurrentSongView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _SongArray =[[NSMutableArray alloc]init];
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    _numView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 40)];
    _numView.backgroundColor =[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.1];
    
    _numLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 40)];
    _numLabel.font =[UIFont systemFontOfSize:18];
    _numLabel.textColor =MYGRAYCOLOR;
    _numLabel.text =@"0首歌曲";
    [_numView addSubview:_numLabel];
    
    _changeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _changeBtn.frame =CGRectMake(SCREENW-60, 5, 50, 30);
    [_changeBtn setTitle:@"管理" forState:UIControlStateNormal];
    [_numView addSubview:_changeBtn];
    
    
    _SongsTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-194)];
    _SongsTableView.backgroundColor =[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.1];
    _SongsTableView.tableHeaderView =_numView;
    _SongsTableView.dataSource =self;
    _SongsTableView.delegate =self;
    [self addSubview:_SongsTableView];
    
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _SongArray.count;
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCurrentSongCell *cell =[tableView dequeueReusableCellWithIdentifier:@"SongsArray"];
    if (!cell) {
        cell =[[MyCurrentSongCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SongsArray"];
    }
    SongModel *model =_SongArray[indexPath.row];
    [cell configCellWithDic:model.songDic AndIndex:indexPath.row+1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SongModel *model =_SongArray[indexPath.row];
    [self.MyParentVC configMyViewWith:model];
}
-(void)ConfigMyViewWithArray:(NSArray *)array{
    _SongArray =[[NSMutableArray alloc]initWithArray:array];
    _numLabel.text =[NSString stringWithFormat:@"%d首歌曲",_SongArray.count];
    [_SongsTableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
