//
//  MyLyricView.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyLyricView.h"

@implementation MyLyricView

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
    _myLyricLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-64*3-5)];
    _myLyricLabel.numberOfLines =0;
    _myLyricLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _myLyricLabel.textColor =MYGRAYCOLOR;
    _myLyricLabel.textAlignment =NSTextAlignmentCenter;
    _myLyricLabel.font = [UIFont systemFontOfSize:14];

    
    _myScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-64*3-5)];
    [_myScrollView addSubview:_myLyricLabel];
    [self addSubview:_myScrollView];
}
-(void)configMyViewWithStr:(NSString *)str{
    if ((NSNull *)str == [NSNull null]) {
        _myLyricLabel.text =@"暂无歌词";
    }
    else{
        _myLyricLabel.text =str;
    }
    //UILabel自适应高度
    CGSize size = [_myLyricLabel sizeThatFits:CGSizeMake(_myLyricLabel.frame.size.width, MAXFLOAT)];

    _myLyricLabel.frame =CGRectMake(0, 0, SCREENW, size.height);
    _myScrollView.contentSize =_myLyricLabel.frame.size;
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
