//
//  GeDanCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeDanModel.h"
#import "TJGeDanModel.h"
@interface GeDanCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *picView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *numLabel;
-(void)configCellWithModel:(GeDanModel *)model;
-(void)configCellWithTJModel:(TJGeDanModel *)model;
@end
