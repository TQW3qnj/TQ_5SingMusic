//
//  YKGeDanController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "YKGeDanController.h"
#import "GDTypeCell.h"
#import "AFNetworking.h"
#import "GeDanModel.h"
#import "GeDanCell.h"
#import "DetailGeDanController.h"
@interface YKGeDanController ()
{
    UITableView *_myTableView;
    NSMutableArray *_GDDataArray;
    UICollectionView *_myCollectionView;
    
    NSString *_geDanType;
    NSString *_sortType;
    
    NSMutableArray *_btnArray;
}
@end

@implementation YKGeDanController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _GDDataArray =[[NSMutableArray alloc]init];
        _geDanType =@"流行";
        _sortType =@"2";
        _isFirstAppear =YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatUI];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_isFirstAppear ==YES) {
        [self creatDataSource];
    }
}
-(void)creatUI{
    _btnArray =[[NSMutableArray alloc]init];
    //左侧菜单
    _myTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 80, SCREENH-113) style:UITableViewStylePlain];
    _myTableView.delegate =self;
    _myTableView.dataSource =self;
    _myTableView.backgroundColor =[UIColor whiteColor];
    [_myTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.view addSubview:_myTableView];
    
    //上侧按钮
    NSArray *array =@[@"最新",@"最热"];
    for (int i = 0; i<2; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:MYGREENCOLOR forState:UIControlStateSelected];
        if (i == 1) {
            btn.selected =YES;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.frame =CGRectMake(SCREENW-100+i*50, 0, 40, 20);
        btn.tag =100+i;
        [btn addTarget: self action:@selector(sortGeDan:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_btnArray addObject:btn];
    }
    // 按钮分割线
    UIView *lineview =[[UIView alloc]initWithFrame:CGRectMake(SCREENW-50, 0, 1, 20)];
    lineview.backgroundColor =[UIColor grayColor];
    [self.view addSubview:lineview];
    
    //右侧的歌单
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection =UICollectionViewScrollDirectionVertical;
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(80, 20, SCREENW-80, SCREENH-133) collectionViewLayout:layout];
    _myCollectionView.backgroundColor =[UIColor whiteColor];
    _myCollectionView.delegate =self;
    _myCollectionView.dataSource =self;
    
    //在ios6以后，collectionviewcell的创建方法写在这里
    //类似于tableview的判断 if(cell == nil)方法里面的代码 如果没有在复用对列里找到可以复用的collectionViewCell 在这里创建
    [_myCollectionView registerClass:[GeDanCell class] forCellWithReuseIdentifier:@"GeDanCell"];
    
    [self.view addSubview:_myCollectionView];
    
}
//按钮点击事件
-(void)sortGeDan:(UIButton *)sender{
    if (sender.tag == 100) {
        _sortType=@"1";
        [self creatDataSource];
    }else{
        _sortType =@"2";
        [self creatDataSource];
    }
    for (UIButton *btn in _btnArray) {
        if (btn == sender) {
            btn.selected =YES;
        }else{
            btn.selected =NO;
        }
    }
}
//解析歌单
-(void)creatDataSource{
    [_GDDataArray removeAllObjects];
    [SVProgressHUD show];
    //url拼接转码
    NSString *str =[[NSString stringWithFormat:GDTypeUrl,_geDanType,_sortType] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSLog(@"%@",str);
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    
    //解析数据
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dataDic =[rootDic objectForKey:@"data"];
        NSLog(@"%@",dataDic);
        NSArray *arr =[dataDic objectForKey:@"songMenu"];
        for (NSDictionary *dic in arr) {
            GeDanModel *model =[GeDanModel initWithDict:dic];
            [_GDDataArray addObject:model];
            NSLog(@"%@",model.playcount);
        }
        [_myCollectionView reloadData];
        
        //消除提示框
        [SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:0.3];
        _isFirstAppear = NO;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"加载超时" afterDelay:0.3];
    }];
}
#pragma mark **UICollectionDelegate**
//返回有多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _GDDataArray.count;
}
//item复用的方法
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GeDanCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"GeDanCell" forIndexPath:indexPath];
    GeDanModel *model =_GDDataArray[indexPath.row];
    [cell configCellWithModel:model];
    
    return cell;
}
//设置每个item的大小，相当于tableView设置行高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((SCREENW-100)/2, 100);
}

//设置collectionViewcell距离边缘的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}

//纵向距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//横向距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    //item的宽度相加 再加上item之间的距离 不能超过屏幕的宽度
    return 10;
}
//点击每个Item的代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%d个ITEM",indexPath.row);
    GeDanModel *model =_GDDataArray[indexPath.row];
    DetailGeDanController *detailGD =[[DetailGeDanController alloc]init];
    detailGD.GeDanID =model.listId;
    detailGD.midTitle =model.listName;
    [self.myParentVC.navigationController pushViewController:detailGD animated:YES];
}

#pragma mark --tableView 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return GenDanTypes.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GDTypeCell *cell =[tableView dequeueReusableCellWithIdentifier:@"gedanType"];
    if (!cell) {
        cell =[[GDTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gedanType"];
    }
    cell.typeLabel.text =GenDanTypes[indexPath.row];
    if (_isFirstAppear) {
        NSInteger selectedIndex = 0;
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        [tableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _geDanType =GenDanTypes[indexPath.row];
    _sortType =@"2";
    NSLog(@"adada");
    for (UIButton *btn in _btnArray) {
        if ([btn.titleLabel.text isEqualToString:@"最热"]) {
            btn.selected =YES;
        }else{
            btn.selected =NO;
        }
    }
    [self creatDataSource];
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
