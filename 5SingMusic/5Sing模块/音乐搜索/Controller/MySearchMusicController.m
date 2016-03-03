//
//  MySearchMusicController.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MySearchMusicController.h"
#import "AFNetworking.h"
#import "SearchSongCell.h"
#import "PlayMusicController.h"
@interface MySearchMusicController ()

@end

@implementation MySearchMusicController

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
    _songsArray = [[NSMutableArray alloc]init];
    self.view.backgroundColor =MYGRAYCOLOR;
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)creatUI{
    _searchBar =[[UISearchBar alloc]initWithFrame:CGRectMake(10 , 20, SCREENW-50, 44)];
    _searchBar.delegate=self;
    [self.view addSubview:_searchBar];
    UIButton *cancelBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    cancelBtn.frame =CGRectMake(SCREENW-40, 30, 30, 24);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    _songsTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 80, SCREENW, SCREENH-130) style:UITableViewStylePlain];
    _songsTableView.dataSource =self;
    _songsTableView.delegate =self;
    _songsTableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:_songsTableView];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSLog(@"%@",searchBar.text);
    [self creatData];

    // Do the search...
}
-(void)creatData{
    [_songsArray removeAllObjects];
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    NSString *songName=[_searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [manager GET:[NSString stringWithFormat:SEARCH_TEXT,songName]parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSLog(@"%@111",_searchBar.text);
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *data =[rootDic objectForKey:@"data"];
        NSArray *songs =[data objectForKey:@"songArray"];
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
    SearchSongCell *cell =[tableView dequeueReusableCellWithIdentifier:@"song"];
    if (!cell) {
        cell= [[SearchSongCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"song"];
    }
    NSDictionary *dic =_songsArray[indexPath.row];
    [cell cellConfigWith:dic];
    cell.numLabel.text =[NSString stringWithFormat:@"%d",indexPath.row+1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic =_songsArray[indexPath.row];
    NSLog(@"%@",dic);
    PlayMusicController *playVC=[PlayMusicController sharePlayMusicViewWithSongType:[dic objectForKey:@"type"] AndSongId:[dic objectForKey:@"songId"]];
    [self.navigationController pushViewController:playVC animated:YES];
}

-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
