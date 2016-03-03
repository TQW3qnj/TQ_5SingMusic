//
//  TJAdvertView.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJAdvertView.h"
#import "AFNetworking.h"
#import "TJAdvertModel.h"
#import "UIImageView+AFNetworking.h"
#import "DetailGeDanController.h"
#import "PlayMusicController.h"
#import "YKItemDetailController.h"

@implementation TJAdvertView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _dataArray = [[NSMutableArray alloc]init];
        [self creatDataSource];
    }
    return self;
}
-(void)creatDataSource{
    [_dataArray removeAllObjects];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:TjADVUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array =[rootDic objectForKey:@"data"];
        for (NSDictionary *dic in array) {
            TJAdvertModel *model =[TJAdvertModel initWithDict:dic];
            [_dataArray addObject:model];
        }
        [self creatUI];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)creatUI{
    _outScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 0, SCREENW-40, self.bounds.size.height)];
    _outScrollView.clipsToBounds = NO;
    _outScrollView.contentSize =CGSizeMake((self.bounds.size.width-40)*(_dataArray.count+2), self.bounds.size.height);
    _outScrollView.contentOffset =CGPointMake(self.bounds.size.width-40, 0);
    _xOld =_outScrollView.contentOffset.x;
    _outScrollView.pagingEnabled =YES;
    _outScrollView.delegate =self;
    _outScrollView.userInteractionEnabled =YES;
    [self addSubview:_outScrollView];
    for (int i =0 ; i<_dataArray.count+2; i++) {
        TJAdvertModel *model;
        if (i == 0) {
            model =_dataArray[_dataArray.count-1];
        }else if(i ==_dataArray.count+1){
            model =_dataArray[0];
        }else{
            model =_dataArray[i-1];
        }
        UIImageView *imgView =[[UIImageView alloc]initWithFrame:CGRectMake(i*(self.bounds.size.width-40), 0, self.bounds.size.width-40, self.bounds.size.height-20)];
        if (i == 1) {
            imgView.frame =CGRectMake(self.bounds.size.width-40, 0, self.bounds.size.width-40, self.bounds.size.height);
        }
        [imgView setImageWithURL:[NSURL URLWithString:model.imgUrl]];
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked)];
        [imgView addGestureRecognizer:singleTap];
        [_outScrollView addSubview:imgView];
    }
    
}

-(void)UesrClicked{
    CGFloat x =_outScrollView.contentOffset.x;
    NSLog(@"adad");
    NSInteger i =(NSInteger)(x/(SCREENW-40));
    if (i==0) {
        i=_dataArray.count;
    }
    if (i==_dataArray.count+1) {
        i=1;
    }
    TJAdvertModel *model =_dataArray[i-1];
     NSLog(@"%@",model.BehaviorType);
    if ([model.BehaviorType isEqualToString:@"2"]) {
        NSLog(@"%@",model.BehaviorType);
        DetailGeDanController *detail =[[DetailGeDanController alloc]init];
        detail.GeDanID =model.LinkUrl;
        detail.midTitle =@"歌单详情";
        [self.MyParentVC.myParentVC.navigationController pushViewController:detail animated:YES];
    }else if([model.BehaviorType isEqualToString:@"4"]){
        YKItemDetailController *Dc =[[YKItemDetailController alloc]init];
        Dc.Url =model.LinkUrl;
        [self.MyParentVC.myParentVC.navigationController pushViewController:Dc animated:YES];
    }else{
               NSString *songType =[model.LinkUrl substringToIndex:2];
               NSString *songId =[model.LinkUrl substringFromIndex:3];
               PlayMusicController *play =[PlayMusicController sharePlayMusicViewWithSongType:songType AndSongId:songId];
               [self.MyParentVC.myParentVC.navigationController pushViewController:play animated:YES];

    }
    
}
#pragma mark --scrollView代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x =scrollView.contentOffset.x;
    CGFloat y =scrollView.contentOffset.y;
    CGFloat xMax =_dataArray.count*(self.bounds.size.width-40);
    CGFloat xMin =self.bounds.size.width-40;
    if (x>xMax && _xOld==xMax) {
        scrollView.contentOffset =CGPointMake(x-xMax, y);
    }
    else if (x<xMin && _xOld==xMin) {
        scrollView.contentOffset =CGPointMake(x+xMax, y);
    }
    NSLog(@"%f,%f",x,y);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _xOld =scrollView.contentOffset.x;
    for (UIView *view in _outScrollView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            CGFloat x =view.frame.origin.x;
            CGFloat y =view.frame.origin.y;
            CGFloat w =view.frame.size.width;
            CGFloat h =self.bounds.size.height;
            if (_xOld ==x) {
                [UIView animateWithDuration:0.1 animations:^{
                    
                    view.frame =CGRectMake(x, y, w, h);
                }];

            }else{
                [UIView animateWithDuration:0.1 animations:^{
                    
                    view.frame =CGRectMake(x, y, w, h-20);
                }];
            }
            
        }
    }
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
