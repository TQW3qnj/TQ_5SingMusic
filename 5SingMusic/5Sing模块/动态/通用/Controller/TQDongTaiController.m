//
//  TQDongTaiController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQDongTaiController.h"
#import "DTDongTaiController.h"
#import "DTGuangChangController.h"
#import "MyBaseVCController.h"
@interface TQDongTaiController ()

@end

@implementation TQDongTaiController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.leftBtnType =@"write";
         self.btnTitleArray =[[NSMutableArray alloc]initWithArray:@[@"广场",@"动态"]];
        self.vcClassArray =[[NSMutableArray alloc]initWithArray:@[[DTGuangChangController class],[DTDongTaiController class]]];
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
