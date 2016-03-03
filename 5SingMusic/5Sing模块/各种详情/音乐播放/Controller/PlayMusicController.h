//
//  PlayMusicController.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQDetailBaseController.h"
#import "SongModel.h"
#import "MyCurrentSongView.h"
#import "MyLyricView.h"
#import "MyInspiration.h"
#import "MyPlayView.h"

@interface PlayMusicController : TQDetailBaseController<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView *imgV;
@property (nonatomic,strong) NSString *songType;
@property (nonatomic,strong) NSString *songId;
@property (nonatomic,strong) NSMutableArray *songArray;
@property (nonatomic,strong) SongModel *currentSong;
@property (nonatomic,strong) UIScrollView *myScrollView;
@property (nonatomic,strong) MyCurrentSongView *mySongView;
@property (nonatomic,strong) MyLyricView *myLyricView;
@property (nonatomic,strong) MyInspiration *myInspirView;
@property (nonatomic,strong) MyPlayView *myPlayView;
@property (nonatomic,assign) NSInteger myplayIndex;
+(PlayMusicController *)sharePlayMusicViewWithSongType:(NSString *)type AndSongId:(NSString *)sId;
- (void)refreshMyViews;
-(void)creatDataWithType:(NSString *)type;
@end
