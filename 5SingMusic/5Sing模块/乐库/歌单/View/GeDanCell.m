//
//  GeDanCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "GeDanCell.h"
#import "UIImageView+AFNetworking.h"
@implementation GeDanCell

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
    self.backgroundColor =MYGRAYCOLOR;
    self.picView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 70)];
    [self.contentView addSubview:self.picView];
    self.nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 70,self.contentView.frame.size.width, 20)];
    self.nameLabel.font =[UIFont systemFontOfSize:12];
    self.nameLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:self.nameLabel];
    self.numLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, self.contentView.frame.size.width, 10)];
    self.numLabel.font =[UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.numLabel];
}
-(void)configCellWithModel:(GeDanModel *)model{
    [self.picView setImageWithURL:[NSURL URLWithString:model.url]];
    self.nameLabel.text =model.listName;
    self.numLabel.text =[NSString stringWithFormat:@"%@",model.playcount];
}
-(void)configCellWithTJModel:(TJGeDanModel *)model{
    [self.picView setImageWithURL:[NSURL URLWithString:model.Picture]];
    self.nameLabel.text =model.Title;
    self.numLabel.text =[NSString stringWithFormat:@"%@",model.PlayCount];
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
