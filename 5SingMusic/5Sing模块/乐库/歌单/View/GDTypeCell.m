//
//  GDTypeCell.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "GDTypeCell.h"

@implementation GDTypeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.typeLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 12, 80, 20)];
        self.contentView.backgroundColor =[UIColor whiteColor];
        //self.selectedBackgroundView.backgroundColor =MYGRAYCOLOR2;
        self.typeLabel.textColor =MYGREENCOLOR;
        self.typeLabel.font=[UIFont boldSystemFontOfSize:15];
        self.typeLabel.textAlignment =NSTextAlignmentCenter;
        [self.contentView addSubview:self.typeLabel];
    }
    return self;
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
