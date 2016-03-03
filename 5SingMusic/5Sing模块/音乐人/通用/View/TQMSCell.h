//
//  TQMSCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMSModel.h"
#import "MyBaseVCController.h"
@interface TQMSCell : UITableViewCell
@property (nonatomic,strong)UIImageView *picView;
@property (nonatomic,strong)UILabel *namelabel;
@property (nonatomic,strong)UILabel *RQLabel;//人气
@property (nonatomic,strong)UILabel *typeLabel;
@property (nonatomic,strong)UIButton *songbtn;
@property (nonatomic,strong)UIButton *gzBtn;//关注
@property (nonatomic,strong)UIButton *bfBtn;//播放
@property (nonatomic,strong)TQMSModel *MSModel;
@property (nonatomic,strong)MyBaseVCController *myVc;
-(void)configCellWithModel:(TQMSModel *)model;
@end
