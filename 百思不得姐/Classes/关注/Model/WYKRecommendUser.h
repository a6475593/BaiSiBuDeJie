//
//  WYKRecommendUser.h
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/28.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYKRecommendUser : NSObject
/** 头像 **/
@property (nonatomic,copy) NSString *header;
/** 粉丝 **/
@property (nonatomic,assign) NSInteger fans_count;
/** 昵称 **/
@property (nonatomic,strong) NSString *screen_name;

@end
