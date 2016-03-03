//
//  TQDetailBaseController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQDetailBaseController.h"

@interface TQDetailBaseController ()

@end

@implementation TQDetailBaseController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden =YES;
    self.tabBarController.tabBar.hidden =YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden =NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatMyNavUI];
    // Do any additional setup after loading the view.
}
-(void)creatMyNavUI{
    //自定义导航栏
    _navView =[[DetailNavView alloc]initWithFrame:CGRectMake(0, 0,SCREENW , 64)];
    _navView.titleLabel.text =self.midTitle;
    _navView.MyParentVC =self;
    _navView.backgroundColor = MYGRAYCOLOR;
    [self.view addSubview:_navView];
}
-(void)refreshMyTitle{
    _navView.titleLabel.text =self.midTitle;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
