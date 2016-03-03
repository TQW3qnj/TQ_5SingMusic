//
//  TQProfileController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQProfileController.h"

@interface TQProfileController ()

@end

@implementation TQProfileController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.leftBtnType =@"search";
         self.btnTitleArray =[[NSMutableArray alloc]initWithArray:@[@"我的"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)creatUI{
    _unLoginView = [[UNLoginView alloc]initWithFrame:CGRectMake(0, 64, SCREENW, SCREENH-113)];
    _unLoginView.myVC =self;
    [self.view addSubview:_unLoginView];

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
