//
//  MyPlayView.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyCommonView.h"
#import <AVFoundation/AVFoundation.h>
#import "SongModel.h"
#import "NCMusicEngine.h"
@interface MyPlayView : MyCommonView<NCMusicEngineDelegate>
@property (nonatomic,strong)UIImageView *iconView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UIButton *shareBtn;
@property (nonatomic,strong)UIButton *addGenDanBtn;

@property (nonatomic,strong)UISlider *progressSlider;//进度
@property (nonatomic,strong)UILabel *currentTimeLabel;//当前时间
@property (nonatomic,strong)UILabel *totalTimeLabel;
@property (nonatomic,strong)UIButton *beforBtn;
@property (nonatomic,strong)UIButton *nextBtn;
@property (nonatomic,strong)UIButton *playBtn;
@property (nonatomic,strong)NCMusicEngine *player;
-(void)toPlayWithSong:(SongModel *)song;
@end
