//
//  WYKRecommendCategoryCell.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/27.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKRecommendCategoryCell.h"
#import "WYKRecommendCategory.h"

@implementation WYKRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = WYKRGBColor(244, 244, 244, 1);
    
    UIView *bg = [[UIView alloc] init];
    [bg setBackgroundColor:[UIColor clearColor]];
    self.selectedBackgroundView = bg;
    
    
    
    
}
- (void)setCategory:(WYKRecommendCategory *)category{
    _category = category;
    self.textLabel.text = _category.name;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.y = 1;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : WYKRGBColor(78, 78, 78, 1);
}




















@end
