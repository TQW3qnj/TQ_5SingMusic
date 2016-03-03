//
//  TJItemCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TJItemsModel.h"
@interface TJItemCell : UITableViewCell
@property (nonatomic, strong)UIImageView *picView;
@property (nonatomic, strong)UILabel *titleLabel;
-(void)configCellWithModel:(TJItemsModel *)model;
@end
