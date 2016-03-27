//
//  WYKTabBar.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/26.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKTabBar.h"

@implementation WYKTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UITabBar *tabbar = [UITabBar appearance];
        [tabbar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton setSize:publishButton.currentBackgroundImage.size];
        self.publishButton = publishButton;
        [self addSubview:self.publishButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width;
    CGFloat height = self.height;
    [self.publishButton setCenter:CGPointMake(width/2,height/2)];
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
