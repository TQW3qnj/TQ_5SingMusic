//
//  TJItemCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJItemCell.h"
#import "UIImageView+AFNetworking.h"
@implementation TJItemCell

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
    self.picView =[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
    [self.contentView addSubview:self.picView];
    
    self.titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(40, 10, SCREENW-70, 20)];
    self.titleLabel.font =[UIFont systemFontOfSize:15];
    self.titleLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:self.titleLabel];
}
-(void)configCellWithModel:(TJItemsModel *)model{
    [self.picView setImageWithURL:[NSURL URLWithString:model.ImgUrl]];
    self.titleLabel.text =model.Title;
    self.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
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
