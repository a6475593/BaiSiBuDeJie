//
//  WYKTabBar.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/26.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKTabBar.h"

@implementation WYKTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
 
    UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [publishButton setWidth:publishButton.currentBackgroundImage.size.width];
    [publishButton setHeight:publishButton.currentBackgroundImage.size.height];
    [publishButton setCenter:CGPointMake(width/2,height/2)];
    [self addSubview:publishButton];
    
    NSInteger index = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = width/5;
    CGFloat buttonH = height;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        [button setFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        index++;
        
    }
    
    
}
@end
