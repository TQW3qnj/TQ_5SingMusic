//
//  TJLiveCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJLiveCell.h"
#import "UIImageView+AFNetworking.h"
@implementation TJLiveCell

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
    CGFloat x = self.contentView.frame.size.width;
    
    self.picView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, x, 60)];
    [self.contentView addSubview:self.picView];
    
    self.typeView =[[UIImageView alloc]initWithFrame:CGRectMake(x-40, 0, 40, 20)];
    [self.contentView addSubview:self.typeView];
    
    self.audienceLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, x, 20)];
    self.audienceLabel.backgroundColor=[UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.5];
    self.audienceLabel.font=[UIFont systemFontOfSize:13];
    self.audienceLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:self.audienceLabel];
    
    self.nickNameLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 60, x, 15)];
    self.nickNameLabel.font=[UIFont systemFontOfSize:11];
     self.nickNameLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:self.nickNameLabel];
    
    self.timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 75, x, 15)];
    self.timeLabel.font =[UIFont systemFontOfSize:11];
    self.timeLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:self.timeLabel];
}
-(void)configCellWithModel:(TJLiveModel *)model{
    [self.picView setImageWithURL:[NSURL URLWithString:model.imgPath]];
    if ([model.type isEqualToString:@"LIVE"]) {
        [self.typeView setImage:[UIImage imageNamed:@"Live_LivingTip"]];
    }else if([model.type isEqualToString:@"TRAILER"]){
        [self.typeView setImage:[UIImage imageNamed:@"Live_TrailerTip"]];
    }else if([model.type isEqualToString:@"RECOMMEND"]){
        [self.typeView setImage:[UIImage imageNamed:@"Live_recommendTip"]];
    }
    self.audienceLabel.text = [NSString stringWithFormat:@"观众:%@",model.audience];
    self.nickNameLabel.text = model.nickName;
    self.timeLabel.text =[NSString stringWithFormat:@"%@%@",model.week,model.time];
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
