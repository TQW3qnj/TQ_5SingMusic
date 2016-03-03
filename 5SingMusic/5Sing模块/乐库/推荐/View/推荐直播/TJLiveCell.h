//
//  TJLiveCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TJLiveModel.h"
@interface TJLiveCell : UICollectionViewCell
@property (nonatomic,strong)UIImageView *picView;
@property (nonatomic,strong)UIImageView *typeView;
@property (nonatomic,strong)UILabel *audienceLabel;
@property (nonatomic,strong)UILabel *nickNameLabel;
@property (nonatomic,strong)UILabel *timeLabel;
-(void)configCellWithModel:(TJLiveModel *)model;
@end
