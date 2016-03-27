//
//  WYKNavigationController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/27.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKNavigationController.h"

@implementation WYKNavigationController

+ (void)initialize{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //WhenContainedIn:[self class], nil
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
        [button setSize:CGSizeMake(100, 33)];
        [button setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = true;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)goback{
    [self popViewControllerAnimated:true];
}

@end
