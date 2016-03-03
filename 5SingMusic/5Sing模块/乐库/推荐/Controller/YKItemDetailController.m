//
//  YKItemDetailController.m
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "YKItemDetailController.h"

@interface YKItemDetailController ()

@end

@implementation YKItemDetailController

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
    [self creatWebView];
    // Do any additional setup after loading the view.
}
-(void)creatWebView{
    
    //创建一个全屏的webview
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, SCREENW, SCREENH-64)];
    
    NSURL *url = [NSURL URLWithString:self.Url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //加载一个request
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
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
