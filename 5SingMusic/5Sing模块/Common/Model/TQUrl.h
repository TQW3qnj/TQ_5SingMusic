//
//  TQUrl.h
//  5SingMusic
//
//  Created by qianfeng on 15/9/28.
//  Copyright (c) 2015年 TangQuan. All rights reserved.
//

#ifndef _SingMusic_TQUrl_h
#define _SingMusic_TQUrl_h

//1推荐
// 每日推荐
#define TjdayUrl @"http://5sing.shuoba.org/getRecommendDailyList"
//歌单
#define TjGeDanUrl @"http://5sing.shuoba.org/getRecommendSongList?tag=91&version=5.8.0"
//广告栏
#define TjADVUrl @"http://5sing.shuoba.org/getAdvert?t=101&tag=213&version=5.8.0"
//专题
#define TjZhuanTiUrl @"http://5sing.shuoba.org/getTheme?t=101&o1=1&o2=3&tag=65&version=5.8.0"
//直播
#define TjLiveUrl @"http://5singlive.kugou.com/api.php?action=Mobile&fun=getLiveNew&sign=null"
//直播详情
#define LIVE_DETAIL @""

//2歌单
//歌单详情
#define GEDAN_TOP @"http://mobileapi.5sing.kugou.com/song/getsonglist?id=%@&version=5.8.0"
#define GEDAN_ISCOLLECT @"http://mobileapi.5sing.kugou.com/song/songlistcollectioncheck?id=%@&sign=%@&version=5.8.0"
#define GEDAN_DETAIL  @"http://mobileapi.5sing.kugou.com/song/getsonglistsong?id=%@&songfields=ID,SN,FN,SK,SW,SS,ST,SI,CT,M,S,ZQ,WO,ZC,HY,YG,CK,D,RQ,DD,E,R,RC,SG,C,CS,LV,LG,SY,UID,PT,SCSR,SC&userfields=ID,NN,I&version=5.8.0"


//单曲
#define DANQU_DETAIL @"http://mobileapi.5sing.kugou.com/song/newget?songfields=ID,SN,FN,SK,SW,SS,ST,SI,CT,M,S,ZQ,WO,ZC,HY,YG,CK,D,RQ,DD,E,R,RC,SG,C,CS,LV,LG,SY,UID,PT,SCSR,SC&songtype=%@&songid=%@&userfields=ID,NN,I"
//支持表
#define DANQU_FANSLIST @"http://mobileapi.5sing.kugou.com/song/listforsupportcardfans?songid=%@&limit=0&songtype=%@&fields=ID,NN,I,SC&version=5.8.0"
//评论
#define DANQU_COMMENT @"http://mobileapi.5sing.kugou.com/comments/list?maxId=0&limit=20&rootId=%@&rootKind=%@&fields=ID,NN,I&version=5.8.0"


//推荐
//http://5sing.shuoba.org/getSongListSquareRecommended?index=1&version=5.8.0
//小清新
#define GDTypeUrl @"http://5sing.shuoba.org/search/songSquare?label=%@&sortType=%@&pn=1&ps=10&version=5.8.0"
//最新 Type=1
//最热 type =2
//
//3排行榜
#define PHBUrl  @"http://mobileapi.5sing.kugou.com/rank/list?count=4&version=5.8.0"
//排行榜详情
#define DetailPHB @"http://mobileapi.5sing.kugou.com/rank/detail?id=%@&pagesize=50&pageindex=1&songfields=ID,SN,FN,SK,SW,SS,ST,SI,CT,M,S,ZQ,WO,ZC,HY,YG,CK,D,RQ,DD,E,R,RC,SG,C,CS,LV,LG,SY,UID,PT,SCSR,SC&userfields=ID,NN,I&version=5.8.0"
//
//搜索
//下面显示的
//http://mobileapi.5sing.kugou.com/song/hottag?limit=10&version=5.8.0
//tfboys
#define SEARCH_TEXT @"http://5sing.shuoba.org/search/search?k=%@&t=0&filterType=1&pn=1&ps=20&sortType=0&version=5.8.0"


//音乐人
//推荐
#define TjMusician @"http://mobileapi.5sing.kugou.com/user/listmusician?userid=0&pagesize=10&pageindex=1&fields=ID,NN,I,M,YCRQ,FCRQ&from=androidPhone&songfields=ID,SN,FN,SK,SW,SS,ST,SI,CT,M,S,ZQ,WO,ZC,HY,YG,CK,D,RQ,DD,E,R,RC,SG,C,CS,LV,LG,SY,UID,PT,SCSR,SC&version=5.8.0"
//新入住
#define NewMusician @"http://mobileapi.5sing.kugou.com/musician/latestList?userid=0&pagesize=8&pageindex=1&fields=ID,NN,I,M,YCRQ,FCRQ&from=androidPhone&songfields=ID,SN,FN,SK,SW,SS,ST,SI,CT,M,S,ZQ,WO,ZC,HY,YG,CK,D,RQ,DD,E,R,RC,SG,C,CS,LV,LG,SY,UID,PT,SCSR,SC&version=5.8.0"
//名人堂
#define MRT_ZHB_Musician @"http://5sing.shuoba.org/getRank?t=1&o1=1&o2=10&version=5.8.0"
#define MRT_YB_Musician @"http://5sing.shuoba.org/getRank?t=2&o1=1&o2=10&version=5.8.0"
#define MRT_ZOB_Musician @"http://mobileapi.5sing.kugou.com/musician/hotList?userid=0&pagesize=10&pageindex=1&fields=ID,NN,I,M,YCRQ,FCRQ&from=androidPhone&songfields=ID,SN,FN,SK,SW,SS,ST,SI,CT,M,S,ZQ,WO,ZC,HY,YG,CK,D,RQ,DD,E,R,RC,SG,C,CS,LV,LG,SY,UID,PT,SCSR,SC&version=5.8.0"

//动态
//广场
#define DT_GC_ZR @"http://mobileapi.5sing.kugou.com/message/square?pageindex=1&pagesize=20&ordering=2&fields=ID,NN,I&version=5.8.0"
#define DT_GC_ZX @"http://mobileapi.5sing.kugou.com/message/square?pageindex=1&pagesize=20&ordering=0&fields=ID,NN,I&version=5.8.0"

//登录
#define LOGIN_URL @"http://mobileapi.5sing.kugou.com/user/login?username=%@&password=%@&sign=247145E51415CFFE7630983AEE5D531A&from=androidPhone&version=5.8.0"

#endif
