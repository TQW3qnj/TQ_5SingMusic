//
//  DetailRankController.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DetailRankController.h"
#import  "AFNetworking.h"
#import "SongCell.h"
#import "PlayMusicController.h"
@interface DetailRankController ()

@end

@implementation DetailRankController

- (void)viewDidLoad {
    _songsArray =[[NSMutableArray alloc]init];
    [super viewDidLoad];
    [self creatUI];
    [self creatData];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    self.navView.titleLabel.text =self.midTitle;
}
-(void)creatUI{
    _songsTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 80, SCREENW, SCREENH-130) style:UITableViewStylePlain];
    _songsTableView.dataSource =self;
    _songsTableView.delegate =self;
    _songsTableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:_songsTableView];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(10, 64, 80, 14);
    [btn setTitleColor:MYGREENCOLOR forState:UIControlStateNormal];
    [btn setTitle:@"全部播放" forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:12];
    [btn addTarget:self action:@selector(playAll) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)playAll{
    if (_songsArray.count>0) {
        PlayMusicController *play =[PlayMusicController sharePlayMusicViewWithSongType:NULL AndSongId:NULL];
        for (NSInteger i= _songsArray.count-1; i>=0; i--) {
            if (i==0) {
                play.songType =[_songsArray[i] objectForKey:@"SK"];
                play.songId =[_songsArray[i] objectForKey:@"ID"];
                NSLog(@"%@ %@",play.songType,play.songId);
                if (play.songType!=NULL &&play.songId!=NULL) {
                    NSLog(@"adadsad");
                    [play creatDataWithType:@"2"];
                }
            }else{
                SongModel *model =[[SongModel alloc]init];
                model.songDic =_songsArray[i];
                [play.songArray insertObject:model atIndex:0];
            }
        }
        
        [self.navigationController pushViewController:play animated:YES];
    }
}

-(void)creatData{
    [_songsArray removeAllObjects];
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:DetailPHB,_Type,_index]parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data =[rootDic objectForKey:@"data"];
        NSArray *songs =[data objectForKey:@"songs"];
        for (NSDictionary *Dic in songs) {
            [_songsArray addObject:Dic];
        }
        NSLog(@"%d",_songsArray.count);
        [_songsTableView reloadData];
        //消除提示框
        [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"加载超时" afterDelay:0.3];
        NSLog(@"%@",error);
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _songsArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SongCell *cell =[tableView dequeueReusableCellWithIdentifier:@"song"];
    if (!cell) {
        cell= [[SongCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"song"];
    }
    NSDictionary *dic =_songsArray[indexPath.row];
    [cell cellConfigWith:dic];
    cell.numLabel.text =[NSString stringWithFormat:@"%d",indexPath.row+1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic =_songsArray[indexPath.row];
    NSLog(@"%@",dic);
    PlayMusicController *playVC=[PlayMusicController sharePlayMusicViewWithSongType:[dic objectForKey:@"SK"] AndSongId:[dic objectForKey:@"ID"]];
    [self.navigationController pushViewController:playVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
