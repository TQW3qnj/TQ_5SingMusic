//
//  TQMSCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQMSCell.h"
#import "UIImageView+AFNetworking.h"
#import "PlayMusicController.h"
@implementation TQMSCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    CGFloat m = 120*2/3;
    _picView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, m-20, m-20)];
    [self.contentView addSubview:_picView];
    
    _namelabel =[[UILabel alloc]initWithFrame:CGRectMake(m, 10, SCREENW-70-m, (m-20)/3)];
    _namelabel.font =[UIFont systemFontOfSize:14];
    _namelabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_namelabel];
    
    _RQLabel =[[UILabel alloc]initWithFrame:CGRectMake(m, 10+(m-20)/3, SCREENW-70-m, (m-20)/3)];
    _RQLabel.font =[UIFont systemFontOfSize:14];
    _RQLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_RQLabel];
    
    _typeLabel =[[UILabel alloc]initWithFrame:CGRectMake(m, 10+2*(m-20)/3, SCREENW-70-m, (m-20)/3)];
    _typeLabel.font =[UIFont systemFontOfSize:14];
    _typeLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_typeLabel];
    
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(10, m-1, SCREENW-20, 1)];
    lineView.backgroundColor =MYGRAYCOLOR;
    [self.contentView addSubview:lineView];
    
    _songbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _songbtn.titleLabel.font =[UIFont systemFontOfSize:14];
    _songbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _songbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_songbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _songbtn.frame =CGRectMake(10, m, SCREENW-70, m/2);
    [self.contentView addSubview:_songbtn];
    
    _gzBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _gzBtn.frame =CGRectMake(SCREENW-60, 20, 40, 40);
    [_gzBtn setImage:[UIImage imageNamed:@"musican_follow"] forState:UIControlStateNormal];
    [self.contentView addSubview:_gzBtn];
    
    _bfBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _bfBtn.frame =CGRectMake(SCREENW-60, m, 50, m/2);
    [_bfBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [_bfBtn addTarget:self action:@selector(playMusic) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_bfBtn];
}
-(void)playMusic{
    PlayMusicController *playVC=[PlayMusicController sharePlayMusicViewWithSongType:[_MSModel.Song objectForKey:@"SK"] AndSongId:[_MSModel.Song objectForKey:@"ID"]];
    [_myVc.myParentVC.navigationController pushViewController:playVC animated:YES];

}
-(void)configCellWithModel:(TQMSModel *)model{
    _MSModel = model;
    [_picView setImageWithURL:[NSURL URLWithString:model.I]];
    _namelabel.text =model.NN;
    _typeLabel.text =model.M;
    NSInteger RQ = model.FCRQ.integerValue +model.YCRQ.integerValue;
    if (RQ>10000) {
        _RQLabel.text =[NSString stringWithFormat:@"人气: %d万",RQ/10000];
    }else{
        _RQLabel.text =[NSString stringWithFormat:@"人气: %d",RQ];
    }
    
    NSString *songName =[model.Song valueForKey:@"SN"];
    [_songbtn setTitle:[NSString stringWithFormat:@"最新作品: %@",songName] forState:UIControlStateNormal];
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
