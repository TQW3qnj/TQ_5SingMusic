//
//  LoginController.m
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "LoginController.h"
#import "AFNetworking.h"
@interface LoginController ()

@end

@implementation LoginController

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
    self.view.backgroundColor =MYGRAYCOLOR;
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden =YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden =NO;
}
-(void)creatUI{
    UIButton *backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame =CGRectMake(0, 20, 20, 20);
    [backBtn setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imgView =[[UIImageView alloc]initWithFrame:CGRectMake(SCREENW/4, 64, SCREENW/2, 64)];
    [imgView setImage:[UIImage imageNamed:@"logo"]];
    [self.view addSubview:imgView];
    
    UIView *inputView = [[UIView alloc]initWithFrame:CGRectMake(5, 180, SCREENW-10, 80)];
    inputView.layer.cornerRadius =5;
    inputView.layer.masksToBounds =YES;
    [self.view addSubview:inputView];
    
    _nameField =[[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREENW-10,40)];
    //设置样式
    _nameField.borderStyle = UITextBorderStyleRoundedRect;
    //设置占位符
    _nameField.placeholder =@"邮箱/手机号/通行证";
    //设置清楚按钮
    _nameField.clearButtonMode =UITextFieldViewModeAlways;
    [inputView addSubview:_nameField];
    
    _passWordField =[[UITextField alloc]initWithFrame:CGRectMake(0, 40, SCREENW-10, 40)];
    //设置样式
    _passWordField.borderStyle = UITextBorderStyleRoundedRect;
    //设置占位符
    _passWordField.placeholder =@"密码";
    
    //设置清楚按钮
    _passWordField.clearButtonMode =UITextFieldViewModeAlways;
    //设置保密
    _passWordField.secureTextEntry = YES;
    
    [inputView addSubview:_passWordField];
    
    UIButton *loginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame =CGRectMake(5, 280, SCREENW-10, 40);
    loginBtn.backgroundColor =MYGREENCOLOR;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
}
-(void)login{
    [SVProgressHUD show];
    
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:LOGIN_URL,_nameField.text,_passWordField.text] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        id success =[rootDic valueForKey:@"success"];
        BOOL isSuccess =(BOOL)success;
        if (isSuccess == YES) {
            [SVProgressHUD dismissWithSuccess:@"登录成功" afterDelay:0.3];
        }else{
            [SVProgressHUD dismissWithError:@"用户名或密码错误" afterDelay:0.3];
        }
                //消除提示框
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismissWithError:@"网络错误" afterDelay:0.3];
        NSLog(@"%@",error);
    }];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
