//
//  TJCommonView.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJCommonView.h"

@implementation TJCommonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *tipLabel =[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, 20)];
        tipLabel.text =self.tipTitle;
        tipLabel.textColor =MYGREENCOLOR;
        tipLabel.font =[UIFont systemFontOfSize:15];
        [self addSubview:tipLabel];
    }
    return self;
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
