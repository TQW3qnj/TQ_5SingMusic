//
//  DetailNavView.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DetailNavView.h"
#import "PlayMusicController.h"
@implementation DetailNavView

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
    _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(40, 25, SCREENW-80, 30)];
    _titleLabel.font =[UIFont boldSystemFontOfSize:17];
    _titleLabel.textAlignment =NSTextAlignmentCenter;
    _titleLabel.textColor =MYGREENCOLOR;
    [self addSubview:_titleLabel];
    
    //  右侧按钮
    _rightButton =[self creatButtonWithFrame:CGRectMake(SCREENW-35, 25, 30, 30) Image:@"music6" SelectImage:@"music6" SuperView:self];
    [_rightButton addTarget:self action:@selector(listenMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    _leftButton =[self creatButtonWithFrame:CGRectMake(5, 25, 30, 30) Image:@"back_normal" SelectImage:@"back_press" SuperView:self];
    [_leftButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark --rightBtn点击事件
-(void)listenMusic:(UIButton *)sender{
    PlayMusicController *play =[PlayMusicController sharePlayMusicViewWithSongType:NULL AndSongId:NULL];
    [self.MyParentVC.navigationController pushViewController:play animated:YES];
}
-(void)back:(UIButton *)sender{
    [self.MyParentVC.navigationController popViewControllerAnimated:YES];
}

#pragma mark --封装的一个创建button方法
-(UIButton *)creatButtonWithFrame:(CGRect)frame Image:(NSString *)image SelectImage:(NSString *)selectImage SuperView:(UIView *)view{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [view addSubview:button];
    return button;
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
