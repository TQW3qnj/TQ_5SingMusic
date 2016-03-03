//
//  DTGCCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTGCModel.h"
#import "TQBtn.h"
#import "MyBaseVCController.h"
@interface DTGCCell : UITableViewCell
@property (nonatomic,strong) UIImageView *picView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *songTypeLabel;
@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) TQBtn *commentBtn;
@property (nonatomic,strong) TQBtn *likeBtn;

@property (nonatomic,strong) UIButton *bfButton;
@property (nonatomic,strong) UIButton *songButton;
@property (nonatomic,strong) UIView *songView;
@property (nonatomic,strong) UIView *TextView;
@property (nonatomic,strong) NSDictionary *songDic;
@property (nonatomic,strong)MyBaseVCController *myVc;
-(void)configCellWithModel:(DTGCModel *)model;
@end
