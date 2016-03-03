//
//  MyCurrentSongCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyCurrentSongCell.h"

@implementation MyCurrentSongCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor =[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.1];
        [self creatUI];
    }
    return self;
}
-(void)creatUI{
    _songLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREENW-60, 40)];
    [self.contentView addSubview:_songLabel];
    _downLoadBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _downLoadBtn.frame =CGRectMake(SCREENW-40, 5, 30, 30);
    [_downLoadBtn setImage:[UIImage imageNamed:@"downFinished"] forState:UIControlStateNormal];
    [_downLoadBtn addTarget: self action:@selector(toDownload) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_downLoadBtn];
}
-(void)configCellWithDic:(NSDictionary *)dic AndIndex:(NSInteger)index{
    NSDictionary *userDic =[dic objectForKey:@"user"];
    _songLabel.text = [NSString stringWithFormat:@"%d %@-%@",index,[dic objectForKey:@"SN"],[userDic objectForKey:@"NN"]];
}
-(void)toDownload{
    
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
