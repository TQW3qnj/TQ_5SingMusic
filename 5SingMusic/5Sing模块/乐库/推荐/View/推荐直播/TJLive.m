//
//  TJLive.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJLive.h"
#import "TJLiveCell.h"
#import "DetailLiveController.h"
#import "AFNetworking.h"
@implementation TJLive

- (id)initWithFrame:(CGRect)frame
{
    self.tipTitle =@"LIVE直播";
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatDataSource];
        _TJLiveArray =[[NSMutableArray alloc]init];
    }
    return self;
}
-(void)creatUI{
    NSLog(@"fgg");
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(5, 30, SCREENW-15, 100) collectionViewLayout:layout];
    _myCollectionView.backgroundColor =[UIColor whiteColor];
    _myCollectionView.delegate =self;
    _myCollectionView.dataSource =self;
    
    //在ios6以后，collectionviewcell的创建方法写在这里
    //类似于tableview的判断 if(cell == nil)方法里面的代码 如果没有在复用对列里找到可以复用的collectionViewCell 在这里创建
    [_myCollectionView registerClass:[TJLiveCell class] forCellWithReuseIdentifier:@"tjLiveCell"];
    
    [self addSubview:_myCollectionView];
    
}
-(void)creatDataSource{
    [_TJLiveArray removeAllObjects];
    //加载提示
//    UIAlertView *alert =[[UIAlertView alloc]init];
//    alert.message =@"糖糖正在奋力加载中...";
//    [alert show];
    
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    
    //解析数据
    [manager GET:TjLiveUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *rootArray =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dic in rootArray) {
            TJLiveModel *model =[TJLiveModel initWithDict:dic];
            [_TJLiveArray addObject:model];
        }
        [self creatUI];
        
//        //消除提示框
//        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [alert dismissWithClickedButtonIndex:0 animated:YES];
//        UIAlertView *alert2 =[[UIAlertView alloc]init];
//        alert2.message =@"加载超时";
//        [UIView animateWithDuration:0.5 animations:^{
//            [alert2 dismissWithClickedButtonIndex:0 animated:YES];
//            
//        }];
        
    }];
}
#pragma mark **UICollectionDelegate**
//返回有多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _TJLiveArray.count;
}
//item复用的方法
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TJLiveCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"tjLiveCell" forIndexPath:indexPath];
    TJLiveModel *model =_TJLiveArray[indexPath.row];
    [cell configCellWithModel:model];
    
    return cell;
}
//设置每个item的大小，相当于tableView设置行高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(SCREENW/3, 90);
}

//设置collectionViewcell距离边缘的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    //item的宽度相加 再加上item之间的距离 不能超过屏幕的宽度
    return 10;
}
//点击每个Item的代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%d个ITEM",indexPath.row);
    TJLiveModel *model =_TJLiveArray[indexPath.row];
    DetailLiveController *DetailLive =[[DetailLiveController alloc]init];
    DetailLive.midTitle =[NSString stringWithFormat:@"%@的直播间",model.nickName];
    [self.MyParentVC.myParentVC.navigationController pushViewController:DetailLive animated:YES];
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
