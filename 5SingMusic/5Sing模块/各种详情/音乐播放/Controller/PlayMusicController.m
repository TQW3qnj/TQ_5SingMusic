//
//  PlayMusicController.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "PlayMusicController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
@interface PlayMusicController ()

@end

@implementation PlayMusicController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _myplayIndex =0;
        _songArray =[[NSMutableArray alloc]init];
    }
    return self;
}
+(PlayMusicController *)sharePlayMusicViewWithSongType:(NSString *)type AndSongId:(NSString *)sId{
    static PlayMusicController *playMusciView =nil;
    if (!playMusciView) {
        playMusciView =[[PlayMusicController alloc]init];
    }
    playMusciView.songType =type;
    playMusciView.songId =sId;
    NSLog(@"---------%@,%@",type,sId);
    if (playMusciView.songType!=NULL &&playMusciView.songId!=NULL) {
        NSLog(@"adadsad");
        [playMusciView creatDataWithType:@"2"];
    }
    return playMusciView;
}
-(void)configMyViewWith:(id)model{
    SongModel *songModel =model;
    _songType =[songModel.songDic objectForKey:@"SK"];
    _songId =[songModel.songDic objectForKey:@"ID"];
    [self creatDataWithType:@"1"];
    [self creatDataWithType:@"1"];
  }
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"play_bg.jpg"]];
    self.view.backgroundColor =[UIColor grayColor];
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)creatUI{
    [self creatNavViewStyle];
    [self creatMyScrollView];
    [self creatMyPlayView];
}
-(void)creatMyScrollView{
    _imgV =[[UIImageView alloc]initWithFrame: CGRectMake(0, 0, SCREENW, SCREENH-64*2)];
    [_imgV setImage:[UIImage imageNamed:@"song_banner"]];
    _imgV.alpha =0.1;
    [self.view addSubview:_imgV];

    _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREENW, SCREENH-64*3)];
    _myScrollView.contentSize =CGSizeMake(3*SCREENW, SCREENH-64*3);
    
    _mySongView =[[MyCurrentSongView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-64*3)];
    _mySongView.MyParentVC =self;
    
    [_myScrollView addSubview:_mySongView];
    _myLyricView =[[MyLyricView alloc]initWithFrame:CGRectMake(SCREENW, 0, SCREENW, SCREENH-64*3)];
    [_myScrollView addSubview:_myLyricView];
    _myInspirView =[[MyInspiration alloc]initWithFrame:CGRectMake(SCREENW*2, 0, SCREENW, SCREENH-64*3)];
    [_myScrollView addSubview:_myInspirView];
    
    _myScrollView.contentOffset =CGPointMake(SCREENW, 0);
    _myScrollView.pagingEnabled =YES;
    _myScrollView.delegate =self;
    [self.view addSubview:_myScrollView];
}
-(void)creatMyPlayView{
    _myPlayView =[[MyPlayView alloc]initWithFrame:CGRectMake(0, SCREENH-133, SCREENW,133)];
    _myPlayView.MyParentVC =self;
    [_myPlayView.beforBtn addTarget: self action:@selector(aboveMusic) forControlEvents:UIControlEventTouchUpInside];
    [_myPlayView.nextBtn addTarget: self action:@selector(nextMusic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_myPlayView];
}
#pragma  mark －－切换歌曲
-(void)nextMusic{
    _myplayIndex=_myplayIndex +1;
    if (_myplayIndex >=_songArray.count) {
        _myplayIndex = 0;
    }
    SongModel *model =_songArray[_myplayIndex];
    _songType =[model.songDic objectForKey:@"SK"];
    _songId =[model.songDic objectForKey:@"ID"];
    [self creatDataWithType:@"1"];
}
-(void)aboveMusic{
    _myplayIndex=_myplayIndex -1;
    if (_myplayIndex <0) {
        _myplayIndex =_songArray.count-1;
    }
    SongModel *model =_songArray[_myplayIndex];
    _songType =[model.songDic objectForKey:@"SK"];
    _songId =[model.songDic objectForKey:@"ID"];
    [self creatDataWithType:@"1"];
}

-(void)creatDataWithType:(NSString *)type{
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:DANQU_DETAIL,_songType,_songId]parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data =[rootDic objectForKey:@"data"];
        NSLog(@"%@",data);
        _currentSong =[[SongModel alloc]init];
        _currentSong.songDic =data;
        if ([type isEqualToString:@"1"]) {
           // [self.songArray insertObject:_currentSong atIndex:0];
        }
        if ([type isEqualToString:@"2"]) {
             [self.songArray insertObject:_currentSong atIndex:0];
        }
        [self refreshMyViews];
        
        [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"加载超时" afterDelay:0.3];
        NSLog(@"%@",error);
    }];
}
//修改头视图导航栏
-(void)creatNavViewStyle{
    self.navView.backgroundColor =[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:0.1];
    [self.navView.rightButton removeFromSuperview];
    
    self.navView.titleLabel.text =@"歌词";
    self.navView.titleLabel.textColor =[UIColor whiteColor];
    UIButton *moreBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    moreBtn.frame =self.navView.rightButton.frame;
    [moreBtn setImage:[UIImage imageNamed:@"navMore"] forState:UIControlStateNormal];
    [moreBtn setImage:[UIImage imageNamed:@"navMore"] forState:UIControlStateHighlighted];
    [moreBtn addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navView addSubview:moreBtn];
    [self.navView.leftButton setImage:[UIImage imageNamed:@"navLeft"] forState:UIControlStateNormal];
    [self.navView.leftButton setImage:[UIImage imageNamed:@"navLeft"] forState:UIControlStateHighlighted];
    //self.navView

}
#pragma mark --_myscrollView代理方法
//滑动结束代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat x =_myScrollView.contentOffset.x;
    if (x == 0) {
        self.navView.titleLabel.text =@"当前播放";
    }else if (x == SCREENW){
        self.navView.titleLabel.text =@"歌词";
    }else if (x == SCREENW*2){
        self.navView.titleLabel.text =@"灵感";
    }
}
//按钮点击事件 
-(void)moreClick{
    
}

//刷新页面
- (void)refreshMyViews{
    NSString *lyStr = [_currentSong.songDic objectForKey:@"SW"];
    NSString *ipStr = [_currentSong.songDic objectForKey:@"M"];

    [_myLyricView configMyViewWithStr:lyStr];
    [_myInspirView configMyViewWithStr:ipStr];
    [_mySongView ConfigMyViewWithArray:_songArray];
    [_myPlayView toPlayWithSong:_currentSong];
    NSDictionary *userDic =[_currentSong.songDic objectForKey:@"user"];
    [_imgV setImageWithURL:[NSURL URLWithString:[userDic objectForKey:@"I"]]];
}
-(void)refreshMyView{
    NSLog(@"自动播放下一首");
    [self nextMusic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
