//
//  DTGuangChangController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DTGuangChangController.h"
#import "AFNetworking.h"
#import "DTGCCell.h"
#import "DTGCModel.h"
@interface DTGuangChangController ()

@end

@implementation DTGuangChangController

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
    if (_isFirstAppear ==YES) {
        [self creatData];
    }
}
#pragma mark --creatUI
-(void)creatUI{
    //上侧按钮
    _btnArray =[[NSMutableArray alloc]init];
    NSArray *array =@[@"最热",@"最新"];
    for (int i = 0; i<2; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:MYGREENCOLOR forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        
        if (i == 0) {
            btn.selected =YES;
            [btn setBackgroundColor:[UIColor greenColor]];
            _urlStr =DT_GC_ZR;
            [self creatData];
        }else{
            [btn setBackgroundColor:MYGRAYCOLOR];
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.frame =CGRectMake(20+i*(SCREENW-40)/2, 5, (SCREENW-40)/2, 30);
        
        btn.tag =100+i;
        [btn addTarget: self action:@selector(sortDT:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_btnArray addObject:btn];
    }
    //分割线
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 39, SCREENW, 1)];
    lineView.backgroundColor =MYGRAYCOLOR;
    [self.view addSubview:lineView];

    
    //tableView
    _DTTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 40, SCREENW, SCREENH-153)];
    _DTTableView.delegate =self;
    _DTTableView.dataSource =self;
    _DTTableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:_DTTableView];

}
#pragma mark --tableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell =[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
    return 180;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DTGCModel *model =_dataArray[indexPath.row];
    NSString *Type =[NSString stringWithFormat:@"DT%d",model.category.intValue];
    NSLog(@"Type%@",Type);
    DTGCCell *cell =[tableView dequeueReusableCellWithIdentifier:Type];
    if (!cell) {
        cell = [[DTGCCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Type];
    }
    NSLog(@"%d",_dataArray.count);
    [cell configCellWithModel:model];
    cell.myVc =self;
    return cell;
}

#pragma mark --按钮点击事件
-(void)sortDT:(UIButton *)sender{
    if (sender.tag == 100) {
        _urlStr =DT_GC_ZR;
        [self creatData];
    }else{
        _urlStr =DT_GC_ZX;
        [self creatData];
    }
    for (UIButton *btn in _btnArray) {
        if (btn == sender) {
            btn.selected =YES;
            [btn setBackgroundColor:[UIColor greenColor]];
        }else{
            btn.selected =NO;
            [btn setBackgroundColor:MYGRAYCOLOR];
        }
    }
}
#pragma mark --creatData
-(void)creatData{
    [_dataArray removeAllObjects];
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:_urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array =[rootDic objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            DTGCModel *model =[DTGCModel initWithDict:dic];
            [_dataArray addObject:model];
        }
        [_DTTableView reloadData];
        //消除提示框
        [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
        _isFirstAppear = NO;
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
