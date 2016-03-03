//
//  MyPlayView.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyPlayView.h"
#import "UIImageView+AFNetworking.h"
@implementation MyPlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor =[UIColor blackColor];
        self.backgroundColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    _iconView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 64, 64)];
    [self addSubview:_iconView];
    
   
    _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(70, 10, SCREENW-70, 20)];
    _nameLabel.textColor =MYGRAYCOLOR;
    _nameLabel.textAlignment =NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.text =@"暂无歌曲";
    [self addSubview:_nameLabel];
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareBtn.frame =CGRectMake(SCREENW-70, 35, 30, 30);
    [_shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [_shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_shareBtn];
    
    _addGenDanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _addGenDanBtn.frame =CGRectMake(SCREENW-35, 35, 30, 30);
    [_addGenDanBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [_addGenDanBtn addTarget:self action:@selector(addGenDan:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addGenDanBtn];
    
    
    _progressSlider=[[UISlider alloc]initWithFrame:CGRectMake(20, 70, SCREENW-40, 10)];
    [_progressSlider addTarget:self action:@selector(moveProgress:) forControlEvents:UIControlEventValueChanged];
    [_progressSlider addTarget:self action:@selector(movePro:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_progressSlider];
    [_progressSlider setTintColor:MYGREENCOLOR];
    [_progressSlider setThumbImage:[UIImage imageNamed:@"slier_on"] forState:UIControlStateNormal];

    _currentTimeLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, 80, 40, 20)];
    _currentTimeLabel.textColor =MYGREENCOLOR;
    _currentTimeLabel.text =@"00:00";
    _currentTimeLabel.font =[UIFont systemFontOfSize:12];
    [self addSubview:_currentTimeLabel];
    
    _totalTimeLabel =[[UILabel alloc]initWithFrame:CGRectMake(SCREENW-60, 80, 40, 20)];
    _totalTimeLabel.textColor =MYGREENCOLOR;
    _totalTimeLabel.text =@"00:00";
    _totalTimeLabel.font =[UIFont systemFontOfSize:12];
    [self addSubview:_totalTimeLabel];
    
    _beforBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _beforBtn.frame =CGRectMake(30, 100, 30, 20);
    [_beforBtn setImage:[UIImage imageNamed:@"menu_above"] forState:UIControlStateNormal];
    [self addSubview:_beforBtn];
    
    _nextBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _nextBtn.frame =CGRectMake(SCREENW-60, 100, 30, 20);
    [_nextBtn setImage:[UIImage imageNamed:@"menu_next"] forState:UIControlStateNormal];
    [self addSubview:_nextBtn];
    
    _playBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _playBtn.frame =CGRectMake(SCREENW/2-15,95, 30, 30);
    [_playBtn setImage:[UIImage imageNamed:@"menu_musicStop"] forState:UIControlStateNormal];
    [_playBtn setImage:[UIImage imageNamed:@"menu_musicPlay"] forState:UIControlStateSelected];
    [_playBtn addTarget: self action:@selector(playOrStop) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playBtn];
    [self creatPlayer];
}
-(void)creatPlayer{
    _player = [[NCMusicEngine alloc] init];
    _player.delegate = self;
    //[_player playUrl:[NSURL URLWithString:@"http://datashat.net/music_for_programming_18-konx_om_pax.mp3"]];
}
-(void)toPlayWithSong:(SongModel *)song{
    NSDictionary *userDic =[song.songDic objectForKey:@"user"];
    [_iconView setImageWithURL:[NSURL URLWithString:[userDic objectForKey:@"I"]]];
    
    //UILabel自适应宽度
    _nameLabel.text =[song.songDic objectForKey:@"SN"];
    
    NSString *url =[song.songDic objectForKey:@"FN"];
   [_player playUrl:[NSURL URLWithString:url]];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(changeProgress:) userInfo:nil repeats:YES];
    _playBtn.selected =YES;
}
#pragma  mark --切换播放状态
-(void)playOrStop{
    _playBtn.selected =!_playBtn.selected;
    if (_playBtn.selected ==YES) {
        [_player resume];
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(changeProgress:) userInfo:nil repeats:NO];
    }else{
        [_player stop];
    }
}
#pragma  mark --进度条
-(void)movePro:(UISlider *)slider{
    [_player resume];
}
-(void)moveProgress:(UISlider *)slider{
    [_player stop];
   _player.player.currentTime =slider.value *_player.player.duration;
}
-(void)changeProgress:(NSTimer *)timer{
    //音频的总时间
    CGFloat totalTime=_player.player.duration;
    //当前时间
    CGFloat currentTime=_player.player.currentTime;
    NSLog(@"%f",totalTime);
    NSLog(@"%f",currentTime);
    _progressSlider.value=currentTime/totalTime;
    _currentTimeLabel.text=[self getTimeByFloat:currentTime];
    _totalTimeLabel.text =[self getTimeByFloat:totalTime];
    NSInteger toTime =(NSInteger)totalTime;
    NSInteger ctTime =(NSInteger)currentTime;
//    if (ctTime ==toTime-1&&ctTime!=0) {
//            [self.MyParentVC refreshMyView];
//    }
}
-(NSString *)getTimeByFloat:(CGFloat)fTime{
    NSInteger ITime =(NSInteger)fTime;
    NSString *myTime =[NSString stringWithFormat:@"%02d:%02d",ITime/60,ITime%60];
    return myTime;
}

#pragma  mark --分享
-(void)share:(UIButton *)sender{
    
}
#pragma  mark --添加歌单
-(void)addGenDan:(UIButton *)sender{
    
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
