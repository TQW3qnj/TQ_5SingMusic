//
//  MSNewController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MSNewController.h"
#import "AFNetworking.h"
#import "TQMSCell.h"
#import "TQMSModel.h"
@interface MSNewController ()

@end

@implementation MSNewController

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
    [SVProgressHUD dismiss];
    if (_isFirstAppear == YES) {
        [self creatData];
    }
}
-(void)creatUI{
    _msTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-113)];
    _msTableView.delegate =self;
    _msTableView.dataSource =self;
    _msTableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:_msTableView];
    
}
-(void)creatData{
    NSLog(@"mus");
    [_dataArray removeAllObjects];
    
    [SVProgressHUD show];
    
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:NewMusician parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array =[rootDic objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            TQMSModel *model =[TQMSModel initWithDict:dic];
            [_dataArray addObject:model];
        }
        [_msTableView reloadData];
        //消除提示框
        [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
        _isFirstAppear =NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"加载失败" afterDelay:0.3];
        NSLog(@"%@",error);
    }];
}
#pragma mark --_msTableView 代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TQMSCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ms"];
    if (!cell) {
        cell = [[TQMSCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ms"];
    }
    TQMSModel *model =_dataArray[indexPath.row];
    [cell configCellWithModel:model];
    cell.myVc =self;
    return cell;
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
