//
//  YKPaiHangBangController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "YKPaiHangBangController.h"
#import "AFNetworking.h"
#import "PHBCell.h"
#import "PHBModel.h"
#import "DetailRankController.h"
@interface YKPaiHangBangController ()

@end

@implementation YKPaiHangBangController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isFirstAppear =YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArray =[[NSMutableArray alloc]init];
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_isFirstAppear == YES) {
        [self creatData];
    }
}
-(void)creatUI{
    _bdTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-113)];
    _bdTableView.delegate =self;
    _bdTableView.dataSource =self;
    _bdTableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:_bdTableView];
}
-(void)creatData{
    NSLog(@"gunduzi");
    [_dataArray removeAllObjects];
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:PHBUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array =[rootDic objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            PHBModel *model =[PHBModel initWithDict:dic];
            [_dataArray addObject:model];
            NSLog(@"11%@",model.name);
        }
        [_bdTableView reloadData];
        //消除提示框
        [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
        _isFirstAppear = NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"加载超时" afterDelay:0.3];
        NSLog(@"%@",error);
    }];

}
#pragma mark --_bdTableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count-1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SCREENH-113)/3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PHBCell *cell =[tableView dequeueReusableCellWithIdentifier:@"bd"];
    if (!cell) {
        cell =[[PHBCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bd"];
    }
    PHBModel *model =_dataArray[indexPath.row];
    [cell configCellWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailRankController *detail =[[DetailRankController alloc]init];
    if (indexPath.row == 0) {
        detail.Type =@"yc";
        detail.midTitle =@"原创排行榜";
    }
    if (indexPath.row == 1) {
        detail.Type =@"fc";
         detail.midTitle =@"翻唱排行榜";
    }
    if (indexPath.row == 2) {
        detail.Type =@"list23";
         detail.midTitle =@"新歌Top50";
    }
    detail.index =@"1";
    [self.myParentVC.navigationController pushViewController:detail animated:YES];
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
