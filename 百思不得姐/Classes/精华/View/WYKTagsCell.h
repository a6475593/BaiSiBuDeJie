//
//  WYKTagsCell.h
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/29.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYKRecommendTag;



@interface WYKTagsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;
@property (nonatomic,strong) WYKRecommendTag *recommendTags;
@property (weak, nonatomic) IBOutlet UIButton *RecommendButton;

@end
