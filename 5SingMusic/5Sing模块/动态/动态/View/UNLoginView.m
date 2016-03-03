//
//  UNLoginView.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "UNLoginView.h"
#import "LoginController.h"
#import "RegisterController.h"
#import "TQProfileController.h"
@implementation UNLoginView

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
    UIImageView *bgView =[[UIImageView alloc]initWithFrame:CGRectMake(100, 80, SCREENW-200, 150)];
    [bgView setImage:[UIImage imageNamed:@"LoginBB"]];
    [self addSubview: bgView];
    
    NSArray *array =@[@"登录",@"注册"];
    for (int i = 0; i<2; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        
        if (i == 0) {
            [btn setBackgroundColor:MYGREENCOLOR];
        }else{
            [btn setBackgroundColor:[UIColor blueColor]];
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.frame =CGRectMake(20+i*(SCREENW-30)/2, 280, (SCREENW-60)/2, 30);
        btn.layer.cornerRadius =5;
        btn.layer.masksToBounds =YES;
        
        btn.tag =100+i;
        [btn addTarget: self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }

}
-(void)click:(UIButton *)sender{
    if (sender.tag ==100) {
        LoginController *loginVC =[[LoginController alloc]init];
        if ([self.myVC isKindOfClass:[TQProfileController class]] ) {
            [self.myVC.navigationController pushViewController:loginVC animated:YES];
        }else {
            [self.MyParentVC.myParentVC.navigationController pushViewController:loginVC animated:YES];
        }
    }
    else{
        RegisterController *registerVC =[[RegisterController alloc]init];
        if ([self.myVC isKindOfClass:[TQProfileController class]] ) {
            [self.myVC.navigationController pushViewController:registerVC animated:YES];
        }else {
            [self.MyParentVC.myParentVC.navigationController pushViewController:registerVC animated:YES];
        }

    }
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
