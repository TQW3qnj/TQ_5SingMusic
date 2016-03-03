//
//  TQTabBarController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TQTabBarController.h"
#import "TQYueKuController.h"
#import "TQMusicianController.h"
#import "TQDongTaiController.h"
#import "TQProfileController.h"
#import "TQNavigationController.h"

@interface TQTabBarController ()

@end

@implementation TQTabBarController

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
    [self creatInit];
    // Do any additional setup after loading the view.
}
-(void)creatInit{
    //创建子标签
    
    //乐库
    [self createControllersWithTitle:@"乐库" Image:@"musicbox_normal.png" SelectedImage:@"musicbox_press.png" className:[TQYueKuController class]];
    
    //音乐人
    [self createControllersWithTitle:@"音乐人" Image:@"musican_normal" SelectedImage:@"musican_press" className:[TQMusicianController class]];
    
    //动态
    [self createControllersWithTitle:@"动态" Image:@"dynamic_normal" SelectedImage:@"dynamic_press" className:[TQDongTaiController class]];
    
    //我的
    [self createControllersWithTitle:@"我的" Image:@"my_normal" SelectedImage:@"my_press" className:[TQProfileController class]];
    
}
//提取公共方法
-(void)createControllersWithTitle:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectImage className:(Class)class{
    //创建vc
    UIViewController *vc =[[class alloc]init];
    //添加到nav
    vc.title =title;
    TQNavigationController *nav =[[TQNavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem.title=title;
    nav.tabBarItem.image =[[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage =[[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MYGREENCOLOR} forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
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
