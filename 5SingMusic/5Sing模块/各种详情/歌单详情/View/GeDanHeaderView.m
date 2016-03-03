//
//  GeDanHeaderView.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "GeDanHeaderView.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
@implementation GeDanHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    _bgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 150)];
    [self addSubview:_bgview];
    
    _GrayView =[[UIView alloc]initWithFrame:CGRectMake(0, 120, SCREENW, 30)];
    _GrayView.backgroundColor =[UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:0.4];
    [self addSubview:_GrayView];
    
    _iconView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
    [_GrayView addSubview:_iconView];
    _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 200, 20)];
    _nameLabel.textColor =[UIColor whiteColor];
    [_GrayView addSubview:_nameLabel];
    
    _likeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _likeBtn.frame =CGRectMake(SCREENW-100, 5, 20, 20);
    [_likeBtn setImage:[UIImage imageNamed:@"SCfaviour"] forState:UIControlStateNormal];
    [_likeBtn setImage:[UIImage imageNamed:@"SCfaviour_selected"] forState:UIControlStateSelected];
    [_GrayView addSubview:_likeBtn];
    
    _shareBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _shareBtn.frame =CGRectMake(SCREENW-70, 5, 20, 20);
    [_shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [_GrayView addSubview:_shareBtn];

    _bfBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _bfBtn.frame =CGRectMake(SCREENW-40, 5, 20, 20);
    [_bfBtn setImage:[UIImage imageNamed:@"play_b"] forState:UIControlStateNormal];
    [_GrayView addSubview:_bfBtn];
    
    _TextLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, 150, SCREENW-20, 30)];
    _TextLabel.font =[UIFont systemFontOfSize:15];
    _TextLabel.textColor =[UIColor grayColor];
    _TextLabel.numberOfLines =2;
    [self addSubview:_TextLabel];
    
    _TypeLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, 180, SCREENW-20, 20)];
    _TypeLabel.font =[UIFont systemFontOfSize:15];
    _TypeLabel.textColor =[UIColor grayColor];

    [self addSubview:_TypeLabel];
}
-(void)ConfigWithModel:(DetailGDModel *)model{
    [_bgview setImageWithURL:[NSURL URLWithString:model.P]];
    NSLog(@"%@",model.C);
    _TextLabel.text =model.C;
    _TypeLabel.text =model.L;
    [_iconView setImageWithURL:[NSURL URLWithString:[model.user objectForKey:@"I"]]];
    _nameLabel.text =[model.user objectForKey:@"NN"];
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