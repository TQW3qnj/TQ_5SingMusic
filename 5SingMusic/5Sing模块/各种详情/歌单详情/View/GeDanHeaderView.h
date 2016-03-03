//
//  GeDanHeaderView.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MyCommonView.h"
#import "DetailGDModel.h"
@interface GeDanHeaderView : MyCommonView
@property (nonatomic,strong) UIImageView *bgview;
@property (nonatomic,strong) UIView *GrayView;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *likeBtn;
@property (nonatomic,strong) UIButton *shareBtn;
@property (nonatomic,strong) UIButton *bfBtn;
@property (nonatomic,strong) UILabel *TextLabel;
@property (nonatomic,strong) UILabel *TypeLabel;
-(void)ConfigWithModel:(DetailGDModel *)model;
@end
