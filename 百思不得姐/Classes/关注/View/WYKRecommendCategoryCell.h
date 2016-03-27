//
//  WYKRecommendCategoryCell.h
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/27.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYKRecommendCategory;
@interface WYKRecommendCategoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

/** 类别模型 **/
@property (nonatomic,strong) WYKRecommendCategory *category;

@end
