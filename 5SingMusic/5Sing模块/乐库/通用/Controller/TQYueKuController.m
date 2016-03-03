//
//  TQYueKuController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQYueKuController.h"
#import "YKTuiJianController.h"
#import "YKGeDanController.h"
#import "YKPaiHangBangController.h"
#import "MyBaseVCController.h"
@interface TQYueKuController ()

@end

@implementation TQYueKuController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.leftBtnType =@"search";
        self.btnTitleArray =[[NSMutableArray alloc]initWithArray:@[@"推荐",@"歌单",@"排行榜"]];
        self.vcClassArray =[[NSMutableArray alloc]initWithArray:@[[YKTuiJianController class],[YKGeDanController class],[YKPaiHangBangController class]]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (MyBaseVCController *vc in self.VCArray) {
        vc.myParentVC =self;
    }
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
