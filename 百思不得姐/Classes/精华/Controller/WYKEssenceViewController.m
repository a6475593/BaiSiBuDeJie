//
//  WYKEssenceViewController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/26.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKEssenceViewController.h"
#import "WYKRecommendTagsTableViewController.h"
@interface WYKEssenceViewController ()

@end

@implementation WYKEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.view.backgroundColor = WYKGlobalColor;


}

- (void)tagClick{
    WYKRecommendTagsTableViewController *vc = [[WYKRecommendTagsTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];


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
