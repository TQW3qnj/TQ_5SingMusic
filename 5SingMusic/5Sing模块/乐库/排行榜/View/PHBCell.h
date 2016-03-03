//
//  PHBCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/8.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHBModel.h"
@interface PHBCell : UITableViewCell
@property (nonatomic,strong)UIImageView *picView;
@property (nonatomic,strong)UILabel *TipLabel;
@property (nonatomic,strong)UILabel *Label1;
@property (nonatomic,strong)UILabel *Label2;
@property (nonatomic,strong)UILabel *Label3;
@property (nonatomic,strong)UILabel *Label4;
-(void)configCellWithModel:(PHBModel *)model;
@end
