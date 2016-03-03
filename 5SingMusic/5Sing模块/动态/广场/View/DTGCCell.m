//
//  DTGCCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DTGCCell.h"
#import "UIImageView+AFNetworking.h"
#import "PlayMusicController.h"
@implementation DTGCCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self creatUI];
        if ([reuseIdentifier isEqualToString:@"DT1"]) {
            [self creatUIWithSongAndText];
        }else if([reuseIdentifier isEqualToString:@"DT3"]){
            [self creatUIOnlyText];
        }else if([reuseIdentifier isEqualToString:@"DT6"]){
            [self creatUIOnlyPic];
        }
        
    }
    return self;
}
-(void)creatUI{
    _picView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    _picView.layer.cornerRadius =25;
    _picView.layer.masksToBounds =YES;
    [self.contentView addSubview:_picView];
    _nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 150, 20)];
    _nameLabel.textColor =MYGREENCOLOR;
    _nameLabel.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:_nameLabel];
    _timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 30, 200, 15)];
    _timeLabel.textColor =[UIColor grayColor];
    _timeLabel.font =[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_timeLabel];
    
    _commentBtn =[[TQBtn alloc]initWithFrame:CGRectMake(SCREENW/2, 155, SCREENW/4, 20)];
    [_commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [self.contentView addSubview:_commentBtn];
    
    _likeBtn =[[TQBtn alloc]initWithFrame:CGRectMake(SCREENW/4*3, 155, SCREENW/4, 20)];
    [_likeBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [_likeBtn setImage:[UIImage imageNamed:@"liked"] forState:UIControlStateSelected];
    [self.contentView addSubview:_likeBtn];
    
}

-(void)creatUIWithSongAndText{
    _songTypeLabel =[[UILabel alloc]initWithFrame:CGRectMake(210, 5, 100, 20)];
    _songTypeLabel.font =[UIFont systemFontOfSize:12];
    _songTypeLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_songTypeLabel];
    _contentLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 50, SCREENW-65, 50)];
    _contentLabel.numberOfLines =3;
    _contentLabel.font =[UIFont systemFontOfSize:15];
    _contentLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_contentLabel];
    
    _songView =[[UIView alloc]initWithFrame:CGRectMake(60, 100, SCREENW-65, 30)];
    [self.contentView addSubview:_songView];
    
    _bfButton =[UIButton buttonWithType:UIButtonTypeCustom];
    _bfButton.frame =CGRectMake(0, 0, 30, 30);
    [_bfButton setImage:[UIImage imageNamed:@"play_dynamic"] forState:UIControlStateNormal];
    [_songView addSubview:_bfButton];
    
    _songButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _songButton.frame = CGRectMake(30, 0, SCREENW-95, 30);
    _songButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _songButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_songButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _songButton.titleLabel.font =[UIFont systemFontOfSize:15];
    [_songButton addTarget:self action:@selector(playMusic) forControlEvents:UIControlEventTouchUpInside];
    [_songView addSubview:_songButton];
}
-(void)playMusic{
    NSString *type;
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    NSString * B = [numberFormatter stringFromNumber:[_songDic objectForKey:@"SongType"]];

    if ([ B isEqualToString:@"2"]) {
        type =@"fc";
    }else{
        type =@"yc";
    }
    PlayMusicController *playVC=[PlayMusicController sharePlayMusicViewWithSongType:type AndSongId:[_songDic objectForKey:@"BelongID"]];
    [_myVc.myParentVC.navigationController pushViewController:playVC animated:YES];
}
-(void)creatUIOnlyText{
    _contentLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 50, SCREENW-65, 50)];
    _contentLabel.numberOfLines =3;
    _contentLabel.font =[UIFont systemFontOfSize:15];
    _contentLabel.textColor =[UIColor grayColor];
    [self.contentView addSubview:_contentLabel];
    
    _imgView =[[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 100, 50)];
    _imgView.backgroundColor =MYGRAYCOLOR;
    [self.contentView addSubview:_imgView];
}
-(void)creatUIOnlyPic{
    _imgView =[[UIImageView alloc]initWithFrame:CGRectMake(60, 50, 100, 100)];
    _imgView.backgroundColor =MYGRAYCOLOR;
    [self.contentView addSubview:_imgView];
}
-(void)configCellWithModel:(DTGCModel *)model{
    [_picView setImageWithURL:[NSURL URLWithString:[model.user valueForKey:@"I"]]];
    _nameLabel.text =[model.user valueForKey:@"NN"];
    _timeLabel.text =[self getTimeLabelText:model.createtime];
    NSDictionary *dic =[self getDicWithString:model.content];
    _songDic =dic;
    
    NSNumber *comment =[dic objectForKey:@"Comments"];
    NSNumber *like =[dic objectForKey:@"Likes"];
    [_commentBtn setTitle:[NSString stringWithFormat:@"%d",comment.intValue] forState:UIControlStateNormal];
    [_likeBtn setTitle:[NSString stringWithFormat:@"%d",like.intValue] forState:UIControlStateNormal];
    
    NSInteger categroy =model.category.integerValue;
    if (categroy ==1) {
        _contentLabel.text =[dic valueForKey:@"Content"];
        [_songButton setTitle:[dic valueForKey:@"SongName"] forState:UIControlStateNormal];
        NSNumber *type =[dic objectForKey:@"SongType"];
        if (type.intValue ==1) {
            _songTypeLabel.text =@"上传了一首原创";
        }else{
            _songTypeLabel.text =@"上传了一首翻唱";
        }
    }else if (categroy ==3){
        _contentLabel.text =[dic valueForKey:@"Content"];
        [_imgView setImageWithURL:[NSURL URLWithString:[dic valueForKey:@"FileName"]]];
    }else if(categroy == 6){
        [_imgView setImageWithURL:[NSURL URLWithString:[dic valueForKey:@"FileName"]]];
    }
}
-(NSDictionary *)getDicWithString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
-(NSString *)getTimeLabelText:(NSNumber *)timeNumber{
    //由于数据给的不是从1970年开始算的，因此根据推算得到下面
    long long  time =timeNumber.longLongValue/10000000 -62167161000+365*86400;
    long long nowTime = [self getNowTime];
    //时间差
    long long sTime =nowTime-time;
    if (sTime <60) {
        return @"刚刚";
    }
    if (sTime<3600){
        return [NSString stringWithFormat:@"%lld分钟前",sTime/60];
    }
    if (sTime<86400) {
        return [NSString stringWithFormat:@"%lld小时前",sTime/3600];
    }
    if (sTime<2*86400) {
        return @"昨天";
    }
    return [self getDateString:time];
}
-(NSString *)getDateString:(long long)timeN{
    NSString *time =[NSString stringWithFormat:@"%lld",timeN];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY.MM.dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[time intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}
-(long long)getNowTime{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    
    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter1 setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter1 setDateFormat:@"YYYY-MM-dd HH:mm"];
    
     return (long long)[date timeIntervalSince1970];
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
