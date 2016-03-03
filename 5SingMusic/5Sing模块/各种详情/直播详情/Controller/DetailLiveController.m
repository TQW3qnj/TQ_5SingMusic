//
//  DetailLiveController.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "DetailLiveController.h"

@interface DetailLiveController ()

@end

@implementation DetailLiveController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)creatUI{
    _myLiveView =[[MyLiveView alloc]initWithFrame:CGRectMake(0,64, SCREENW, SCREENH/2)];
    _myLiveView.backgroundColor =[UIColor grayColor];
    _myLiveView.MyParentVC =self;
    [self.view addSubview:_myLiveView];
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
