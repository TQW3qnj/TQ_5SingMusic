//
//  MyInspiration.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "MyInspiration.h"

@implementation MyInspiration

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
    _myInspirLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-64*3-5)];
    _myInspirLabel.numberOfLines =0;
    _myInspirLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _myInspirLabel.textColor =MYGRAYCOLOR;
    _myInspirLabel.textAlignment =NSTextAlignmentCenter;
    _myInspirLabel.font = [UIFont systemFontOfSize:14];

    _myScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-64*3-5)];
    [_myScrollView addSubview:_myInspirLabel];
    [self addSubview:_myScrollView];

}
-(void)configMyViewWithStr:(NSString *)str{
    NSLog(@"%@",str);
    if ((NSNull *)str == [NSNull null]){
        _myInspirLabel.text =@"这个家伙太懒了，没有写灵感哦";
    }
    else{
        _myInspirLabel.text =str;
    }
    //UILabel自适应高度
    CGSize size = [_myInspirLabel sizeThatFits:CGSizeMake(_myInspirLabel.frame.size.width, MAXFLOAT)];
    
    _myInspirLabel.frame =CGRectMake(0, 0, SCREENW, size.height);
    _myScrollView.contentSize =_myInspirLabel.frame.size;
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
