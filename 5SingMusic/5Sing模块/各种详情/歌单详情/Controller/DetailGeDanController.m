//
//  DetailGeDanController.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DetailGeDanController.h"
#import  "AFNetworking.h"
#import "GeDanHeaderView.h"
#import "SongCell.h"
#import "PlayMusicController.h"
@interface DetailGeDanController ()

@end

@implementation DetailGeDanController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _songsArray =[[NSMutableArray alloc]init];
    self.view.backgroundColor =[UIColor whiteColor];
    [self creatUI];
    [self creatData1];
    [self creatData2];
    // Do any additional setup after loading the view.
}
-(void)creatUI{
    _HeaderView =[[GeDanHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 200)];
    _HeaderView.MyParentVC =self;
    [_HeaderView.bfBtn addTarget:self action:@selector(playAll) forControlEvents:UIControlEventTouchUpInside];
    _songsTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENW, SCREENH-64) style:UITableViewStylePlain];
    _songsTableView.dataSource =self;
    _songsTableView.delegate =self;
    _songsTableView.tableHeaderView =_HeaderView;
    _songsTableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:_songsTableView];
 
}
-(void)playAll{
    if (_songsArray.count>0) {
         PlayMusicController *play =[PlayMusicController sharePlayMusicViewWithSongType:NULL AndSongId:NULL];
        for (NSInteger i= _songsArray.count-1; i>=0; i--) {
            if (i==0) {
                play.songType =[_songsArray[i] objectForKey:@"SK"];
                play.songId =[_songsArray[i] objectForKey:@"ID"];
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
-(void)creatData1{
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:GEDAN_TOP,_GeDanID]parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data =[rootDic objectForKey:@"data"];
        DetailGDModel *model =[DetailGDModel initWithDict:data];
        [_HeaderView ConfigWithModel:model];
        //消除提示框
       // [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"加载超时" afterDelay:0.3];
        NSLog(@"%@",error);
    }];
}
-(void)creatData2{
    [_songsArray removeAllObjects];
    [SVProgressHUD show];
    NSLog(@"%@",_GeDanID);
    NSLog(@"%@",[NSString stringWithFormat:GEDAN_DETAIL,_GeDanID]);
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:GEDAN_DETAIL,_GeDanID]parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *data =[rootDic objectForKey:@"data"];
        for (NSDictionary *Dic in data) {
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
