//
//  MyCurrentSongCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCurrentSongCell : UITableViewCell
@property (nonatomic,strong) UILabel *songLabel;
@property (nonatomic,strong) UIButton *downLoadBtn;
@property (nonatomic,strong) NSDictionary *songDic;
-(void)configCellWithDic:(NSDictionary *)dic AndIndex:(NSInteger)index;
@end
