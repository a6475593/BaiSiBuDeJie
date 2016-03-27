//
//  WYKFriendTrendsViewController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/26.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKFriendTrendsViewController.h"

@interface WYKFriendTrendsViewController ()

@end

@implementation WYKFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的关注"];
    
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    self.view.backgroundColor = WYKGlobalColor;

}


- (void)friendsClick{
    WYKLogFUNC;
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
