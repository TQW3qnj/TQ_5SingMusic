//
//  SongCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "SongCell.h"

@implementation SongCell

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
    _numLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 20, 25)];
    _numLabel.font =[UIFont systemFontOfSize:16];
    _numLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_numLabel];

    _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 250, 25)];
    _nameLabel.font =[UIFont systemFontOfSize:16];
    _nameLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_nameLabel];
    
    _singerLabel =[[UILabel alloc]initWithFrame:CGRectMake(30,30, 250, 20)];
    _singerLabel.font =[UIFont systemFontOfSize:12];
    _singerLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_singerLabel];
    _bfView =[[UIImageView alloc]initWithFrame:CGRectMake(SCREENW-60, 5, 40, 40)];
    [_bfView setImage:[UIImage imageNamed:@"play"]];
    [self.contentView addSubview:_bfView];
}
-(void)cellConfigWith:(NSDictionary *) dic{
    _nameLabel.text =[dic objectForKey:@"SN"];
    NSDictionary *userDic =[dic objectForKey:@"user"];
    _singerLabel.text =[userDic objectForKey:@"NN"];
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
