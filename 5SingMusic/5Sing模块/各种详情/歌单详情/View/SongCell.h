//
//  SongCell.h
//  5SingMusic
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongCell : UITableViewCell
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *singerLabel;
@property (nonatomic,strong) UIImageView *bfView;
-(void)cellConfigWith:(NSDictionary *) dic;
@end
