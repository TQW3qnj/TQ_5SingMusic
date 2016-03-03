//
//  TJDayView.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJDayView.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "PlayMusicController.h"
#import "SongModel.h"
@implementation TJDayView

- (id)initWithFrame:(CGRect)frame
{
    self.tipTitle =@"每日推荐";
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatUI];
        [self creatData];
    }
    return self;
}
-(void)creatData{
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:TjdayUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSArray *array =[rootDic objectForKey:@"data"];
        NSDictionary *dic =array[0];
        _songDic =dic;
        NSString *pic =[dic objectForKey:@"Picture"];
        [_picView setImageWithURL:[NSURL URLWithString:pic]];
        _nameLabel.text =[dic objectForKey:@"RecommendName"];
        _wordsLabel.text =[dic objectForKey:@"RecommendWords"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)creatUI{
    UIView *bgView =[[UIView alloc]initWithFrame:CGRectMake(5, 25, SCREENW-10, 90)];
    bgView.backgroundColor =MYGRAYCOLOR;
    bgView.layer.borderWidth =1;
    bgView.layer.borderColor =[MYGRAYCOLOR CGColor];
    [self addSubview:bgView];
    
    UIView *leftView =[[UIView alloc]initWithFrame:CGRectMake(5, 5, 80, 80)];
    leftView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:leftView];
    
    UIView *rightView =[[UIView alloc]initWithFrame:CGRectMake(90, 5, SCREENW-105, 80)];
    rightView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:rightView];

    
    self.picView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    [leftView addSubview:self.picView];
    
    self.nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, 10, SCREENW-115, 20)];
    self.nameLabel.font =[UIFont boldSystemFontOfSize:15];
    self.nameLabel.textAlignment =NSTextAlignmentCenter;
    [rightView addSubview:self.nameLabel];
    
    self.wordsLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, 30, SCREENW-115, 40)];
    self.wordsLabel.font =[UIFont systemFontOfSize:12];
    self.wordsLabel.textColor =[UIColor grayColor];
    self.wordsLabel.numberOfLines =0;
    [rightView addSubview:self.wordsLabel];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",self.nameLabel.text);
    if ([self.nameLabel.text isEqualToString:@""]) {
        return;
    }
    NSLog(@"%@",self.nameLabel.text);
    NSDictionary *content = [_songDic objectForKey:@"Content"];
    NSLog(@"%@",content);
    PlayMusicController *playVC =[PlayMusicController sharePlayMusicViewWithSongType:[content objectForKey:@"Type"] AndSongId:[content objectForKey:@"Id"]];

    [self.MyParentVC.myParentVC.navigationController pushViewController:playVC animated:YES];
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
