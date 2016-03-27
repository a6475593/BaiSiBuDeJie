//
//  WYKRecommendUserCell.h
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/28.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYKRecommendUser;
@interface WYKRecommendUserCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

/** 用户模型 **/
@property (nonatomic,strong) WYKRecommendUser *user;

@end
