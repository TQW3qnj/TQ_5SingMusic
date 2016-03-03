//
//  TJItems.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJItems.h"
#import "AFNetworking.h"
#import "TJItemsModel.h"
#import "TJItemCell.h"
#import "YKItemDetailController.h"
@implementation TJItems

- (id)initWithFrame:(CGRect)frame
{
    self.tipTitle =@"专题";
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _dataArray =[[NSMutableArray alloc]init];
        [self creatUI];
        [self creatData];
    }
    return self;
}
-(void)creatUI{
    _myTableVIew =[[UITableView alloc]initWithFrame:CGRectMake(0, 25, self.bounds.size.width, self.bounds.size.height-20)];
    _myTableVIew.dataSource = self;
    _myTableVIew.delegate = self;
    [_myTableVIew setSeparatorInset:UIEdgeInsetsZero];
    _myTableVIew.tableFooterView =[[UIView alloc]init];
    [self addSubview:_myTableVIew];
}
-(void)creatData{
    [_dataArray removeAllObjects];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:TjZhuanTiUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array =[rootDic objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            TJItemsModel *model =[TJItemsModel initWithDict:dic];
            [_dataArray addObject:model];
        }
        [_myTableVIew reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

}
#pragma mark --tableView 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TJItemCell *cell =[tableView dequeueReusableCellWithIdentifier:@"items"];
    if (!cell) {
        cell =[[TJItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"items"];
    }
    TJItemsModel *model =_dataArray[indexPath.row];
    [cell configCellWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    TJItemsModel *model =_dataArray[indexPath.row];
    
    YKItemDetailController *itemVC =[[YKItemDetailController alloc]init];
    itemVC.midTitle =model.Title;
    itemVC.Url =model.Url;
    [self.MyParentVC.myParentVC.navigationController pushViewController:itemVC animated:YES];
    
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
