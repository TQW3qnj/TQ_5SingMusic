//
//  TJGeDan.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#import "TJCommonView.h"

@interface TJGeDan : TJCommonView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *myCollectionView;
@property (nonatomic,strong)NSMutableArray * GDDataArray;
@end
