//
//  WYKTagsCell.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/29.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKTagsCell.h"
#import "WYKRecommendTag.h"
#import <UIImageView+WebCache.h>

@implementation WYKTagsCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    }



-(void)setRecommendTags:(WYKRecommendTag *)recommendTags{
    _recommendTags = recommendTags;
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:_recommendTags.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = _recommendTags.theme_name;
    NSString *subnumber = nil;
    if (_recommendTags.sub_number < 10000) {
       subnumber = [NSString stringWithFormat:@"%zd人订阅",_recommendTags.sub_number];
    }else{
        subnumber = [NSString stringWithFormat:@"%.2f万人订阅",_recommendTags.sub_number/10000.0];
    }
    self.subNumberLabel.text = subnumber;
}

@end
