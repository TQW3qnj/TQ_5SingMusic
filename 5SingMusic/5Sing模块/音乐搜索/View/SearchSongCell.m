//
//  SearchSongCell.m
//  5SingMusic
//
//  Created by tangquan on 16/2/9.
//  Copyright © 2016年 TangQuan. All rights reserved.
//

#import "SearchSongCell.h"

@implementation SearchSongCell

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
    _numLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 20, 25)];
    _numLabel.font =[UIFont systemFontOfSize:12];
    _numLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_numLabel];
    
    _songNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 250, 25)];
    _songNameLabel.font =[UIFont systemFontOfSize:12];
    _songNameLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_songNameLabel];
    
    _singerLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 30, 250, 25)];
    _singerLabel.font =[UIFont systemFontOfSize:12];
    _singerLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_singerLabel];
    
    _popularityLabel =[[UILabel alloc]initWithFrame:CGRectMake(220,5, 250, 20)];
    _popularityLabel.font =[UIFont systemFontOfSize:12];
    _popularityLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_popularityLabel];
    
    _bfView =[[UIImageView alloc]initWithFrame:CGRectMake(SCREENW-60, 5, 40, 40)];
    [_bfView setImage:[UIImage imageNamed:@"play"]];
    [self.contentView addSubview:_bfView];
}
-(void)cellConfigWith:(NSDictionary *) dic{
    _songNameLabel.text =[dic objectForKey:@"songName"];
    _singerLabel.text =[dic objectForKey:@"singer"];
    _popularityLabel =[dic objectForKey:@"popularity"];
}


- (void)awakeFromNib {

    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
