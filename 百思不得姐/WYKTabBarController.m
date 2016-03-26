//
//  WYKTabBarController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/26.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKTabBarController.h"

@interface WYKTabBarController ()

@end

@implementation WYKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selectedattrs = [NSMutableDictionary dictionary];
    selectedattrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectedattrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    UIViewController *vc01 = [[UIViewController alloc] init];
    vc01.tabBarItem.title = @"精华";
    vc01.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    vc01.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    vc01.view.backgroundColor = [UIColor redColor];
    [vc01.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc01.tabBarItem setTitleTextAttributes:selectedattrs forState:UIControlStateSelected];
    [self addChildViewController:vc01];
    UIViewController *vc02 = [[UIViewController alloc] init];
    vc02.tabBarItem.title = @"新帖";
    vc02.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    vc02.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    vc02.view.backgroundColor = [UIColor redColor];
    [vc02.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc02.tabBarItem setTitleTextAttributes:selectedattrs forState:UIControlStateSelected];
    [self addChildViewController:vc02];
    
    UIViewController *vc03 = [[UIViewController alloc] init];
    vc03.tabBarItem.title = @"关注";
    vc03.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    vc03.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    vc03.view.backgroundColor = [UIColor redColor];
    [vc03.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc03.tabBarItem setTitleTextAttributes:selectedattrs forState:UIControlStateSelected];
    [self addChildViewController:vc03];
    
    UIViewController *vc04 = [[UIViewController alloc] init];
    vc04.tabBarItem.title = @"我的";
    vc04.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc04.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
    vc04.view.backgroundColor = [UIColor redColor];
    [vc04.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [vc04.tabBarItem setTitleTextAttributes:selectedattrs forState:UIControlStateSelected];
    [self addChildViewController:vc04];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
