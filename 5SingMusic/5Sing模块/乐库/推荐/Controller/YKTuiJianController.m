//
//  YKTuiJianController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "YKTuiJianController.h"
#import "AFNetworking.h"

#import "TJDayView.h"
#import "TJGeDan.h"
#import "TJLive.h"
#import "TJItems.h"
#import "TJAdvertView.h"

@interface YKTuiJianController (){
    UITableView *_myTableView;
    UIScrollView *_myScrollView;
}
@end

@implementation YKTuiJianController

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
    [self creatHeaderView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)creatHeaderView{
    _myScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH-113)];
    _myScrollView.contentSize =CGSizeMake(SCREENW, 660);
    _myScrollView.contentOffset =CGPointZero;
    [self.view addSubview:_myScrollView];
    
    TJAdvertView *tjAd=[[TJAdvertView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 120)];
    tjAd.MyParentVC =self;
    [_myScrollView addSubview:tjAd];
    
    TJDayView *tjDayView =[[TJDayView alloc]initWithFrame:CGRectMake(0, 120, SCREENW, 120)];
    tjDayView.MyParentVC =self;
    [_myScrollView addSubview:tjDayView];
    
    TJGeDan *tjGeDan =[[TJGeDan alloc]initWithFrame:CGRectMake(0, 240, SCREENW, 140)];
    tjGeDan.MyParentVC =self;
    [_myScrollView addSubview:tjGeDan];
    
    TJLive *tjLive =[[TJLive alloc]initWithFrame:CGRectMake(0, 380, SCREENW, 130)];
    tjLive.MyParentVC =self;
    [_myScrollView addSubview:tjLive];
    
    TJItems *tjItems =[[TJItems alloc]initWithFrame:CGRectMake(0, 510, SCREENW, 150)];
    tjItems.MyParentVC =self;
    [_myScrollView addSubview:tjItems];
   
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
