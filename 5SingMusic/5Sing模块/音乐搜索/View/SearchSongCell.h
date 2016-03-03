//
//  SearchSongCell.h
//  5SingMusic
//
//  Created by tangquan on 16/2/9.
//  Copyright © 2016年 TangQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchSongCell : UITableViewCell
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *songNameLabel;
@property (nonatomic,strong) UILabel *singerLabel;
@property (nonatomic,strong) UILabel *popularityLabel;
@property (nonatomic,strong) UIImageView *bfView;
-(void)cellConfigWith:(NSDictionary *) dic;
@end
