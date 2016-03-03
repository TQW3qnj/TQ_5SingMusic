//
//  PHBCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "PHBCell.h"
#import "UIImageView+AFNetworking.h"
@implementation PHBCell

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
    _picView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 70)];
    [self.contentView addSubview:_picView];
    
    _TipLabel =[[UILabel alloc]initWithFrame:CGRectMake(90,10, SCREENW-140, 20)];
    [self.contentView addSubview:_TipLabel];

    _Label1 =[[UILabel alloc]initWithFrame:CGRectMake(90,30, SCREENW-140, 20)];
    _Label1.font =[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_Label1];
    
    _Label2 =[[UILabel alloc]initWithFrame:CGRectMake(90,50, SCREENW-140, 20)];
    _Label2.font =[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_Label2];

    _Label3 =[[UILabel alloc]initWithFrame:CGRectMake(90,70, SCREENW-140, 20)];
    _Label3.font =[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_Label3];
    
    _Label4 =[[UILabel alloc]initWithFrame:CGRectMake(90,90, SCREENW-140, 20)];
    _Label4.font =[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_Label4];


    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}
-(void)configCellWithModel:(PHBModel *)model{
    [_picView setImageWithURL:[NSURL URLWithString:model.photo]];
    _TipLabel.text =model.name;
    NSLog(@"model.song.number =%d",model.songs.count);
    _Label1.text =[NSString stringWithFormat:@"1 %@",model.songs[0]];
    _Label2.text =[NSString stringWithFormat:@"2 %@",model.songs[1]];
    _Label3.text =[NSString stringWithFormat:@"3 %@",model.songs[2]];
    if (model.songs.count>=4) {
        _Label4.text =[NSString stringWithFormat:@"4 %@",model.songs[3]];
    }
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
