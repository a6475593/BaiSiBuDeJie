//
//  WYKRecommendUserCell.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/28.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKRecommendUserCell.h"
#import "WYKRecommendUser.h"
#import <UIImageView+WebCache.h>
@implementation WYKRecommendUserCell


- (void)setUser:(WYKRecommendUser *)user{
    _user = user;
    self.screenNameLabel.text = _user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注",_user.fans_count];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:_user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
