//
//  WYKRecommendCategory.h
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/27.
//  Copyright © 2016年 王玉琨. All rights reserved.
// 推荐关注 左边的数据模型

#import <Foundation/Foundation.h>

@interface WYKRecommendCategory : NSObject


/** id **/
@property (nonatomic,assign) NSInteger id;
/** 总数 **/
@property (nonatomic,assign) NSInteger count;
/** 总数 **/
@property (nonatomic,copy) NSString *name;


@end
